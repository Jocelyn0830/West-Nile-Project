#!/usr/bin/env python
# coding: utf-8

import pandas as pd
import numpy as np

from pathlib import Path

# find all *.fa
paths = []
for path in Path('../data/sequence_data').rglob('*.fa'):
    paths.append(path)
paths[0]

# store sequence name and data pairs in a dictionary
d = dict()
for p in paths:
    sequence = open(p, "r").read()
    lines = sequence.split("\n")
    d[lines[0]] = "".join(lines[1:])


# parse fasta files
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
            cur_scaf = line.rstrip()
        elif line.startswith(">") and cur_scaf != '':
            dic[cur_scaf] = ''.join(cur_seq)
            cur_scaf = line.rstrip()
            cur_seq = []
        else:
            cur_seq.append(line.rstrip())
    dic[cur_scaf] = ''.join(cur_seq)
    return dic

# get two datasets
# first dataset got from NCBI database with filters
# seconde dataset got from published papers
sequences2 = fastaToDict("../scraping-v2/sequences.fa")
df = pd.DataFrame(list(sequences2.items()))
df2 = pd.DataFrame(list(d.items()))

# merge two datasets and drop duplicates
total = pd.concat([df, df2], axis=0)
total.drop_duplicates(subset=[1], keep='first', inplace=True)

# parse sequence names and rename columns
total["seq_name"] = total[0].apply(lambda x: x[1:].split(" ", maxsplit=1)[0])
total.rename(columns={0: "header", 1: 'sequence'}, inplace=True)

# reorder columns and save to an excel file
total = total[["seq_name", "header", "sequence"]]
total.to_excel("merged_sequence_no_duplicat.xlsx")

# iterate over the dataset and save to seperate files for each sequence
for index, row in total.iterrows():
    folder_path = "../data/sequence_data/single_sequence/"
    seq_name = row[0][1:].split(" ", maxsplit=1)[0]
    
    f = open(folder_path + seq_name + ".fa", "w")
    f.write(row[0] + "\n")
    f.write(row[1] + "\n")
    f.close()

# iterate over the dataset and save to a giant file for all sequences
f = open("../data/sequence_data/single_sequence/" + "giant.fa", "w")
for index, row in total.iterrows():
    f.write(row[0] + "\n")
    f.write(row[1] + "\n")
f.close()

# manually correct one data point
total_has_duplicates = pd.concat([df, df2], axis=0)
total_has_duplicates[total_has_duplicates[0] == "> W0939"]
total_has_duplicates.loc[1299, 0] = ">W0939"


# map the duplicated sequences 
total_has_duplicates["seq_name"] =  total_has_duplicates[0].apply(lambda x: x[1:].split(" ", maxsplit=1)[0])
for index, row in total_has_duplicates.iterrows():
    dup_list = total_has_duplicates[(total_has_duplicates["seq_name"] != row["seq_name"]) & (total_has_duplicates[1] == row[1])]["seq_name"]
    
    total_has_duplicates.loc[index, "dup"] = ",".join(dup_list)


# rename columns
total_has_duplicates.rename(columns={0: "header", 1: 'sequence'}, inplace=True)
total_has_duplicates

# check the output data
total_has_duplicates[total_has_duplicates["dup"].isna()]

# save the list of duplicated sequences
total_has_duplicates[total_has_duplicates["dup"] != ""][["seq_name", "dup"]].to_excel("duplications.xlsx")

# reorder the columns
total_has_duplicates = total_has_duplicates[["seq_name", "dup", "header", "sequence"]]
total_has_duplicates

# save to a file
total_has_duplicates.to_excel("merged_sequence.xlsx")
