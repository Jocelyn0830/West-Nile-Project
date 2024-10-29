"""

Input data format: many single fasta files (each fasta file contains only one sequence)
Output data format: a multi fasta file that contains all sequences

"""

import sys
import os

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict

all_seq_dic = {}

subfolders= [f.path for f in os.scandir(cur_dir + "/sequence_data") if f.is_dir()]

for folder in subfolders:
    
    if "nonUS" in folder:
        continue
    
    things = os.listdir(folder)
    for item in things:
        filename = folder + "/" + item
        if os.path.isfile(filename) and item != '.DS_Store':
            seq_dic = FastaToDict.fastaToDict(filename)
            all_seq_dic.update(seq_dic)

        elif os.path.isdir(filename):
            files = os.listdir(filename)
            for file in files:
                if '.DS_Store' in file:
                    continue
                fullfilename = filename + "/" + file
                seq_dic = FastaToDict.fastaToDict(fullfilename)
                all_seq_dic.update(seq_dic)


FastaToDict.dictToFasta(all_seq_dic, "all_seq.fa")