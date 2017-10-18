library(tidyverse)
library(vegan)
library(ConnMatTools)


# nMDS Analysis
##headings <- c("id","birthday","region","source","age","recruited","settle")
reefs.id <- read_csv("../../data/reefs.csv")
source("theoretical-functions.R")

eggs <- 248000
# Passive data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/passive")
passive.data.conn <- read_in_connectivity(path)
passive.reefs <- summarize(group_by(passive.data.conn, settle), count = n())
passive.regions <- get_regions(passive.reefs, reefs.id)
passive.conn.reefs <- get_connectivity_matrix_reefs(passive.data.conn)/eggs
passive.conn.regions <- get_connectivity_matrix_regions(passive.data.conn, reefs.id)/eggs
passive.conn.regions <- passive.conn.regions[,-18]
passive.sr <- selfRecruitment(passive.conn.regions)
passive.lr <- localRetention(passive.conn.regions)
passive.rlr <- relativeLocalRetention(passive.conn.regions)
passive.ss <- settlementSuccess(passive.conn.regions)
passive.dk <- read_in_dispersal_kernel(path)
passive.dk.regions <- get_dispersal_distance_regions(passive.dk, reefs.id)
passive.reefs <- rename(passive.reefs, passive=count)
passive.regions <- rename(passive.regions, passive=count)
rm(passive.data.conn)
#rm(passive.data.dk)

# passive.cm <- summarize(group_by(passive.data, source, settle), passive = n())
# passive.cm <- spread(passive.cm,key=settle,value=passive)
# passive.cm <- data.matrix(passive.cm)
#row.names(passive.cm) <- passive.cm$source.region
#diel.region_matrix <- diel.region_matrix[,-1]

# Diel data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/diel")
diel.data.conn <- read_in_connectivity(path)
diel.reefs <- summarize(group_by(diel.data.conn, settle), count = n())
diel.regions <- get_regions(diel.reefs, reefs.id)
diel.conn.reefs <- get_connectivity_matrix_reefs(diel.data.conn)/eggs
diel.conn.regions <- get_connectivity_matrix_regions(diel.data.conn, reefs.id)/eggs
diel.conn.regions <- diel.conn.regions[,-18]
diel.sr <- selfRecruitment(diel.conn.regions)
diel.lr <- localRetention(diel.conn.regions)
diel.rlr <- relativeLocalRetention(diel.conn.regions)
diel.ss <- settlementSuccess(diel.conn.regions)
diel.dk <- read_in_dispersal_kernel(path)
diel.dk.regions <- get_dispersal_distance_regions(diel.dk, reefs.id)
diel.reefs <- rename(diel.reefs, diel=count)
diel.regions <- rename(diel.regions, diel=count)
rm(diel.data.conn)

# OVM data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm")
ovm.data.conn <- read_in_connectivity(path)
ovm.reefs <- summarize(group_by(ovm.data.conn, settle), count = n())
ovm.regions <- get_regions(ovm.reefs, reefs.id)
ovm.conn.reefs <- get_connectivity_matrix_reefs(ovm.data.conn)/eggs
ovm.conn.regions <- get_connectivity_matrix_regions(ovm.data.conn, reefs.id)/eggs
ovm.conn.regions <- ovm.conn.regions[,-18]
ovm.sr <- selfRecruitment(ovm.conn.regions)
ovm.lr <- localRetention(ovm.conn.regions)
ovm.rlr <- relativeLocalRetention(ovm.conn.regions)
ovm.ss <- settlementSuccess(ovm.conn.regions)
ovm.dk <- read_in_dispersal_kernel(path)
ovm.dk.regions <- get_dispersal_distance_regions(ovm.dk, reefs.id)
ovm.reefs <- rename(ovm.reefs, ovm=count)
ovm.regions <- rename(ovm.regions, ovm=count)
rm(ovm.data.conn)


# Orientate data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/orientate")
orientate.data.conn <- read_in_connectivity(path)
orientate.reefs <- summarize(group_by(orientate.data.conn, settle), count = n())
orientate.regions <- get_regions(orientate.reefs, reefs.id)
orientate.conn.reefs <- get_connectivity_matrix_reefs(orientate.data.conn)/eggs
orientate.conn.regions <- get_connectivity_matrix_regions(orientate.data.conn, reefs.id)/eggs
orientate.conn.regions <- orientate.conn.regions[,-18]
orientate.sr <- selfRecruitment(orientate.conn.regions)
orientate.lr <- localRetention(orientate.conn.regions)
orientate.rlr <- relativeLocalRetention(orientate.conn.regions)
orientate.ss <- settlementSuccess(orientate.conn.regions)
orientate.dk <- read_in_dispersal_kernel(path)
orientate.dk.regions <- get_dispersal_distance_regions(orientate.dk, reefs.id)
orientate.reefs <- rename(orientate.reefs, orientate=count)
orientate.regions <- rename(orientate.regions, orientate=count)
rm(orientate.data.conn)

# Diel-orientate data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/diel-orientate")
diel.orientate.data.conn <- read_in_connectivity(path)
diel.orientate.reefs <- summarize(group_by(diel.orientate.data.conn, settle), count = n())
diel.orientate.regions <- get_regions(diel.orientate.reefs, reefs.id)
diel.orientate.conn.reefs <- get_connectivity_matrix_reefs(diel.orientate.data.conn)/eggs
diel.orientate.conn.regions <- get_connectivity_matrix_regions(diel.orientate.data.conn, reefs.id)/eggs
diel.orientate.conn.regions <- diel.orientate.conn.regions[,-18]
diel.orientate.sr <- selfRecruitment(diel.orientate.conn.regions)
diel.orientate.lr <- localRetention(diel.orientate.conn.regions)
diel.orientate.rlr <- relativeLocalRetention(diel.orientate.conn.regions)
diel.orientate.ss <- settlementSuccess(diel.orientate.conn.regions)
diel.orientate.dk <- read_in_dispersal_kernel(path)
diel.orientate.dk.regions <- get_dispersal_distance_regions(diel.orientate.dk, reefs.id)
diel.orientate.reefs <- rename(diel.orientate.reefs, diel.orientate=count)
diel.orientate.regions <- rename(diel.orientate.regions, diel.orientate=count)
rm(diel.orientate.data.conn)

# Diel-ovm data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/diel-ovm")
diel.ovm.data.conn <- read_in_connectivity(path)
diel.ovm.reefs <- summarize(group_by(diel.ovm.data.conn, settle), count = n())
diel.ovm.regions <- get_regions(diel.ovm.reefs, reefs.id)
diel.ovm.conn.reefs <- get_connectivity_matrix_reefs(diel.ovm.data.conn)/eggs
diel.ovm.conn.regions <- get_connectivity_matrix_regions(diel.ovm.data.conn, reefs.id)/eggs
diel.ovm.conn.regions <- diel.ovm.conn.regions[,-18]
diel.ovm.sr <- selfRecruitment(diel.ovm.conn.regions)
diel.ovm.lr <- localRetention(diel.ovm.conn.regions)
diel.ovm.rlr <- relativeLocalRetention(diel.ovm.conn.regions)
diel.ovm.ss <- settlementSuccess(diel.ovm.conn.regions)
diel.ovm.dk <- read_in_dispersal_kernel(path)
diel.ovm.dk.regions <- get_dispersal_distance_regions(diel.ovm.dk, reefs.id)
diel.ovm.reefs <- rename(diel.ovm.reefs, diel.ovm=count)
diel.ovm.regions <- rename(diel.ovm.regions, diel.ovm=count)
rm(diel.ovm.data.conn)

# Diel-ovm-orientate data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/diel-ovm-orientate")
diel.ovm.orientate.data.conn <- read_in_connectivity(path)
diel.ovm.orientate.reefs <- summarize(group_by(diel.ovm.orientate.data.conn, settle), count = n())
diel.ovm.orientate.regions <- get_regions(diel.ovm.orientate.reefs, reefs.id)
diel.ovm.orientate.conn.reefs <- get_connectivity_matrix_reefs(diel.ovm.orientate.data.conn)/eggs
diel.ovm.orientate.conn.regions <- get_connectivity_matrix_regions(diel.ovm.orientate.data.conn, reefs.id)/eggs
diel.ovm.orientate.conn.regions <- diel.ovm.orientate.conn.regions[,-18]
diel.ovm.orientate.sr <- selfRecruitment(diel.ovm.orientate.conn.regions)
diel.ovm.orientate.lr <- localRetention(diel.ovm.orientate.conn.regions)
diel.ovm.orientate.rlr <- relativeLocalRetention(diel.ovm.orientate.conn.regions)
diel.ovm.orientate.ss <- settlementSuccess(diel.ovm.orientate.conn.regions)
diel.ovm.orientate.dk <- read_in_dispersal_kernel(path)
diel.ovm.orientate.dk.regions <- get_dispersal_distance_regions(diel.ovm.orientate.dk, reefs.id)
diel.ovm.orientate.reefs <- rename(diel.ovm.orientate.reefs, diel.ovm.orientate=count)
diel.ovm.orientate.regions <- rename(diel.ovm.orientate.regions, diel.ovm.orientate=count)
rm(diel.ovm.orientate.data.conn)

# Ovm-orientate data
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-orientate")
ovm.orientate.data.conn <- read_in_connectivity(path)
ovm.orientate.reefs <- summarize(group_by(ovm.orientate.data.conn, settle), count = n())
ovm.orientate.regions <- get_regions(ovm.orientate.reefs, reefs.id)
ovm.orientate.conn.reefs <- get_connectivity_matrix_reefs(ovm.orientate.data.conn)/eggs
ovm.orientate.conn.regions <- get_connectivity_matrix_regions(ovm.orientate.data.conn, reefs.id)/eggs
ovm.orientate.conn.regions <- ovm.orientate.conn.regions[,-18]
ovm.orientate.sr <- selfRecruitment(ovm.orientate.conn.regions)
ovm.orientate.lr <- localRetention(ovm.orientate.conn.regions)
ovm.orientate.rlr <- relativeLocalRetention(ovm.orientate.conn.regions)
ovm.orientate.ss <- settlementSuccess(ovm.orientate.conn.regions)
ovm.orientate.dk <- read_in_dispersal_kernel(path)
ovm.orientate.dk.regions <- get_dispersal_distance_regions(ovm.orientate.dk, reefs.id)
ovm.orientate.reefs <- rename(ovm.orientate.reefs, ovm.orientate=count)
ovm.orientate.regions <- rename(ovm.orientate.regions, ovm.orientate=count)
rm(ovm.orientate.data.conn)

#ovm-pomacentrid
ovm.pomacentrid.reefs <- rename(ovm.reefs, pomacentridae=ovm)
ovm.pomacentrid.regions <- rename(ovm.regions, pomacentridae=ovm)

#ovm-labrid
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-labrid")
ovm.labrid.reefs <- read_in_connectivity(path)
ovm.labrid.regions <- get_regions(ovm.labrid.reefs, reefs.id)
ovm.labrid.reefs <- rename(ovm.labrid.reefs, labridae=count)
ovm.labrid.regions <- rename(ovm.labrid.regions, labridae=count)

#ovm-mullid
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-mullid")
ovm.mullid.reefs <- read_in_connectivity(path)
ovm.mullid.regions <- get_regions(ovm.mullid.reefs, reefs.id)
ovm.mullid.reefs <- rename(ovm.mullid.reefs, mullidae=count)
ovm.mullid.regions <- rename(ovm.mullid.regions, mullidae=count)

#ovm-scarid
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-scarid")
ovm.scarid.reefs <- read_in_connectivity(path)
ovm.scarid.regions <- get_regions(ovm.scarid.reefs, reefs.id)
ovm.scarid.reefs <- rename(ovm.scarid.reefs, scaridae=count)
ovm.scarid.regions <- rename(ovm.scarid.regions, scaridae=count)


#ovm-scorp
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-scorp")
ovm.scorpaenid.reefs <- read_in_connectivity(path)
ovm.scorpaenid.regions <-  get_regions(ovm.scorpaenid.reefs, reefs.id)
ovm.scorpaenid.reefs <- rename(ovm.scorpaenid.reefs, scorpaenidae=count)
ovm.scorpaenid.regions <- rename(ovm.scorpaenid.regions, scorpaenidae=count)


#ovm-serranid
path <- c("/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-serranid")
ovm.serranid.reefs <- read_in_connectivity(path)
ovm.serranid.regions <-  get_regions(ovm.serranid.reefs, reefs.id)
ovm.serranid.reefs <- rename(ovm.serranid.reefs, serranidae=count)
ovm.serranid.regions <- rename(ovm.serranid.regions, serranidae=count)


#ovm-synod
path <- "/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-synod"
ovm.synodontid.reefs <- read_in_connectivity(path)
ovm.synodontid.regions <- get_regions(ovm.synodontid.reefs, reefs.id)
ovm.synodontid.reefs <- rename(ovm.synodontid.reefs, synodontidae=count)
ovm.synodontid.regions <- rename(ovm.synodontid.regions, synodontidae=count)

#ovm-impl1
ovm.stage.reefs <- rename(ovm.reefs, stage=ovm)
ovm.stage.regions <- rename(ovm.regions, stage=ovm)

#ovm-impl2
path <- "/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-daily"
ovm.daily.reefs <- read_in_connectivity(path)
ovm.daily.regions <- get_regions(ovm.daily.reefs, reefs.id)
ovm.daily.reefs <- rename(ovm.daily.reefs, daily=count)
ovm.daily.regions <- rename(ovm.daily.regions, daily=count)

#ovm-impl3
path <- "/Users/steve/Documents/PhD/Thesis/chapters/theoretical/data/model-output/ovm-timestep"
ovm.timestep.reefs <- read_in_connectivity(path)
ovm.timestep.regions <- get_regions(ovm.timestep.reefs, reefs.id)
ovm.timestep.reefs <- rename(ovm.timestep.reefs, timestep=count)
ovm.timestep.regions <- rename(ovm.timestep.regions, timestep=count)


phase1.reefs.data <- passive.reefs %>% full_join(diel.reefs) %>% full_join(ovm.reefs) %>% full_join(orientate.reefs) %>% 
  full_join(diel.ovm.orientate.reefs) %>% full_join(ovm.orientate.reefs) %>% full_join(diel.ovm.reefs) %>% full_join(diel.orientate.reefs) 
phase1.regions.data <- passive.regions %>% full_join(diel.regions) %>% full_join(ovm.regions) %>% full_join(orientate.regions) %>% 
  full_join(diel.ovm.orientate.regions) %>% full_join(ovm.orientate.regions) %>% full_join(diel.ovm.regions) %>% full_join(diel.orientate.regions)

names <- c("passive","diel","ovm","orientate","diel-ovm","diel-ovm-orientate","ovm-orientate","diel-orientate")
phase1.sr <- as.tibble(t(rbind(passive.sr, diel.sr, ovm.sr, orientate.sr,diel.ovm.sr, diel.ovm.orientate.sr, ovm.orientate.sr, diel.orientate.sr)))
colnames(phase1.sr) <- names
phase1.sr <- gather(phase1.sr)
colnames(phase1.sr) <- c("model","sr")
phase1.sr$model <- as.factor(phase1.sr$model)
phase1.summary <- summarise(group_by(phase1.sr,model), sr.mean=mean(sr), sr.sd=sd(sr), sr.se = sr.sd/n())
ggplot(data=phase1.summary, aes(y=sr.mean, x=model)) + geom_point() + geom_errorbar(aes(ymin=sr.mean-sr.se,ymax=sr.mean+sr.se),width=.1)
phase1.glm.sr <- glm(sr ~ model, family = binomial, phase1.sr)

phase1.lr <- as.tibble(t(rbind(passive.lr, diel.lr, ovm.lr, orientate.lr,diel.ovm.lr, diel.ovm.orientate.lr, ovm.orientate.lr, diel.orientate.lr)))
colnames(phase1.lr) <- names
phase1.lr <- gather(phase1.lr)
colnames(phase1.lr) <- c("model","lr")
phase1.lr$model <- as.factor(phase1.lr$model)
phase1.summary <- summarise(group_by(phase1.lr,model), lr.mean=mean(lr), lr.sd=sd(lr), lr.se = lr.sd/n())
ggplot(data=phase1.summary, aes(y=lr.mean, x=model)) + geom_point() + geom_errorbar(aes(ymin=lr.mean-lr.se,ymax=lr.mean+lr.se),width=.1)
phase1.lr.glm <- glm(lr ~ model, family=binomial, phase1.lr)

phase1.rlr <- as.tibble(t(rbind(passive.rlr, diel.rlr, ovm.rlr, orientate.rlr,diel.ovm.rlr, diel.ovm.orientate.rlr, ovm.orientate.rlr, diel.orientate.rlr)))
colnames(phase1.rlr) <- names
phase1.rlr <- gather(phase1.rlr)
colnames(phase1.rlr) <- c("model","rlr")
phase1.rlr$model <- as.factor(phase1.rlr$model)
phase1.summary <- summarise(group_by(phase1.rlr,model), rlr.mean=mean(rlr), rlr.sd=sd(rlr), rlr.se = rlr.sd/n())
ggplot(data=phase1.summary, aes(y=rlr.mean, x=model)) + geom_point() + geom_errorbar(aes(ymin=rlr.mean-rlr.se,ymax=rlr.mean+rlr.se),width=.1)
phase1.glm.rlr <- glm(rlr ~ model, family = binomial, phase1.rlr)

phase1.dk <- as.tibble(cbind(passive.dk$distance.km, diel.dk$distance.km, ovm.dk$distance.km, orientate.dk$distance.km,diel.ovm.dk$distance.km, 
                   diel.ovm.orientate.dk$distance.km, ovm.orientate.dk$distance.km, diel.orientate.dk$distance.km))
colnames(phase1.dk) <- names
phase1.dk <- gather(phase1.dk)
colnames(phase1.dk) <- c("model","dk")
phase1.dk$model <- as.factor(phase1.dk$model)
phase1.summary <- summarise(group_by(phase1.dk,model), dk.mean=mean(dk), dk.sd=sd(dk), dk.se = dk.sd/n())
ggplot(data=phase1.summary, aes(y=dk.mean, x=model)) + geom_point() + geom_errorbar(aes(ymin=dk.mean-dk.se,ymax=dk.mean+dk.se),width=.1)


phase2.reefs.data <- ovm.pomacentrid.reefs %>% full_join(ovm.labrid.reefs) %>% full_join(ovm.mullid.reefs) %>% full_join(ovm.scarid.reefs) %>% 
  full_join(ovm.scorpaenid.reefs) %>% full_join(ovm.serranid.reefs) %>% full_join(ovm.synodontid.reefs)
phase2.regions.data <- ovm.pomacentrid.regions %>% full_join(ovm.labrid.regions) %>% full_join(ovm.mullid.regions) %>% full_join(ovm.scarid.regions) %>% 
  full_join(ovm.scorpaenid.regions) %>% full_join(ovm.serranid.regions) %>% full_join(ovm.synodontid.regions)

phase3.reefs.data <- ovm.stage.reefs %>% full_join(ovm.timestep.reefs) %>% full_join(ovm.daily.reefs)
phase3.regions.data <- ovm.stage.regions %>% full_join(ovm.timestep.regions) %>% full_join(ovm.daily.regions)

reefs.data <- phase1.reefs.data %>% full_join(phase2.reefs.data) %>% full_join(phase3.reefs.data)
regions.data <- phase1.regions.data %>% full_join(phase2.regions.data) %>% full_join(phase3.regions.data)

model <- c("passive","diel","ovm","orientate","diel.orientate","ovm.orientate","diel.ovm.orientate","diel.ovm","ovm.serranid","ovm.scorpaenid","ovm.scarid","ovm.labrid","ovm.pomacentrid","ovm.synodontid","ovm.mullid","ovm.daily","ovm.timestep","ovm.stage")
phase <- c("group1","group1","group1","group1","group1","group1","group1","group1","group2","group2","group2","group2","group2","group2","group2","group3","group3","group3")
phases <- data.frame(model,phase)

# Community matrices for ordination 

phase1.reefs.community_matrix <- get_community_matrix(phase1.reefs.data,TRUE)
phase1.regions.community_matrix <- get_community_matrix(phase1.regions.data,FALSE)
phase2.reefs.community_matrix <- get_community_matrix(phase2.reefs.data,TRUE)
phase2.regions.community_matrix <- get_community_matrix(phase2.regions.data,FALSE)
phase3.reefs.community_matrix <- get_community_matrix(phase3.reefs.data,TRUE)
phase3.regions.community_matrix <- get_community_matrix(phase3.regions.data,FALSE)

reefs.community_matrix <- get_community_matrix(reefs.data,TRUE)
regions.community_matrix <- get_community_matrix(regions.data,FALSE)

# nMDS 
reefs.nmds <- metaMDS(reefs.community_matrix, distance="bray", k=2)
plot(reefs.nmds, disp="sites")
ordiellipse(reefs.nmds, group=phases$phase, col=2:4, kind = "ehull", lwd=2, label = TRUE)
#ordilabel(reefs.nmds)


regions.nmds <- metaMDS(regions.community_matrix,distance="bray", k=2)
plot(regions.nmds, display="sites")
ordiellipse(regions.nmds, group=phases$phase, col=2:4, kind = "ehull", lwd=2)

# PCA
phase1.regions.rda <- rda(phase1.regions.community_matrix, scale = TRUE)
biplot(phase1.regions.rda, display=c("sites","species"), type=c("points"), scaling = 3)
orditorp(phase1.regions.rda, display="species")
ordilabel(phase1.regions.rda, scaling = 3)

phase2.regions.rda <- rda(phase2.regions.community_matrix, scale = TRUE)
biplot(phase2.regions.rda, display=c("sites","species"), type=c("points","text"), scaling = 3)
orditorp(phase2.regions.rda, display="species")
ordilabel(phase2.regions.rda, scaling = 3)

phase3.regions.rda <- rda(phase3.regions.community_matrix, scale = TRUE)
biplot(phase3.regions.rda, display=c("sites","species"), type=c("text"), scaling = 3)
orditorp(phase3.regions.rda, display="species")
ordilabel(phase3.regions.rda, scaling = 3)





#passive.connectivity <- summarize(group_by(passive.data,source, settle), count = n())
passive.connectivity <- left_join(passive.data, reefs,by=c("settle"="PATCH_NUM"))
passive.connectivity <- rename(passive.connectivity, settle.region=REGION)
passive.connectivity <- left_join(passive.connectivity, reefs,by=c("source"="PATCH_NUM"))
passive.connectivity <- rename(passive.connectivity, source.region=REGION)
#passive.connectivity <- as.factor(passive.connectivity$source.region)
passive.region <- summarize(group_by(passive.connectivity, source.region, settle), count = n())
passive.region_matrix <- data.matrix(passive.region)
row.names(passive.region_matrix) <- passive.region$source.region
passive.region_matrix <- passive.region_matrix[,-1]
#passive.reef_matrix <- summarize(group_by(passive.connectivity,source, settle), count = n())

phase1.nmds <- metaMDS(passive.region_matrix, k=2, trymax=100)
stressplot(phase1.nmds)
plot(phase1.nmds)

passive.region <- spread(passive.region,key=settle,value=count)

phase1.connectivity <- left_join(phase1.data, reefs,by=c("settle"="PATCH_NUM"))
phase1.connectivity <- rename(phase1.connectivity, settle.region=REGION)
#phase1.connectivity$settle.region <- as.factor(phase1.connectivity$settle.region)
phase1.connectivity2 <- phase1.connectivity %>% select(-HABITAT,-settle)

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
