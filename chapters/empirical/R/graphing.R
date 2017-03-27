## Build the graph
graphBuilder <- function(data,title){
  
  # Order the factors to print nicely on x-axis
  data$depth <- factor(data$depth,levels=c("0","25","75"))
  
  graph <- ggplot(data, 
                  aes(x = depth, y = prop, fill = stage, group=stage, shape=stage, colour=stage, ymax=1.0, ymin=0)) +
    geom_line(size=1.5) +
    geom_point(size=4) +
    ggtitle(title) +
    scale_y_continuous(breaks = seq(0, 1.0, 0.1), 
                       limits = c(0, 1.0), 
                       expand = c(0, 0)) +
    scale_x_discrete(labels=c("0-3","3-50","50-100")) +
    labs(y = "Depth (m)", x = "Proportion") +
    scale_colour_brewer(palette="Dark2") +
    theme(text = element_text(size=20))
  return(graph)
}

printLineGraphForFish <- function(countdata,title) {
  prop <- getProportions(countdata)
  graphBuilder(prop,title)
}

printMosaicGraphForFish <- function(countdata) {
  matrix <- acast(countdata,depth ~ stage, value.var="count")
  print(matrix)
  plot(ca(matrix))
  mosaic(matrix,shade=T,legend=T)
  assoc(matrix,shade=T,legend=T)
}
