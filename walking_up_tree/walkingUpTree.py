from Bio import Phylo
import util
import csv

# species = input("Please input the file name: ")
tree = Phylo.read("phylogeny_rooted_v2", "newick")


def MakeTerminalDict(curr_clade):
    clade_CBPs = []
    for clade in curr_clade.get_terminals():
        clade_name = str(clade)
        clade_name = clade_name.split("_")[1]
        clade_CBPs.append(clade_name)
    return clade_CBPs

# The first branch is all other and the root
# Thus we just need to go to the all other branches and keep going,
# We can just keep making subtrees
clade_pos = [0]
curr_clade = Phylo.BaseTree.Tree.from_clade(tree.clade[0])
# print(curr_clade)
# print(len(curr_clade.get_terminals()))

names = util.TabulateNames(tree)


group_CBPs = {}

for name in names.keys():
    curr_clade = names[name]
    if (len(curr_clade.get_nonterminals()) < 2) or (len(curr_clade[0].get_terminals())< 5) or (len(curr_clade[1].get_terminals()) < 5):
        continue
    
    subclade_CBPs = {}
    subclade_0_list = MakeTerminalDict(curr_clade[0])
    subclade_CBPs['0'] = subclade_0_list
    subclade_1_list = MakeTerminalDict(curr_clade[1])
    subclade_CBPs['1'] = subclade_1_list
    group_CBPs[name] = subclade_CBPs

env_dict = util.ParseCsv('metadata_add_group.csv')

branch_names = ""
for elt in group_CBPs.keys():
    branch_names = branch_names + "," + elt

branch_names = branch_names[1:]


# for branch, branch_dict in group_CBPs.items():
#     host_matrix = util.BranchGroupMatrix(env_dict, branch_dict)
#     util.write_matrix(branch, host_matrix, "group")
