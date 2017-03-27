## Calculate the proportions of each stage per depth
getProportions <- function(data){
  data$sum[data$stage == 'preflexion'] = sum(data$count[data$stage == 'preflexion'])
  data$sum[data$stage == 'flexion'] = sum(data$count[data$stage == 'flexion'])
  data$sum[data$stage == 'postflexion'] = sum(data$count[data$stage == 'postflexion'])
  data = mutate(data, prop = count / sum)
  return(data)
}