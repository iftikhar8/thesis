getFishData <- function(df,pre.name,fle.name,post.name){
  fish <- subset(df,select = c("site","depth", pre.name, fle.name, post.name))
  
  names(fish) <- c("site","depth","preflexion","flexion","postflexion")
  fishmelt <- melt(fish, id.vars = c("site","depth"),
                   measure.vars = c("preflexion","flexion","postflexion"),
                   variable.name = "stage")
  fishmelt <- group_by(fishmelt, depth, stage)
  fishmelt
}