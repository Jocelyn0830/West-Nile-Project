# Create core gene from blast output
# Output are multi-fasta files. Each fasta file contains the specified genes extracted from all sequences

import sys
import os

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict
from collections import defaultdict

core_gene_dir = cur_dir + "/core_genes_blast"

gene_fasta_dic = defaultdict(dict)

for file in os.listdir(core_gene_dir):
    if file == ".DS_Store":
        continue

    gene = file.split('_')[0]
    gene_fasta_dic[gene].update(FastaToDict.fastaToDict(core_gene_dir + '/' + file))

def addCoreGene(gene):
    start_dic = {}

    for seq_name, seq_content in gene_fasta_dic[gene].items():

        if seq_name not in start_dic.keys():
            start_dic[seq_name] = seq_content
        else:
            start_dic[seq_name] += seq_content

    return start_dic

start_dic = {}

gene_list = ['C', 'prM', 'E', 'NS1', 'NS2a', 'NS2b', 'NS3', 'NS4a', 'NS4b', 'NS5' ]

for gene in gene_list:
    gene_dic = addCoreGene(gene)
    FastaToDict.dictToFasta(gene_dic, gene + ".fa")
