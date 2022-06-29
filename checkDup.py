# a function to check if there are duplicated accession numbers
def checkAccession(filename):
    acc_num = []
    with open (filename) as file:
        for line in file:
            if line.startswith('>'):
                acc_num.append(line[1:9])

    dup_acc = []
    for i in range(0, len(acc_num)):
        for j in range(i+1, len(acc_num)):
            if acc_num[i] == acc_num[j]:
                dup_acc.append(acc_num[i])

    return dup_acc

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

# a function to check if there are duplicated sequences (with different accession numbers)
def checkSeq(filename):
    dic = fasta2dict(filename)
    dic_name = list(dic.keys())
    dup_seq = []
    for i in range(0, len(dic.keys())):
        for j in range(i+1, len(dic.keys())):
            if (dic.get(dic_name[i]) == dic.get(dic_name[j])) and (dic_name[i][1:9] != dic_name[j][1:9]) :
                dup_seq.append([dic_name[i][1:9], dic_name[j][1:9]])

    return dup_seq

def removeSuffix(filename):
    if '.fa' in filename:
        filename = filename.replace('.fa','')
    elif '.txt' in filename:
        filename = filename.replace('.txt','')
    elif '.fasta' in filename:
        filename = filename.replace('.fasta','')

    return filename

def createNoDup(filename, dup_acc, dup_seq):
    dic = fasta2dict(filename)

    for elt in dup_acc:
        duplicates_key = []
        for key in dic.keys():
            if elt in key:
                duplicates_key.append(key)

    duplicates_key.pop(0)
    to_remove = duplicates_key

    for elt in dup_seq:
        for key in dic.keys():
            if elt[1] in key:
                to_remove.append(key)

    output = removeSuffix(filename) + "_noDups.txt"
    file = open(output, "w")
    for key in dic.keys():
        if key not in to_remove:
            L = key  + '\n' +  dic.get(key) + '\n'
            file.write(L)




filename = input("Please type the filename to remove check duplicates: ")
dup_acc = list(set(checkAccession(filename)))
dup_seq = checkSeq(filename)

output = removeSuffix(filename) + "_duplicates.txt"
file = open(output, "w")
file.write("Duplicated accession numbers:\n")
for elt in dup_acc:
    file.write(elt + '\n')
file.write("Duplicated sequences:\n")
for elt in dup_seq:
    L = elt[0] + ' and ' + elt[1] + '\n'
    file.write(L)

user_choice = input("Do you want to generate a new fasta file removing duplicates? (y/n)")
if user_choice == 'y':
    createNoDup(filename,dup_acc, dup_seq)


