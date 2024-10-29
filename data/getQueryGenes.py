"""

Idea: AF202541 is used as query genome. On NCBI, genes and positions have been listed 
(https://www.ncbi.nlm.nih.gov/nuccore/AF202541.1/). We can extract the genes and use
them as query sequences to BLASTn to find the genes in ohter sequences.

"""

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

"""
mat_peptide     55..423
                     /product="capsid protein"
                     /note="putative; C"
     mat_peptide     424..924
                     /product="precursor of M protein"
                     /note="putative; prM"
     mat_peptide     700..924
                     /product="membrane protein"
                     /note="putative; M"
     mat_peptide     925..2427
                     /product="envelope protein"
                     /note="putative; E"
     mat_peptide     2428..3483
                     /product="non-structural protein NS1"
                     /note="putative"
     mat_peptide     3484..4176
                     /product="non-structural protein NS2a"
                     /note="putative"
     mat_peptide     4177..4569
                     /product="non-structural protein NS2b"
                     /note="putative"
     mat_peptide     4570..6426
                     /product="non-structural protein NS3"
                     /note="putative"
     mat_peptide     6427..6873
                     /product="non-structural protein NS4a"
                     /note="putative"
     mat_peptide     6874..7638
                     /product="non-structural protein NS4b"
                     /note="putative"
     mat_peptide     7639..10353
                     /product="non-structural protein NS5"
                     /note="putative"
"""

# I typed those indexes manually for no reason... can optimize later
gene_name = input("gene name: ")
start_idx = int(input("start index: "))
end_idx = int(input("end index: "))

getQueryGene(gene_name, start_idx, end_idx)