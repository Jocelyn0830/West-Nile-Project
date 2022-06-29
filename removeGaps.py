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

# remove any gaps in the sequences
def removeGap(filename):
    dic = fasta2dict(filename)
    if '.fa' in filename:
        filename = filename.replace('.fa','')
    elif '.txt' in filename:
        filename = filename.replace('.txt','')
    elif '.fasta' in filename:
        filename = filename.replace('.fasta','')
    output = filename + "_nogap.txt"
    file = open(output, "w")
    for key in dic.keys():
        L = key +  dic.get(key).lower().replace('-','') + "\n"
        file.write(L)

filename = input("Please type the filename to remove gaps: ")
removeGap(filename)


