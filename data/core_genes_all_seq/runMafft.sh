# A bash program to align gene sequences

#!/bin/bash

# specify input directory
input_dir=/Users/jocelynwang/Desktop/Princeton/West-Nile-Project/data/core_genes_all_seq/unaligned

# specify input directory
output_dir=/Users/jocelynwang/Desktop/Princeton/West-Nile-Project/data/core_genes_all_seq/aligned

# specify mafft command
# mafft_command="mafft -query QUERY-FILE -subject FILE -out OUTPUT_FILE -outfmt 15"
mafft_command="mafft --auto --inputorder INPUT-FILE > OUTPUT_FILE"

#for all files in input directory
for entry in "$input_dir"/*
    do
        # get file name in input directory without path
        file_name=$(basename "$entry")

        # your output file name
        output_file="$output_dir/${file_name%.fa}_aligned.fa"

        # update mafft command wuth query filename
        mafft_cmd="${mafft_command/INPUT-FILE/$entry}"

        # update mafft command with output filename
        mafft_cmd="${mafft_cmd/OUTPUT_FILE/$output_file}"

        # execute mafft command
        echo $mafft_cmd
    
done