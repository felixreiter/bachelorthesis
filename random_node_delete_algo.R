#random node deletion algorithm
library("igraph")

#target graph of delete algorithm

powerNet <- read.table("http://opsahl.co.uk/tnet/datasets/USpowergrid_n4941.txt")

powerNet <- graph.data.frame(powerNet)

order <- gorder(powerNet)
order
                                           
#list of random nodes that will be deleted
list_delete <- sample(1:order, 1000)
list_delete
#delete the random nodes and save them in a new Dataframe 

new_foo_g <- delete.vertices(powerNet, list_delete)

gorder(new_foo_g)

max(degree(powerNet))
max(degree(new_foo_g))

