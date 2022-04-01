#small network HIV
library("igraph")

HIV_net <- read.table("out.hiv", header= TRUE, sep = "",fill = TRUE )

#@MISC{konect:2018:hiv,
#  title = {HIV network dataset -- {KONECT}},
# month = feb,
# year = {2018},
# url = {http://konect.cc/networks/hiv}
#}

HIV_net <- graph.data.frame(HIV_net, directed = TRUE)

gorder(HIV_net)
order <- gorder(HIV_net)
gsize(HIV_net)
plot(HIV_net)

  ##random deletion##

#list of random nodes that will be deleted
list_delete <- sample(1:order, 10)
list_delete
#delete the random nodes and save them in a new Data frame 

random_delete <- delete.vertices(HIV_net, list_delete)
plot(random_delete)


  ##deletion of nodes with the highest degree centrality##

degcent <- centr_degree(HIV_net, mode="all")

g2 <- HIV_net
for (i in 1:0){
  g2 <- delete_vertices(g2,V(g2)$name[degcent$res==max(degcent$res)])
}
plot(g2)
highest_measure <-centr_degree(g2, mode = "all")
V(g2)$name[highest_measure$res==max(highest_measure$res)]
  
  ##deletion of nodes with the highest eigenvektor centrality##

evcent <- centr_eigen(HIV_net)

g3 <- HIV_net
for (i in 1:0){
  g3 <- delete_vertices(g3,V(g3)$name[evcent$vector==max(evcent$vector)])
}
plot(g3)
V(g3)$name[evcent$vector==max(evcent$vector)]

  ##deletion of nodes with the highest Katz centrality##
katzcent <- alpha_centrality(HIV_net, alpha=0.2)

g4 <- HIV_net
for (i in 1:10){
  g4 <- delete_vertices(g4,V(g4)$name[katzcent==max(katzcent)])
}
plot(g4)
gorder(g4)
V(g4)$name[katzcent==max(katzcent)]

 ##deletion of nodes with the highest PageRank centrality##
prcent <- page_rank(HIV_net, directed=TRUE)

g5 <- HIV_net
for (i in 1:10){
  g5 <- delete_vertices(g5,V(g5)$name[prcent$vector==max(prcent$vector)])
}
gorder(g5)

#@MISC{konect:2018:hiv,
#  title = {HIV network dataset -- {KONECT}},
 # month = feb,
 # year = {2018},
 # url = {http://konect.cc/networks/hiv}
#}