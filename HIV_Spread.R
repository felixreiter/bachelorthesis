#small network HIV
library("igraph")

HIV_net <- read.table("out.hiv", header= TRUE, sep = "",fill = TRUE )

HIV_net <- graph.data.frame(HIV_net, directed = TRUE)

gorder(HIV_net)
order <- gorder(HIV_net)
gsize(HIV_net)
plot(HIV_net)

#list of random nodes that will be deleted
list_delete <- sample(1:order, 10)
list_delete
#delete the random nodes and save them in a new Data frame 

random_delete <- delete.vertices(HIV_net, list_delete)
plot(random_delete)

degcent <- centr_degree(HIV_net, mode="all")
V(HIV_net)$name[degcent$res==max(degcent$res)]
degree(HIV_net,"1")

d2 <-centr_degree(g2, mode = "all")
g2 <- HIV_net
for (i in 1:9){
  g2 <- delete_vertices(g2,V(g2)$name[degcent$res==max(degcent$res)])
}
plot(g2)
gorder(g2)
degree(g2,"11")

max(degree(HIV_net))
max(degree(random_delete))
V(g2)$name[d2$res==max(d2$res)]
plot(random_delete)

#@MISC{konect:2018:hiv,
#  title = {HIV network dataset -- {KONECT}},
 # month = feb,
 # year = {2018},
 # url = {http://konect.cc/networks/hiv}
#}