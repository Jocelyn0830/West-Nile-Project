input="C:\Users\liam\west\ecotype_simulation\core_genome_outgroup_filtered.fa"
tree="C:\Users\liam\west\ecotype_simulation\phylogeny_tree.txt"

max=500
for i in `seq $max`
do
    java -jar ecosim.jar -n -s=$input -p=$tree -o="C:\Users\liam\west\ecotype_simulation\output\result_${i}.xml" $ARGS
done
