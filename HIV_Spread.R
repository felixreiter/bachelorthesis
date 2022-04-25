#small network, spread of HIV
library("igraph")

g <- read.table("out.hiv", header= TRUE, sep = "",fill = TRUE )

#@MISC{konect:2018:hiv,
#  title = {HIV network dataset -- {KONECT}},
# month = feb,
# year = {2018},
# url = {http://konect.cc/networks/hiv}
#}

g <- graph.data.frame(g, directed = FALSE)

gorder(g)
order <- gorder(g)
max(degree(g))
gsize(g)
plot(g)
is_connected(g)
components(g)
mean_distance(g)
diameter(g)
mean(degree(g))

##random deletion##

#list of random nodes that will be deleted
list_delete <- sample(1:order, 10)
list_delete
plot(list_delete)
#delete the random nodes and save them in a new variable 
random_delete <- delete.vertices(g, list_delete)
plot(random_delete)
max(degree(random_delete))
is_connected(random_delete)
components(random_delete)
mean_distance(random_delete)
diameter(random_delete)
mean(degree(random_delete))

##deletion of nodes with the highest degree centrality##

degcent <- centr_degree(g, mode="all")

g2 <- g
for (i in 1:10){
  g2 <- delete_vertices(g2,V(g2)$name[degcent$res==max(degcent$res)])
}
plot(g2)
highest_measure <-centr_degree(g2, mode = "all")
V(g2)$name[highest_measure$res==max(highest_measure$res)]
max(degree(g2))
is_connected(g2)
components(g2)  
mean_distance(g2)
diameter(g2)
mean(degree(g2))

##deletion of nodes with the highest eigenvektor centrality##

evcent <- centr_eigen(g)

g3 <- g
for (i in 1:10){
  g3 <- delete_vertices(g3,V(g3)$name[evcent$vector==max(evcent$vector)])
}
plot(g3)
V(g3)$name[evcent$vector==max(evcent$vector)]
is_connected(g3)
max(degree(g3))
components(g3)
mean_distance(g3)
diameter(g3)
mean(degree(g3))

##deletion of nodes with the highest Katz centrality##

katzcent <- alpha_centrality(g, alpha=0.2)

g4 <- g
for (i in 1:10){
  g4 <- delete_vertices(g4,V(g4)$name[katzcent==max(katzcent)])
}
plot(g4)
gorder(g4)
V(g4)$name[katzcent==max(katzcent)]
max(degree(g4))
is_connected(g4)
components(g4)
mean_distance(g4)
diameter(g4)
mean(degree(g4))

##deletion of nodes with the highest PageRank centrality##

prcent <- page_rank(g, directed=FALSE)

g5 <- g
for (i in 1:10){
  g5 <- delete_vertices(g5,V(g5)$name[prcent$vector==max(prcent$vector)])
}
gorder(g5)
max(degree(g5))
is_connected(g5)
components(g5)
max(degree(g5))
mean_distance(g5)
diameter(g5)
mean(degree(g5))

##deletion of nodes with the highest closeness centrality##

closecent <- centr_clo(g)

g6 <- g
for (i in 1:10){
  g6 <- delete_vertices(g6,V(g6)$name[closecent$res==max(closecent$res)])
}
plot(g6)
V(g6)$name[closecent$res==max(closecent$res)]
max(degree(g6))
is_connected(g6)
components(g6)
mean_distance(g6)
diameter(g6)
mean(degree(g6))

##deletion of nodes with the highest betweenness centrality##

betwcent <- centr_betw(g, directed=TRUE)

g7 <- g
for (i in 1:10){
  g7 <- delete_vertices(g7,V(g7)$name[betwcent$res==max(betwcent$res)])
}
plot(g7)
V(g7)$name[betwcent$res==max(betwcent$res)]
max(degree(g7))
is_connected(g7)
components(g7)
mean_distance(g7)
diameter(g7)
mean(degree(g7))