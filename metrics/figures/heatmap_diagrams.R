matrix <- read.csv("connectivity_matrix.csv", sep=",")

library(reshape2)
res <- melt(as.data.frame(matrix), id="Sites")
res <- setNames(res[c("Sites", "variable", "value")], c("origin", "dest", "value"))

site_levels <- names(matrix)
site_levels <- site_levels[-1]
site_levels_reverse <- c("S10" ,"S9",  "S8" , "S7"  ,"S6" , "S5" , "S4" , "S3" , "S2" ,"S1")

res$origin2 <- factor(res$origin, levels = site_levels_reverse)
res$dest2 <- factor(res$dest, levels = site_levels)

p <- ggplot(res, aes(x=dest2,y=origin2)) 
p + geom_tile(aes(fill=value)) + scale_fill_gradient(name = "Settlement (%)",low = "white",high = "steelblue") + labs(x = "Destination",y = "Origin")

