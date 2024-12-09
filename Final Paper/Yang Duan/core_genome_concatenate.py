#!/usr/bin/env python
# coding: utf-8

"""
@Author: All code (excluding the function fastaToDict()) in this file was written by Yang Duan
@Author: fastaToDict() is a utility function written by Jocelyn Wang
"""

# In[1]:


import pandas as pd
import numpy as np

from pathlib import Path


# In[2]:


get_ipython().system('pwd')


# In[3]:


# find all *.fa
paths = []
for path in Path('../core_genome_alignment/aligned/').rglob('*.fa'):
    paths.append(path)
paths


# In[4]:


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


# In[5]:


# import all aligned gene fragmentations
all_seg = dict()
for p in paths:
    col_name = p.stem.split("_")[0]
    print(col_name)
    sequences = fastaToDict(p)
    all_seg[col_name] = sequences


# In[6]:

# find all sequence names
all_seg.keys()
for key in all_seg.keys():
    print(key)

seq_names = []

for seg_dict in all_seg.keys():
    for key in all_seg[seg_dict].keys():
        seq_names.append(key)

seq_names = set(seq_names)


# In[9]:


len(seq_names)


# In[10]:

# create a dataframe for aligned genes
df = pd.DataFrame(columns=list(seq_names))

for seg_dict in all_seg.keys():
    row = pd.Series(all_seg[seg_dict],name=seg_dict)
    df = df._append(row)

# transpose the dataframe to let gene name be the row index
df = df.transpose()
df


# In[13]:


df = df[['C', 'prM', 'E', 'NS1', 'NS2a', 'NS2b', 'NS3', 'NS4a', 'NS4b', 'NS5']]
df


# insert gaps if not existing
for key in all_seg.keys():
    length = 0
    for i in range(3349):
        if pd.isna(df[key][i]) == False:
            length = len(df[key][i])
            break

    df[key] = df[key].fillna("-" * length)



# test expected output
"-" * 693
("-" * 693).count("-")


# In[16]:

# start to save concatenated core genomes
gene_order = ['C', 'prM', 'E', 'NS1', 'NS2a', 'NS2b', 'NS3', 'NS4a', 'NS4b', 'NS5']
f = open("../core_genome_alignment/" + "concatenated_giant.fa", "w")

all_seq = dict()

for index, row in df.iterrows():
    output = ""
    for gene in gene_order:
        output = output + row[gene]
  
    f.write(index + "\n")
    f.write(output + "\n")

    all_seq[index]  = output.replace("\n", "")

    
f.close()


# sanity check
lengths = set()
for k, v in all_seq.items():
    lengths.add(len(v))


# In[18]:


lengths

# filter out genomes with gaps larger than 5% of its length
num5PerGap = 0
num10PerGap = 0

for k, v in all_seq.items():
    numGap = v.count("-")
    length = len(v)
    if numGap <= (length * 0.05):
        num5PerGap += 1
    if numGap < (length * 0.10):
        num10PerGap += 1

num5PerGap, num10PerGap

len(all_seq)

seqLessOrEqa5PerGap = dict()

for k, v in all_seq.items():
    numGap = v.count("-")
    length = len(v)
    if numGap <= (length * 0.05):
        seqLessOrEqa5PerGap[k] = v
len(seqLessOrEqa5PerGap)

# save filtered core genomes
f = open("../core_genome_alignment/" + "SeqLessOrEqual5PercentGap.fa", "w")

for k, v in seqLessOrEqa5PerGap.items():
    f.write(k + "\n")
    f.write(v + "\n")    
f.close()





