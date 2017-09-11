library(tidyverse)

# Read in the data

headings <- c("id","birthday","region","source","age","recruited","settle")

# Read is the collection of files
path <- c("/Users/steve/Downloads/")
setwd(path)
passive.data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
colnames(passive.data) <- headings
passive.data$birthday <- as.Date(passive.data$birthday)
passive.data$recruited <- as.Date(passive.data$recruited)
passive.data <- as.tibble(passive.data)
passive.data <- mutate(passive.data,days = age/86400)
passive.connectivity <- summarize(group_by(passive.data,source, settle), count = n())
passive.settlement <- summarize(group_by(passive.data, settle), passive = n())

path <- c("/Users/steve/Downloads/")
setwd(path)
diel.data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
colnames(diel.data) <- headings
diel.data$birthday <- as.Date(diel.data$birthday)
diel.data$recruited <- as.Date(diel.data$recruited)
diel.data <- as.tibble(diel.data)
diel.data <- mutate(diel.data,days = age/86400)
diel.connectivity <- summarize(group_by(diel.data,source, settle), count = n())
diel.settlement <- summarize(group_by(diel.data, settle), diel = n())

path <- c("/Users/steve/Downloads/")
setwd(path)
ovm.data <- do.call(rbind,lapply(list.files(pattern="\\connectivity-matrix.csv", recursive = TRUE), read.csv, stringsAsFactors=FALSE))
colnames(ovm.data) <- headings
ovm.data$birthday <- as.Date(ovm.data$birthday)
ovm.data$recruited <- as.Date(ovm.data$recruited)
ovm.data <- as.tibble(ovm.data)
ovm.data <- mutate(ovm.data,days = age/86400)
ovm.connectivity <- summarize(group_by(ovm.data,source, settle), count = n())
ovm.settlement <- summarize(group_by(ovm.data, settle), ovm = n())

path <- c("/Users/steve/Downloads/")
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
phase1.community_matrix <- data.matrix(phase1.community_matrix)
row.names(phase1.community_matrix) <- phase1.data$settle

# nMDS
phase1.nmds <- metaMDS(phase1.community_matrix, k=2, trymax=100)
stressplot(phase1.nmds)
plot(phase1.nmds)



