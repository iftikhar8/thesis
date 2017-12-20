read_in_connectivity <- function(path) {
  oldpath <- getwd()
  setwd(path)
  data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
  data <- as.tibble(data)
  #reefs <- summarize(group_by(data, settle), count = n())
  #rm(data)
  setwd(oldpath)
  data
}

read_in_dispersal_kernel <- function(path) {
  oldpath <- getwd()
  setwd(path)
  data <- do.call(rbind,lapply(list.files(pattern="\\kernel.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
  data <- data[complete.cases(data),]
  data <- as.tibble(data)
  data <- data %>% filter(distance > 0) %>% mutate(distance.km = distance/1000)
  #reefs <- summarize(group_by(data, settle), count = n())
  #rm(data)
  setwd(oldpath)
  data
}

get_connectivity_matrix_reefs <- function(data) {
  connectivity_matrix <- summarize(group_by(data, source, settle), count = n())
  connectivity_matrix <- spread(connectivity_matrix,key=settle, value=count)
  connectivity_matrix <- data.matrix(connectivity_matrix)
  row.names(connectivity_matrix) <- connectivity_matrix[,1]
  connectivity_matrix <- connectivity_matrix[,-1]
  connectivity_matrix[is.na(connectivity_matrix)] <- 0
  connectivity_matrix
}

get_connectivity_matrix_regions <- function(data, reefs) {
  regions <- left_join(data, reefs, by=c("settle"="PATCH_NUM"))
  regions <- rename(regions, settle.region=REGION)
  regions <- left_join(regions, reefs, by=c("source"="PATCH_NUM"))
  regions <- rename(regions, source.region=REGION)
  regions <- summarize(group_by(regions, source.region, settle.region), count=n())
  connectivity_matrix <- spread(regions,key=settle.region, value=count)
  connectivity_matrix <- data.matrix(connectivity_matrix)
  row.names(connectivity_matrix) <- connectivity_matrix[,1]
  connectivity_matrix <- connectivity_matrix[,-1]
  connectivity_matrix[is.na(connectivity_matrix)] <- 0
  connectivity_matrix
}

settlementSuccess <- function(data) {
  ss <- rowSums(data)
  names(ss) <- colnames(data)
  ss
}

get_dispersal_distance_regions <- function(data, reefs) {
  regions <- left_join(data, reefs, by=c("birth.reef"="PATCH_NUM"))
  regions <- rename(regions, source.region=REGION)
  dispersal_kernel <- summarize(group_by(regions, source.region), mean.distance = mean(distance.km), sd.distance = sd(distance.km))
  dispersal_kernel
}

get_regions <- function(reefs, mapping) {
  regions <- left_join(reefs, mapping, by=c("settle"="PATCH_NUM"))
  regions <- rename(regions, settle.region=REGION)
  regions <- left_join(regions, mapping, by=c("source"="PATCH_NUM"))
  regions <- rename(regions, source.region=REGION)
  regions <- summarize(group_by(regions, source.region, settle.region), count =sum(count))
}

get_community_matrix <- function(data, is_reef) {
  community_matrix <- data.matrix(data)
  if(is_reef) {
    row.names(community_matrix) <- data$settle
  } else {
    row.names(community_matrix) <- data$settle.region
  }
  community_matrix <-community_matrix[,-1]
  community_matrix.transposed <- t(community_matrix)
  community_matrix.transposed[is.na(community_matrix.transposed)] <- 0
  community_matrix.transposed
}

min.mean.sd.max <- function(x) {
  r <- c(min(x), mean(x) - sd(x), mean(x), mean(x) + sd(x), max(x))
  names(r) <- c("ymin", "lower", "middle", "upper", "ymax")
  r
}
