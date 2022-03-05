#random node deletion algorithm
library("igraph")

#target graph of delete algorithm

powerNet <- read.table("http://opsahl.co.uk/tnet/datasets/USpowergrid_n4941.txt")

powerNet <- graph.data.frame(powerNet)

gorder(powerNet)
                                           
#list of random nodes that will be deleted
list_delete <- runif(n = 1000, min = 1, max = 4941)

#delete the random nodes and save them in a new Dataframe 

new_foo_g <- delete.vertices(powerNet, list_delete)

gorder(new_foo_g)

max(degree(powerNet))
max(degree(new_foo_g))

