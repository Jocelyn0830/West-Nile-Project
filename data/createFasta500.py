
# A small utility program to check if the alignment is made correctly
import sys
import os
from collections import defaultdict

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict

core_genome = FastaToDict.fastaToDict("giant.fa")

i = 0
j = 1
write_dic = {}
for key, value in core_genome.items():
    if i < 500:
        write_dic[key] = value
        i += 1
    else:
        i = 0
        FastaToDict.dictToFasta(write_dic, str(j) + "_seq_batch.fa")
        j += 1
        write_dic = {}

FastaToDict.dictToFasta(write_dic, str(j) + "_seq_batch.fa")