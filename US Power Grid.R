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

#code that deletes random nodes number sample(<lowerbound>:order, <uppperbound>)
list_delete <- sample(1:order, 1000)
new_powerNet <- delete.vertices(powerNet, list_delete)
gorder(new_powerNet)

degcent <- centr_degree(powerNet, mode="all")
max_degcent <- V(g)$name[degcent$res==max(degcent$res)]
max_degcent

evcent <- centr_eigen(powerNet)
V(g)$name[evcent$res==max(evcent$res)]

katzcent <- alpha_centrality(powerNet, alpha=0.2)
V(g)$name[katcent$res==max(katcent$res)]


prcent <- page_rank(powerNet, directed=FALSE)
V(g)$name[prcent$res==max(prcent$res)]


closecent <- centr_clo(powerNet)
V(g)$name[closecent$res==max(closecent$res)]


betwcent <- centr_betw(powerNet, directed=FALSE)
V(g)$name[betwcent$res==max(betwcent$res)]


# This line prints out the name of the most central Node
V(powerNet)$name[degree(powerNet)==max(degree(powerNet))]
# select the name of the node, which degree is equal to the highest degree within the network, and print it out






