#HabitatBreadthBats
#Carballo-Morales et al. 2023

#package required
library("phytools")
library("geiger")
library("dplyr")


#raw data
data <- read.csv("raw_data/AppendixS1.csv") ## HB, mass, TG, and ER raw data

#Phylogenetic tree
tree <- read.tree("code/RAxML_bestTree.T1")
tree$tip.label <- gsub("_", " ", tree$tip.label)
phyllos.sp <- tree$tip.label[420:578] %>%
  as.data.frame
row.names(phyllos.sp) <- phyllos.sp$.

tree_phyllos <-
  geiger::treedata(
    phy = tree,
    data = phyllos.sp,
    sort = T,
    warnings = T
  )$phy ## only phyllostomids bats
plot(tree_phyllos)
View(as.data.frame(sort(tree_phyllos$tip.label)))


##Statistical analysis
#Phylogenetic generalized least square (PGLS)
data_nNA <- data[complete.cases(data), ] # remove NA rows
row.names(data_nNA) <- data_nNA$X 

View(as.data.frame(data_nNA$X))

tree_phylo <-
  geiger::treedata(
    phy = tree,
    data = data_nNA,
    sort = T,
    warnings = T
  )$phy ## tree and data with the same sp. 
data_phylo <-
  data.frame(geiger::treedata(tree,
                              data_nNA, sort = TRUE)$data
             ) ## tree and data with the same sp.
tree_phylo$tip.label == rownames(data_phylo)
nrow(data_phylo)
tip