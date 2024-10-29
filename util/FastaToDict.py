# Convert fasta file to dictionary
# Takes filename as input

def fastaToDict(fil):
    """
    Read fasta-format file fil, return dict of form scaffold:sequence.
    Note: Uses only the unique identifier of each sequence, rather than the 
    entire header, for dict keys. 
    """
    dic = {}
    cur_scaf = ''
    cur_seq = []
    for line in open(fil):
        if line.startswith(">") and cur_scaf == '':
            cur_scaf = line.split('_')[0]
        elif line.startswith(">") and cur_scaf != '':
            dic[cur_scaf] = ''.join(cur_seq)
            cur_scaf = line.split('_')[0]
            cur_seq = []
        else:
            cur_seq.append(line.rstrip())
    dic[cur_scaf] = ''.join(cur_seq)
    return dic


def dictToFasta(dic, filename):
    with open(filename, 'w') as f:
        for strain_name, content in dic.items():
            f.write(strain_name.replace('\n', '') + '\n')
            f.write(content + '\n')
        
