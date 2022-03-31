library(igraph)

g <- make_empty_graph(n = 7, directed = FALSE)
V(g)$name <- c("1","2","3","4","5","6","7")
g <- add_edges(g,c("1","4"))
g <- add_edges(g,c("1","6"))
g <- add_edges(g,c("6","4"))
g <- add_edges(g,c("6","z"))
g <- add_edges(g,c("4","2"))
g <- add_edges(g,c("4","3"))
g <- add_edges(g,c("4","7"))
g <- add_edges(g,c("2","7"))
g <- add_edges(g,c("2","3"))
g <- add_edges(g,c("2","5"))
plot(g)

#plot degree centrality
degcent <- degree(g) 
#node degrees sind so klein, das visualisieren unübersichtlich wäre, darum vergrößere ich sie um einen Faktor
VS = 6 + 5*degcent
plot(g, vertex.size=VS)

#plot betweennes
betwcent <- betweenness(g)
VS = 14 + 5*betwcent
plot(g, vertex.size=VS)

#plot eigenvektor
eigencent <-  eigen_centrality(g)$vector  
eigencent
VS = 14 + 10*eigencent
plot(g, vertex.size=VS)
