
# A small utility program to check if the alignment is made correctly
import sys
import os
from collections import defaultdict

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict

core_genome = FastaToDict.fastaToDict("core_genome/core_genome.fa")

lis = []
for key, value in core_genome.items():
    lis.append(len(value))

print(len(set(lis)) == 1)