# Exclude sequences with too many gaps

import sys
import os

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict

genome_dict = FastaToDict.fastaToDict("core_genome/core_genome_outgroup.fa")

filtered_dict = {}
for name, seq in genome_dict.items():
    if seq.count("-") <= len(seq) * 0.05:
        filtered_dict[name] = seq

FastaToDict.dictToFasta(filtered_dict, "core_genome/core_genome_outgroup_filtered.fa")