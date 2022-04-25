#large network, power grid of the USA
library("igraph")

g <- read.table("power-US-Grid.mtx", header= TRUE, sep = " ",fill = TRUE)

#@inproceedings{nr,
#  title={The Network Data Repository with Interactive Graph Analytics and Visualization},
#  author={Ryan A. Rossi and Nesreen K. Ahmed},
#  booktitle={AAAI},
#  url={https://networkrepository.com},
#  year={2015}
#}

g <- graph.data.frame(g, directed = FALSE)

gorder(g)
order <- gorder(g)
n <- order * 0.01
max(degree(g))
mean(degree(g))
gsize(g)
is_connected(g)
components(g)
mean_distance(g)
diameter(g)

  ##random deletion##

#list of random nodes that will be deleted
list_delete <- sample(1:order, n)
list_delete

#delete the random nodes and save them in a new variable 
random_delete <- delete.vertices(g, list_delete)
gorder(random_delete)
max(degree(random_delete))
mean(degree(random_delete))
is_connected(random_delete)
components(random_delete)
mean_distance(random_delete)
diameter(random_delete)

  ##deletion of nodes with the highest degree centrality##

degcent <- centr_degree(g, mode="all")

g2 <- g
for (i in 1:n){
  g2 <- delete_vertices(g2,V(g2)$name[degcent$res==max(degcent$res)])
}
highest_measure <-centr_degree(g2, mode = "all")
V(g2)$name[highest_measure$res==max(highest_measure$res)]
max(degree(g2))
mean(degree(g2))
is_connected(g2)
components(g2)  
mean_distance(g2)
diameter(g2)

##deletion of nodes with the highest eigenvektor centrality##

evcent <- centr_eigen(g)

g3 <- g
for (i in 1:n){
  g3 <- delete_vertices(g3,V(g3)$name[evcent$vector==max(evcent$vector)])
}
V(g3)$name[evcent$vector==max(evcent$vector)]
is_connected(g3)
max(degree(g3))
mean(degree(g3))
components(g3)
mean_distance(g3)
diameter(g3)

  ##deletion of nodes with the highest Katz centrality##

katzcent <- alpha_centrality(g, alpha=0.2)

g4 <- g
for (i in 1:n){
  g4 <- delete_vertices(g4,V(g4)$name[katzcent==max(katzcent)])
}
gorder(g4)
V(g4)$name[katzcent==max(katzcent)]
max(degree(g4))
mean(degree(g4))
is_connected(g4)
components(g4)
mean_distance(g4)
diameter(g4)

  ##deletion of nodes with the highest PageRank centrality##

prcent <- page_rank(g, directed=TRUE)

g5 <- g
for (i in 1:n){
  g5 <- delete_vertices(g5,V(g5)$name[prcent$vector==max(prcent$vector)])
}
gorder(g5)
max(degree(g5))
mean(degree(g5))
is_connected(g5)
components(g5)
max(degree(g5))
mean_distance(g5)
diameter(g5)

  ##deletion of nodes with the highest closeness centrality##

closecent <- centr_clo(g)

g6 <- g
for (i in 1:n){
  g6 <- delete_vertices(g6,V(g6)$name[closecent$res==max(closecent$res)])
}
V(g6)$name[closecent$res==max(closecent$res)]
max(degree(g6))
mean(degree(g6))
is_connected(g6)
components(g6)
mean_distance(g6)
diameter(g6)

  ##deletion of nodes with the highest betweeness centrality##

betwcent <- centr_betw(g, directed=FALSE)

g7 <- g
for (i in 1:n){
  g7 <- delete_vertices(g7,V(g7)$name[betwcent$res==max(betwcent$res)])
}
V(g7)$name[betwcent$res==max(betwcent$res)]
max(degree(g7))
mean(degree(g7))
is_connected(g7)
components(g7)
mean_distance(g7)
diameter(g7)

