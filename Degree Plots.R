library(igraph)

g <- make_empty_graph(n = 7, directed = FALSE)
V(g)$name <- c("Alice","Bob","Anna","Alexa","Claire","John","Mike")
g <- add_edges(g,c("Anna","Alice"))
g <- add_edges(g,c("Anna","Alexa"))
g <- add_edges(g,c("Alexa","Alice"))
g <- add_edges(g,c("Alexa","Bob"))
g <- add_edges(g,c("Alice","Claire"))
g <- add_edges(g,c("Alice","John"))
g <- add_edges(g,c("Alice","Bob"))
g <- add_edges(g,c("Claire","Bob"))
g <- add_edges(g,c("Claire","John"))
g <- add_edges(g,c("Claire","Mike"))

#plot degree centrality
degcent <- degree(g) 
#node degrees sind so klein, das visualisieren unübersichtlich wäre, darum vergrößere ich sie um einen Faktor
VS = 6 + 5*degcent
plot(g, vertex.size=VS)
