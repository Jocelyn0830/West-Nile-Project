# a function to convert fasta file to dict
def fasta2dict(file):
    dic = {}
    cur_id = ''
    cur_seq = []
    for line in open(file):
        if line.startswith(">") and cur_id == '':
            cur_id = line.split(' ')[0].strip()
        elif line.startswith(">") and cur_id != '':
            dic[cur_id] = ''.join(cur_seq)
            cur_id = line.split(' ')[0].strip()
            cur_seq = []
        else:
            cur_seq.append(line.rstrip())
    dic[cur_id] = ''.join(cur_seq)
    return dic

# generate a file with accession numbers of partial genomes
def removeP(filename):
    dic = fasta2dict(filename)
    dic_num = {}
    lis = list(dic.items())
    possible_p = []
    for elt in lis:
        count = 0
        for char in elt[1].lower():
            if (char == "a") or (char == "c") or (char == "t") or (char == "g"):
                count += 1
        dic_num[elt[0]] = count
        if count <= 10000:
            possible_p.append(elt[0])
    return possible_p

def removeSuffix(filename):
    if '.fa' in filename:
        filename = filename.replace('.fa','')
    elif '.txt' in filename:
        filename = filename.replace('.txt','')
    elif '.fasta' in filename:
        filename = filename.replace('.fasta','')

    return filename

# create a new fasta file with partial genomes removed
def createNoP(filename, possible_p):
    dic = fasta2dict(filename)
    output = removeSuffix(filename) + "_noP.txt"
    file = open(output, "w")
    for key in dic.keys():
        if key not in possible_p:
            L = key  + '\n' +  dic.get(key) + '\n'
            file.write(L)

filename = input("Please type the filename to remove check partial genomes: ")
possible_p = removeP(filename)
output = removeSuffix(filename) + "_partial.txt"
file1 = open(output, "w")
file1.write("Partial genomes:\n")
for elt in possible_p:
    file1.write(elt+'\n')
user_choice = input("Do you want to generate a new fasta file removing partial genomoes? (y/n)")
if user_choice == 'y':
    createNoP(filename, possible_p)
