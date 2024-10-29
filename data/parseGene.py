import json
import sys
import os

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict

blast_output_dir = cur_dir + "/blast_output"

for file in os.listdir(blast_output_dir):
    if file == ".DS_Store":
        continue

    gene_pos_json = open(blast_output_dir + file)

    json_info_dict = {}

    data = json.load(gene_pos_json)

    blast_output = data["BlastOutput2"]
    blast_output_res = blast_output[0].get(
        'report').get('results').get('bl2seq')[0]

    hits = blast_output_res.get('hits')

    with open("core_genes/" + file.replace(".json", '') + ".fa", 'w') as f:
        for hit in hits:
            hsps = hit.get('hsps')[0]
            description = hit.get('description')[0]
            subject_strain_name = description.get("title")
            
            f.write('>' + subject_strain_name + '\n')
            gene = hsps.get("hseq")
            f.write(gene + '\n')

