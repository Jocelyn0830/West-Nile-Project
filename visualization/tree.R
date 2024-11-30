# Load libraries
library(ggtree)
library(ape)
library(treeio)
library(dplyr)
library(ggplot2)
library(tidytree)
library(geiger)
offspring.tbl_tree_item <- utils::getFromNamespace(".offspring.tbl_tree_item", "tidytree")

# Load tree
tree <- read.tree("/Users/jocelynwang/Desktop/Princeton/West-Nile-Project/data/phylogeny_root.nhx")

# Visualize the tree in circular form. Do not display branch length info
ggtree(tree, branch.length="none", layout="circular")
