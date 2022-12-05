#HabitatBreadthBats
#Carballo-Morales et al. 2023

#package required
library("phytools")



#raw data
data <- read.csv("raw_data/AppendixS1.csv") ## HB, mass, TG, and ER raw data

#Phylogenetic tree
tree <- read.tree("code/RAxML_bestTree.T1")
