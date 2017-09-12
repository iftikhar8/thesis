library(tidyverse)
library(vegan)


# nMDS Analysis
headings <- c("id","birthday","region","source","age","recruited","settle")

# Read is the collection of files
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/models/passive")
setwd(path)
passive.data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
colnames(passive.data) <- headings
passive.data$birthday <- as.Date(passive.data$birthday)
passive.data$recruited <- as.Date(passive.data$recruited)
passive.data <- as.tibble(passive.data)
passive.data <- mutate(passive.data,days = age/86400)
passive.settlement <- summarize(group_by(passive.data, settle), passive = n())

path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/models/diel")
setwd(path)
diel.data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
colnames(diel.data) <- headings
diel.data$birthday <- as.Date(diel.data$birthday)
diel.data$recruited <- as.Date(diel.data$recruited)
diel.data <- as.tibble(diel.data)
diel.data <- mutate(diel.data,days = age/86400)
diel.connectivity <- summarize(group_by(diel.data,source, settle), count = n())
diel.settlement <- summarize(group_by(diel.data, settle), diel = n())

path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/models/ovm")
setwd(path)
ovm.data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
colnames(ovm.data) <- headings
ovm.data$birthday <- as.Date(ovm.data$birthday)
ovm.data$recruited <- as.Date(ovm.data$recruited)
ovm.data <- as.tibble(ovm.data)
ovm.data <- mutate(ovm.data,days = age/86400)
ovm.connectivity <- summarize(group_by(ovm.data,source, settle), count = n())
ovm.settlement <- summarize(group_by(ovm.data, settle), ovm = n())

path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/models/orientate")
setwd(path)
orientate.data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
colnames(orientate.data) <- headings
orientate.data$birthday <- as.Date(orientate.data$birthday)
orientate.data$recruited <- as.Date(orientate.data$recruited)
orientate.data <- as.tibble(orientate.data)
orientate.data <- mutate(orientate.data,days = age/86400)
orientate.connectivity <- summarize(group_by(orientate.data,source, settle), count = n())
orientate.settlement <- summarize(group_by(orientate.data, settle), orientate = n())

phase1.data <- passive.settlement %>% full_join(diel.settlement) %>% full_join(ovm.settlement) %>% full_join(orientate.settlement)
phase1.community_matrix <- data.matrix(phase1.data)
row.names(phase1.community_matrix) <- phase1.data$settle
phase1.community_matrix <- phase1.community_matrix[,2:5]
phase1.community_matrix.t <- t(phase1.community_matrix)
phase1.community_matrix.t[is.na(phase1.community_matrix.t)] <- 0

# nMDS
phase1.nmds <- metaMDS(phase1.community_matrix.t, k=2, trymax=100)
stressplot(phase1.nmds)
plot(phase1.nmds)

# Connectivity analysis
reefs <- read_csv("../../data/reefs.csv")
#passive.connectivity <- summarize(group_by(passive.data,source, settle), count = n())
passive.connectivity <- left_join(passive.data, reefs,by=c("settle"="PATCH_NUM"))
passive.connectivity <- rename(passive.connectivity, settle.region=REGION)
passive.connectivity <- left_join(passive.connectivity, reefs,by=c("source"="PATCH_NUM"))
passive.connectivity <- rename(passive.connectivity, source.region=REGION)
passive.region <- summarize(group_by(passive.connectivity,source.region, settle.region), count = n())
passive.region <- spread(passive.region,key=settle.region,value=count)
passive.region_matrix <- data.matrix(passive.region)
row.names(passive.region_matrix) <- passive.region$source.region
passive.region_matrix <- passive.region_matrix[,-1]
passive.reef_matrix <- summarize(group_by(passive.connectivity,source, settle), count = n())

diel.connectivity <- left_join(diel.data, reefs,by=c("settle"="PATCH_NUM"))
diel.connectivity <- rename(diel.connectivity, settle.region=REGION)
diel.connectivity <- left_join(diel.connectivity, reefs,by=c("source"="PATCH_NUM"))
diel.connectivity <- rename(diel.connectivity, source.region=REGION)
diel.region <- summarize(group_by(diel.connectivity,source.region, settle.region), count = n())
diel.region <- spread(diel.region,key=settle.region,value=count)
diel.region_matrix <- data.matrix(diel.region)
row.names(diel.region_matrix) <- diel.region$source.region
diel.region_matrix <- diel.region_matrix[,-1]
diel.reef_matrix <- summarize(group_by(diel.connectivity,source, settle), count = n())

ovm.connectivity <- left_join(ovm.data, reefs,by=c("settle"="PATCH_NUM"))
ovm.connectivity <- rename(ovm.connectivity, settle.region=REGION)
ovm.connectivity <- left_join(ovm.connectivity, reefs,by=c("source"="PATCH_NUM"))
ovm.connectivity <- rename(ovm.connectivity, source.region=REGION)
ovm.region <- summarize(group_by(ovm.connectivity,source.region, settle.region), count = n())
ovm.region <- spread(ovm.region,key=settle.region,value=count)
ovm.region_matrix <- data.matrix(ovm.region)
row.names(ovm.region_matrix) <- ovm.region$source.region
ovm.region_matrix <- ovm.region_matrix[,-1]
ovm.reef_matrix <- summarize(group_by(ovm.connectivity,source, settle), count = n())

orientate.connectivity <- left_join(orientate.data, reefs,by=c("settle"="PATCH_NUM"))
orientate.connectivity <- rename(orientate.connectivity, settle.region=REGION)
orientate.connectivity <- left_join(orientate.connectivity, reefs,by=c("source"="PATCH_NUM"))
orientate.connectivity <- rename(orientate.connectivity, source.region=REGION)
orientate.region <- summarize(group_by(orientate.connectivity,source.region, settle.region), count = n())
orientate.region <- spread(orientate.region,key=settle.region,value=count)
orientate.region_matrix <- data.matrix(orientate.region)
row.names(orientate.region_matrix) <- orientate.region$source.region
orientate.region_matrix <- orientate.region_matrix[,-1]
orientate.reef_matrix <- summarize(group_by(orientate.connectivity,source, settle), count = n())
