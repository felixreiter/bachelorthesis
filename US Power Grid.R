# The following code installs and loads the needed extention
load("igraph") 
library("igraph")

# create a data frame of the network data
powerNet <- read.table("http://opsahl.co.uk/tnet/datasets/USpowergrid_n4941.txt")

# create the network from the data frame
powerNet <- graph.data.frame(powerNet)

# Number of nodes in the network
order <- gorder(powerNet)
order
# now it is possible to calculate the degree of the nodes for further analysis

deg <- degree(powerNet)
deg

# the following code prints out the highest degree, of a node, within the network
max(degree(powerNet))

list_delete <- sample(1:order, 1000)
new_powerNet <- delete.vertices(powerNet, list_delete)
gorder(new_powerNet)





###algorithm idea to delete the node with the highest degree###


# This line prints out the name of the most central Node
V(powerNet)$name[degree(powerNet)==max(degree(powerNet))]
# select the name of the node, which degree is equal to the highest degree within the network, and print it out

# while i kleiner 100
#   setzte variable Nodemax auf die aktuelle node mit höchstem degree
#     dann lösche diese 

#repeat {
  NodeWithCurrentHighestDegree <- V(powerNet)$name[degree(powerNet)==max(degree(powerNet))]
 g2 <- delete_vertices(powerNet, NodeWithCurrentHighestDegree)
 nwchd2 <- V(g2)$name[degree(g2)==max(degree(g2))]
  #if(gorder(powerNet)==gorder(powerNet)-100){
   # break
  #}
#}

NodeWithCurrentHighestDegree
nwchd2




