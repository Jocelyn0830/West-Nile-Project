import sys
import os

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict

seq_dic = FastaToDict.fastaToDict("query_genes/AF202541.fa")

def getQueryGene(gene_name, start_idx, end_idx):
    gene = seq_dic.get(">AF202541\n")[start_idx-1 : end_idx]
    with open("query_genes/" + gene_name + ".fa", 'w') as f:
        f.write('>' + gene_name + '\n')
        f.write(gene)

gene_name = input("gene name: ")
start_idx = int(input("start index: "))
end_idx = int(input("end index: "))

getQueryGene(gene_name, start_idx, end_idx)