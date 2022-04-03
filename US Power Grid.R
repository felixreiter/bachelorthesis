# The following code installs and loads the needed extention
load("igraph") 
library("igraph")

# create a data frame of the network data
powerNet <- read.table("http://opsahl.co.uk/tnet/datasets/USpowergrid_n4941.txt")

# create the network from the data frame
powerNet <- graph.data.frame(powerNet)
mean_distance(powerNet)
mean_distance(new_powerNet)

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
max_degcent <- V(powerNet)$name[degcent$res==max(degcent$res)]
max_degcent

evcent <- centr_eigen(powerNet)
max_evcent <- V(powerNet)$name[evcent$res==max(evcent$res)]
max_evcent

katzcent <- alpha_centrality(powerNet, alpha=0.2)
max_katcent <- V(powerNet)$name[katcent$res==max(katcent$res)]
max_katzcent

prcent <- page_rank(powerNet, directed=FALSE)
max_prcent <- V(powerNet)$name[prcent$res==max(prcent$res)]
max_prcent

closecent <- centr_clo(powerNet)
max_closecent <- V(powerNet)$name[closecent$res==max(closecent$res)]
max_closecent

betwcent <- centr_betw(powerNet, directed=FALSE)
max_betwcent <- V(powerNet)$name[betwcent$res==max(betwcent$res)]
max_betwcent

# This line prints out the name of the most central Node
V(powerNet)$name[degree(powerNet)==max(degree(powerNet))]
# select the name of the node, which degree is equal to the highest degree within the network, and print it out
