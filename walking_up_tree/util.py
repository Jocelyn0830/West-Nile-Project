import csv

def TabulateNames(tree):
    names = {}
    for idx, clade in enumerate(tree.find_clades()):
        if clade.name:
            clade.name = "%d_%s" % (idx, clade.name)
        else:
            clade.name = str(idx)
        names[clade.name] = clade
    return names

def ParseCsv(filename):
    env_dict = {}
    with open (filename, encoding='utf-8-sig') as file:
        reader = csv.DictReader(file)
        for row in reader:
            strain = row['Name']
            env_dict[strain.replace('*', '')] = {'Group': row['group']}
    
    return(env_dict)

def BranchGroupMatrix(env_dict, branch_dict):

    groups_0 = {
    "Aedes and Ochlerotatus": 0,
    "Anopheles": 0,
    "Culex": 0,
    "Culiseta": 0,
    "Psorophora and Coquillettidia": 0,
    "Accipitriformes": 0,
    "Strigiformes": 0,
    "Falconiformes": 0,
    "Passeriformes": 0,
    "Charadriiformes": 0,
    "Columbiformes": 0,
    "Anseriformes": 0,
    "Other Birds": 0,
    "American Crow": 0,
    "Blue Jay": 0
    }

    groups_1 = {
    "Aedes and Ochlerotatus": 0,
    "Anopheles": 0,
    "Culex": 0,
    "Culiseta": 0,
    "Psorophora and Coquillettidia": 0,
    "Accipitriformes": 0,
    "Strigiformes": 0,
    "Falconiformes": 0,
    "Passeriformes": 0,
    "Charadriiformes": 0,
    "Columbiformes": 0,
    "Anseriformes": 0,
    "Other Birds": 0,
    "American Crow": 0,
    "Blue Jay": 0
    }

    lis0 = branch_dict['0']
    for strain in lis0:
        strain_dict = env_dict[strain]
        group = strain_dict.get('Group',0)
        if group:
            groups_0[group] += 1

    lis1 = branch_dict['1']
    for strain in lis1:
        strain_dict = env_dict[strain]
        group = strain_dict.get('Group',1)
        if group:
            groups_1[group] += 1

    group_matrix = []
    group_0 = []
    group_1 = []
    for group, num in groups_0.items():
        group_0.append(num)
    group_matrix.append(group_0)

    for group, num in groups_1.items():
        group_1.append(num)
    group_matrix.append(group_1)

    return (group_matrix)

def write_matrix(branch, matrix, type):
    newfilename = "matrix/" + branch + '_' + type + '_matrix.csv'
    file = open(newfilename, "w")
    writer = csv.writer(file)
    if type == "group":
        writer.writerow(["Aedes and Ochlerotatus",
            "Anopheles",
            "Culex",
            "Culiseta",
            "Psorophora and Coquillettidia",
            "Accipitriformes",
            "Strigiformes",
            "Falconiformes",
            "Passeriformes",
            "Charadriiformes",
            "Columbiformes",
            "Anseriformes",
            "Other Birds",
            "American Crow",
            "Blue Jay"])
    for row in matrix:
        writer.writerow(row)


def writeBonCsv(variable):
    branch_p = {}
    with open (variable + ".txt") as file:
        for row in file:
            branch = row.split("_")[0]
            p_value = row.split("_")[1].replace("\n", '')
            branch_p[branch] = p_value

    branch_p = {k: v for k, v in sorted(branch_p.items(), key=lambda item: item[1])}
    k = len(branch_p)
    # k = 1

    new_values = []
    for branch, p in branch_p.items():
        alpha_value = 0.05 / k
        k -= 1
        # k += 1
        if float(p) < alpha_value:
            significant = "y"
        else: 
            significant = "n"
        temp_dict = { "branch_name" : branch, "p_value" : p, "alpha_value" : alpha_value, "significant?" : significant }
        new_values.append(temp_dict)

    newfilename = variable + "_bon.csv"
    file = open(newfilename, "w")
    writer = csv.DictWriter(file, fieldnames = ["branch_name", "p_value", "alpha_value", "significant?"])
    writer.writeheader()
    for elt in new_values:
        writer.writerow(elt)