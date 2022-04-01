#small network HIV
library("igraph")

HIV_net <- read.table("out.hiv", header= TRUE, sep = "",fill = TRUE )

HIV_net <- graph.data.frame(HIV_net, directed = TRUE)


plot(HIV_net)

#@MISC{konect:2018:hiv,
#  title = {HIV network dataset -- {KONECT}},
 # month = feb,
 # year = {2018},
 # url = {http://konect.cc/networks/hiv}
#}