"""

After extracting the single genes, we align them separately using MAFFT. 
We got a multiple sequence alignment for each gene, then we concatenate these sequence
alignments in original gene order to generate a core genome alignment.

"""
# Create core genome alignment from single gene alignment files

import sys
import os
from collections import defaultdict

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict
from collections import defaultdict

core_gene_dir = cur_dir + "/core_genes_all_seq/aligned"

gene_fasta_dic = defaultdict(dict)

# not every gene was found in the sequences
# keep track of which gene was found in most number of sequences
total_seq_num = 0
total_seq = []

for file in os.listdir(core_gene_dir):
    if file == ".DS_Store":
        continue

    gene = file.split('_')[0]

    gene_dict = FastaToDict.fastaToDict(core_gene_dir + '/' + file)
    seq_list = gene_dict.keys()
    if total_seq_num < len(seq_list):
        total_seq_num = len(seq_list)
        total_seq = seq_list

    gene_fasta_dic[gene].update(gene_dict)


gene_list = ['C', 'prM', 'E', 'NS1', 'NS2a', 'NS2b', 'NS3', 'NS4a', 'NS4b', 'NS5']
core_genome = defaultdict(str)

for gene in gene_list:

    gene_dict = gene_fasta_dic[gene]

    for i in range(len(total_seq)):
        seq = list(total_seq)[i]

        if i == 0:
            seq_name, seq_content = gene_dict.popitem()
            seq_len = len(seq_content)
            #print(seq_len)
            gene_dict[seq_name] = seq_content

        if seq not in gene_dict.keys():
            core_genome[seq] += ("-" * seq_len)
        else:
            core_genome[seq] += gene_dict.get(seq)

FastaToDict.dictToFasta(core_genome, "core_genome.fa")

