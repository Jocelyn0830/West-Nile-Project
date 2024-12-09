#!/bin/ksh
#
# @Author: All code in this file was written by Yang Duan
#

# define paths in windows
input="C:\Users\liam\west\ecotype_simulation\core_genome_outgroup_filtered.fa"
tree="C:\Users\liam\west\ecotype_simulation\phylogeny_tree.txt"

# max iterations
max=500

# do loop to run 'Ecotype Simulation 2' 500 times
for i in `seq $max`
do
    java -jar ecosim.jar -n -s=$input -p=$tree -o="C:\Users\liam\west\ecotype_simulation\output\result_${i}.xml" $ARGS
done
