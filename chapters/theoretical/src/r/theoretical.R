library(tidyverse)
library(vegan)
library(ConnMatTools)
source("theoretical-functions.R")

# nMDS Analysis
##headings <- c("id","birthday","region","source","age","recruited","settle")

load(file="phase1.rda")
load(file="phase2.rda")
load(file="phase3.rda")
load(file="reefs.rda")

passive.regions <- get_regions(passive.reefs, reefs.id)
passive.conn.regions <- passive.conn.regions[,-18]
passive.sr <- selfRecruitment(passive.conn.regions)
passive.lr <- localRetention(passive.conn.regions)
passive.rlr <- relativeLocalRetention(passive.conn.regions)
passive.ss <- settlementSuccess(passive.conn.regions)
passive.reefs <- rename(passive.reefs, passive=count)
passive.regions <- rename(passive.regions, passive=count)

#rm(passive.data.dk)

# passive.cm <- summarize(group_by(passive.data, source, settle), passive = n())
# passive.cm <- spread(passive.cm,key=settle,value=passive)
# passive.cm <- data.matrix(passive.cm)
#row.names(passive.cm) <- passive.cm$source.region
#diel.region_matrix <- diel.region_matrix[,-1]

# Diel data
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/diel")
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
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm")
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
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/orientate")
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
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/diel-orientate")
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
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/diel-ovm")
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
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/diel-ovm-orientate")
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
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-orientate")
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
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-labrid")
ovm.labrid.data.conn <- read_in_connectivity(path)
ovm.labrid.reefs <- summarize(group_by(ovm.labrid.data.conn, settle), count = n())
ovm.labrid.regions <- get_regions(ovm.labrid.reefs, reefs.id)
ovm.labrid.conn.reefs <- get_connectivity_matrix_reefs(ovm.labrid.data.conn)/eggs
ovm.labrid.conn.regions <- get_connectivity_matrix_regions(ovm.labrid.data.conn, reefs.id)/eggs
ovm.labrid.conn.regions <- ovm.labrid.conn.regions[,-18]
ovm.labrid.sr <- selfRecruitment(ovm.labrid.conn.regions)
ovm.labrid.lr <- localRetention(ovm.labrid.conn.regions)
ovm.labrid.rlr <- relativeLocalRetention(ovm.labrid.conn.regions)
ovm.labrid.ss <- settlementSuccess(ovm.labrid.conn.regions)
ovm.labrid.dk <- read_in_dispersal_kernel(path)
ovm.labrid.dk.regions <- get_dispersal_distance_regions(ovm.labrid.dk, reefs.id)
ovm.labrid.reefs <- rename(ovm.labrid.reefs, ovm.labrid=count)
ovm.labrid.regions <- rename(ovm.labrid.regions, ovm.labrid=count)
rm(ovm.labrid.data.conn)

#ovm-mullid
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-mullid")
ovm.mullid.data.conn <- read_in_connectivity(path)
ovm.mullid.reefs <- summarize(group_by(ovm.mullid.data.conn, settle), count = n())
ovm.mullid.regions <- get_regions(ovm.mullid.reefs, reefs.id)
ovm.mullid.conn.reefs <- get_connectivity_matrix_reefs(ovm.mullid.data.conn)/eggs
ovm.mullid.conn.regions <- get_connectivity_matrix_regions(ovm.mullid.data.conn, reefs.id)/eggs
ovm.mullid.conn.regions <- ovm.mullid.conn.regions[,-18]
ovm.mullid.sr <- selfRecruitment(ovm.mullid.conn.regions)
ovm.mullid.lr <- localRetention(ovm.mullid.conn.regions)
ovm.mullid.rlr <- relativeLocalRetention(ovm.mullid.conn.regions)
ovm.mullid.ss <- settlementSuccess(ovm.mullid.conn.regions)
ovm.mullid.dk <- read_in_dispersal_kernel(path)
ovm.mullid.dk.regions <- get_dispersal_distance_regions(ovm.mullid.dk, reefs.id)
ovm.mullid.reefs <- rename(ovm.mullid.reefs, ovm.mullid=count)
ovm.mullid.regions <- rename(ovm.mullid.regions, ovm.mullid=count)
rm(ovm.mullid.data.conn)

#ovm-scarid
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-scarid")
ovm.scarid.data.conn <- read_in_connectivity(path)
ovm.scarid.reefs <- summarize(group_by(ovm.scarid.data.conn, settle), count = n())
ovm.scarid.regions <- get_regions(ovm.scarid.reefs, reefs.id)
ovm.scarid.conn.reefs <- get_connectivity_matrix_reefs(ovm.scarid.data.conn)/eggs
ovm.scarid.conn.regions <- get_connectivity_matrix_regions(ovm.scarid.data.conn, reefs.id)/eggs
ovm.scarid.conn.regions <- ovm.scarid.conn.regions[,-18]
ovm.scarid.sr <- selfRecruitment(ovm.scarid.conn.regions)
ovm.scarid.lr <- localRetention(ovm.scarid.conn.regions)
ovm.scarid.rlr <- relativeLocalRetention(ovm.scarid.conn.regions)
ovm.scarid.ss <- settlementSuccess(ovm.scarid.conn.regions)
ovm.scarid.dk <- read_in_dispersal_kernel(path)
ovm.scarid.dk.regions <- get_dispersal_distance_regions(ovm.scarid.dk, reefs.id)
ovm.scarid.reefs <- rename(ovm.scarid.reefs, ovm.scarid=count)
ovm.scarid.regions <- rename(ovm.scarid.regions, ovm.scarid=count)
rm(ovm.scarid.data.conn)


#ovm-scorp
path <- c("/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-scorp")
ovm.scorpaenid.data.conn <- read_in_connectivity(path)
ovm.scorpaenid.reefs <- summarize(group_by(ovm.scorpaenid.data.conn, settle), count = n())
ovm.scorpaenid.regions <- get_regions(ovm.scorpaenid.reefs, reefs.id)
ovm.scorpaenid.conn.reefs <- get_connectivity_matrix_reefs(ovm.scorpaenid.data.conn)/eggs
ovm.scorpaenid.conn.regions <- get_connectivity_matrix_regions(ovm.scorpaenid.data.conn, reefs.id)/eggs
ovm.scorpaenid.conn.regions <- ovm.scorpaenid.conn.regions[,-18]
ovm.scorpaenid.sr <- selfRecruitment(ovm.scorpaenid.conn.regions)
ovm.scorpaenid.lr <- localRetention(ovm.scorpaenid.conn.regions)
ovm.scorpaenid.rlr <- relativeLocalRetention(ovm.scorpaenid.conn.regions)
ovm.scorpaenid.ss <- settlementSuccess(ovm.scorpaenid.conn.regions)
ovm.scorpaenid.dk <- read_in_dispersal_kernel(path)
ovm.scorpaenid.dk.regions <- get_dispersal_distance_regions(ovm.scorpaenid.dk, reefs.id)
ovm.scorpaenid.reefs <- rename(ovm.scorpaenid.reefs, ovm.scorpaenid=count)
ovm.scorpaenid.regions <- rename(ovm.scorpaenid.regions, ovm.scorpaenid=count)
rm(ovm.scorpaenid.data.conn)


#ovm-serranid


ovm.serranid.regions <- get_regions(ovm.serranid.reefs, reefs.id)
ovm.serranid.conn.regions <- ovm.serranid.conn.regions[,-18]
ovm.serranid.sr <- selfRecruitment(ovm.serranid.conn.regions)
ovm.serranid.lr <- localRetention(ovm.serranid.conn.regions)
ovm.serranid.rlr <- relativeLocalRetention(ovm.serranid.conn.regions)
ovm.serranid.ss <- settlementSuccess(ovm.serranid.conn.regions)
ovm.serranid.reefs <- rename(ovm.serranid.reefs, ovm.serranid=count)
ovm.serranid.regions <- rename(ovm.serranid.regions, ovm.serranid=count)
rm(ovm.serranid.data.conn)


#ovm-synod
path <- "/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-synod"
ovm.synodontid.data.conn <- read_in_connectivity(path)
ovm.synodontid.reefs <- summarize(group_by(ovm.synodontid.data.conn, settle), count = n())
ovm.synodontid.regions <- get_regions(ovm.synodontid.reefs, reefs.id)
ovm.synodontid.conn.reefs <- get_connectivity_matrix_reefs(ovm.synodontid.data.conn)/eggs
ovm.synodontid.conn.regions <- get_connectivity_matrix_regions(ovm.synodontid.data.conn, reefs.id)/eggs
ovm.synodontid.conn.regions <- ovm.synodontid.conn.regions[,-18]
ovm.synodontid.sr <- selfRecruitment(ovm.synodontid.conn.regions)
ovm.synodontid.lr <- localRetention(ovm.synodontid.conn.regions)
ovm.synodontid.rlr <- relativeLocalRetention(ovm.synodontid.conn.regions)
ovm.synodontid.ss <- settlementSuccess(ovm.synodontid.conn.regions)
ovm.synodontid.dk <- read_in_dispersal_kernel(path)
ovm.synodontid.dk.regions <- get_dispersal_distance_regions(ovm.synodontid.dk, reefs.id)
ovm.synodontid.reefs <- rename(ovm.synodontid.reefs, ovm.synodontid=count)
ovm.synodontid.regions <- rename(ovm.synodontid.regions, ovm.synodontid=count)
rm(ovm.synodontid.data.conn)

#ovm-impl1
ovm.stage.reefs <- rename(ovm.reefs, stage=ovm)
ovm.stage.regions <- rename(ovm.regions, stage=ovm)

#ovm-impl2
path <- "/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-daily"
ovm.daily.data.conn <- read_in_connectivity(path)
ovm.daily.reefs <- summarize(group_by(ovm.daily.data.conn, settle), count = n())
ovm.daily.regions <- get_regions(ovm.daily.reefs, reefs.id)
ovm.daily.conn.reefs <- get_connectivity_matrix_reefs(ovm.daily.data.conn)/eggs
ovm.daily.conn.regions <- get_connectivity_matrix_regions(ovm.daily.data.conn, reefs.id)/eggs
ovm.daily.conn.regions <- ovm.daily.conn.regions[,-18]
ovm.daily.sr <- selfRecruitment(ovm.daily.conn.regions)
ovm.daily.lr <- localRetention(ovm.daily.conn.regions)
ovm.daily.rlr <- relativeLocalRetention(ovm.daily.conn.regions)
ovm.daily.ss <- settlementSuccess(ovm.daily.conn.regions)
ovm.daily.dk <- read_in_dispersal_kernel(path)
ovm.daily.dk.regions <- get_dispersal_distance_regions(ovm.daily.dk, reefs.id)
ovm.daily.reefs <- rename(ovm.daily.reefs, ovm.daily=count)
ovm.daily.regions <- rename(ovm.daily.regions, ovm.daily=count)
rm(ovm.daily.data.conn)

#ovm-impl3
path <- "/Users/Steven/Documents/Thesis/chapters/theoretical/data/model-output/ovm-timestep"
ovm.timestep.data.conn <- read_in_connectivity(path)
ovm.timestep.reefs <- summarize(group_by(ovm.timestep.data.conn, settle), count = n())
ovm.timestep.regions <- get_regions(ovm.timestep.reefs, reefs.id)
ovm.timestep.conn.reefs <- get_connectivity_matrix_reefs(ovm.timestep.data.conn)/eggs
ovm.timestep.conn.regions <- get_connectivity_matrix_regions(ovm.timestep.data.conn, reefs.id)/eggs
ovm.timestep.conn.regions <- ovm.timestep.conn.regions[,-18]
ovm.timestep.sr <- selfRecruitment(ovm.timestep.conn.regions)
ovm.timestep.lr <- localRetention(ovm.timestep.conn.regions)
ovm.timestep.rlr <- relativeLocalRetention(ovm.timestep.conn.regions)
ovm.timestep.ss <- settlementSuccess(ovm.timestep.conn.regions)
ovm.timestep.dk <- read_in_dispersal_kernel(path)
ovm.timestep.dk.regions <- get_dispersal_distance_regions(ovm.timestep.dk, reefs.id)
ovm.timestep.reefs <- rename(ovm.timestep.reefs, ovm.timestep=count)
ovm.timestep.regions <- rename(ovm.timestep.regions, ovm.timestep=count)
rm(ovm.timestep.data.conn)







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
ggplot(data=phase1.summary, aes(y=sr.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=sr.mean-sr.sd,ymax=sr.mean+sr.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase1-sr.png")
phase1.glm.sr <- glm(sr ~ model, family = binomial(link="logit"), phase1.sr)

names <- c("passive","diel","ovm","orientate","diel-ovm","diel-ovm-orientate","ovm-orientate","diel-orientate")
phase1.ss <- as.tibble(t(rbind(passive.ss, diel.ss, ovm.ss, orientate.ss,diel.ovm.ss, diel.ovm.orientate.ss, ovm.orientate.ss, diel.orientate.ss)))
colnames(phase1.ss) <- names
phase1.ss <- gather(phase1.ss)
colnames(phase1.ss) <- c("model","ss")
phase1.ss$model <- as.factor(phase1.ss$model)
phase1.summary <- summarise(group_by(phase1.ss,model), ss.mean=mean(ss), ss.sd=sd(ss), ss.se = ss.sd/n())
ggplot(data=phase1.summary, aes(y=ss.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=ss.mean-ss.sd,ymax=ss.mean+ss.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase1-ss.png")
phase1.glm.ss <- glm(ss ~ model, family = binomial(link="logit"), phase1.ss)

phase1.lr <- as.tibble(t(rbind(passive.lr, diel.lr, ovm.lr, orientate.lr,diel.ovm.lr, diel.ovm.orientate.lr, ovm.orientate.lr, diel.orientate.lr)))
colnames(phase1.lr) <- names
phase1.lr <- gather(phase1.lr)
colnames(phase1.lr) <- c("model","lr")
phase1.lr$model <- as.factor(phase1.lr$model)
phase1.summary <- summarise(group_by(phase1.lr,model), lr.mean=mean(lr), lr.sd=sd(lr), lr.se = lr.sd/n())
ggplot(data=phase1.summary, aes(y=lr.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=lr.mean-lr.sd,ymax=lr.mean+lr.sd),width=.1)+coord_flip() +scale_y_continuous(limits = c(0, 1))
summary(phase1.lr.glm <- glm(lr ~ model, family=binomial(link="logit"), phase1.lr))
ggsave("../../figs/phase1-lr.png")
#plot(phase1.lr.glm)

phase1.rlr <- as.tibble(t(rbind(passive.rlr, diel.rlr, ovm.rlr, orientate.rlr,diel.ovm.rlr, diel.ovm.orientate.rlr, ovm.orientate.rlr, diel.orientate.rlr)))
colnames(phase1.rlr) <- names
phase1.rlr <- gather(phase1.rlr)
colnames(phase1.rlr) <- c("model","rlr")
phase1.rlr$model <- as.factor(phase1.rlr$model)
phase1.summary <- summarise(group_by(phase1.rlr,model), rlr.mean=mean(rlr), rlr.sd=sd(rlr), rlr.se = rlr.sd/n())
ggplot(data=phase1.summary, aes(y=rlr.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=rlr.mean-rlr.sd,ymax=rlr.mean+rlr.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase1-rlr.png")
summary(phase1.glm.rlr <- glm(rlr ~ model, family = binomial, phase1.rlr))


phase1.dk <- as.tibble(cbind(passive.dk$distance.km, diel.dk$distance.km, ovm.dk$distance.km, orientate.dk$distance.km,diel.ovm.dk$distance.km, 
                   diel.ovm.orientate.dk$distance.km, ovm.orientate.dk$distance.km, diel.orientate.dk$distance.km))
colnames(phase1.dk) <- names
phase1.dk <- gather(phase1.dk)
colnames(phase1.dk) <- c("model","dk")
phase1.dk$model <- as.factor(phase1.dk$model)
phase1.summary <- summarise(group_by(phase1.dk,model), dk.mean=mean(dk), dk.sd=sd(dk), dk.se = dk.sd/n())
ggplot(data=phase1.summary, aes(y=dk.mean, x=model)) + geom_bar(stat = "identity") + geom_linerange(aes(ymin=dk.mean,ymax=dk.mean+dk.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 500))
ggsave("../../figs/phase1-dispersal.png")
#ggplot(data=phase1.dk, aes(y=dk, x=model)) +stat_summary_bin(fun.y="mean", geom="bar") + stat_summary(fun.data = "mean_cl_boot", geom = "linerange")


names <- c("labridae","mullidae","pomacentridae","scaridae","scorpaenidae","serranidae","synodontidae")
phase2.sr <- as.tibble(t(rbind(ovm.labrid.sr,ovm.mullid.sr,ovm.sr,ovm.scarid.sr,ovm.scorpaenid.sr,ovm.serranid.sr,ovm.synodontid.sr)))
colnames(phase2.sr) <- names
phase2.sr <- gather(phase2.sr)
colnames(phase2.sr) <- c("model","sr")
phase2.sr$model <- as.factor(phase2.sr$model)
phase2.summary <- summarise(group_by(phase2.sr,model), sr.mean=mean(sr), sr.sd=sd(sr), sr.se = sr.sd/n())
ggplot(data=phase2.summary, aes(y=sr.mean, x=model)) + geom_bar(stat = "identity") + geom_errorbar(aes(ymin=sr.mean-sr.sd,ymax=sr.mean+sr.sd),width=.1) + coord_flip() +scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase2-sr.png")
summary(phase2.glm.sr <- glm(sr ~ model, family = binomial(link="logit"), phase2.sr))

names <- c("labridae","mullidae","pomacentridae","scaridae","scorpaenidae","serranidae","synodontidae")
phase2.ss <- as.tibble(t(rbind(ovm.labrid.ss,ovm.mullid.ss,ovm.ss,ovm.scarid.ss,ovm.scorpaenid.ss,ovm.serranid.ss,ovm.synodontid.ss)))
colnames(phase2.ss) <- names
phase2.ss <- gather(phase2.ss)
colnames(phase2.ss) <- c("model","ss")
phase2.ss$model <- as.factor(phase2.ss$model)
phase2.summary <- summarise(group_by(phase2.ss,model), ss.mean=mean(ss), ss.sd=sd(ss), ss.se = ss.sd/n())
ggplot(data=phase2.summary, aes(y=ss.mean, x=model)) + geom_bar(stat = "identity") + geom_errorbar(aes(ymin=ss.mean-ss.sd,ymax=ss.mean+ss.sd),width=.1) + coord_flip() +scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase2-ss.png")
summary(phase2.glm.ss <- glm(ss ~ model, family = binomial(link="logit"), phase2.ss))


phase2.lr <- as.tibble(t(rbind(ovm.labrid.lr,ovm.mullid.lr,ovm.lr,ovm.scarid.lr,ovm.scorpaenid.lr,ovm.serranid.lr,ovm.synodontid.lr)))
colnames(phase2.lr) <- names
phase2.lr <- gather(phase2.lr)
colnames(phase2.lr) <- c("model","lr")
phase2.lr$model <- as.factor(phase2.lr$model)
phase2.summary <- summarise(group_by(phase2.lr,model), lr.mean=mean(lr), lr.sd=sd(lr), lr.se = lr.sd/n())
ggplot(data=phase2.summary, aes(y=lr.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=lr.mean-lr.se,ymax=lr.mean+lr.se),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase2-lr.png")
summary(phase2.lr.glm <- glm(lr ~ model, family=binomial(link="logit"), phase2.lr))
plot(phase2.lr.glm)

phase2.rlr <- as.tibble(t(rbind(ovm.labrid.rlr,ovm.mullid.rlr,ovm.rlr,ovm.scarid.rlr,ovm.scorpaenid.rlr,ovm.serranid.rlr,ovm.synodontid.rlr)))
colnames(phase2.rlr) <- names
phase2.rlr <- gather(phase2.rlr)
colnames(phase2.rlr) <- c("model","rlr")
phase2.rlr$model <- as.factor(phase2.rlr$model)
phase2.summary <- summarise(group_by(phase2.rlr,model), rlr.mean=mean(rlr), rlr.sd=sd(rlr), rlr.se = rlr.sd/n())
ggplot(data=phase2.summary, aes(y=rlr.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=rlr.mean-rlr.sd,ymax=rlr.mean+rlr.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase2-rlr.png")
summary(phase2.glm.rlr <- glm(rlr ~ model, family = binomial, phase2.rlr))


phase2.dk <- as.tibble(cbind(ovm.labrid.dk$distance.km,ovm.mullid.dk$distance.km,ovm.dk$distance.km,ovm.scarid.dk$distance.km,ovm.scorpaenid.dk$distance.km,ovm.serranid.dk$distance.km,ovm.synodontid.dk$distance.km))
colnames(phase2.dk) <- names
phase2.dk <- gather(phase2.dk)
colnames(phase2.dk) <- c("model","dk")
phase2.dk$model <- as.factor(phase2.dk$model)
phase2.summary <- summarise(group_by(phase2.dk,model), dk.mean=mean(dk), dk.sd=sd(dk), dk.se = dk.sd/n())
ggplot(data=phase2.summary, aes(y=dk.mean, x=model)) + geom_bar(stat = "identity") + geom_linerange(aes(ymin=dk.mean,ymax=dk.mean+dk.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 500))
ggsave("../../figs/phase2-dispersal.png")
#ggplot(d

names <- c("stage","daily","timestep")
phase3.sr <- as.tibble(t(rbind(ovm.sr,ovm.daily.sr,ovm.timestep.sr)))
colnames(phase3.sr) <- names
phase3.sr <- gather(phase3.sr)
colnames(phase3.sr) <- c("model","sr")
phase3.sr$model <- as.factor(phase3.sr$model)
phase3.summary <- summarise(group_by(phase3.sr,model), sr.mean=mean(sr), sr.sd=sd(sr), sr.se = sr.sd/n())
ggplot(data=phase3.summary, aes(y=sr.mean, x=model)) + geom_bar(stat = "identity") + geom_errorbar(aes(ymin=sr.mean-sr.sd,ymax=sr.mean+sr.sd),width=.1) + coord_flip() +scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase3-sr.png")
summary(phase3.glm.sr <- glm(sr ~ model, family = binomial(link="logit"), phase3.sr))

names <- c("stage","daily","timestep")
phase3.ss <- as.tibble(t(rbind(ovm.ss,ovm.daily.ss,ovm.timestep.ss)))
colnames(phase3.ss) <- names
phase3.ss <- gather(phase3.ss)
colnames(phase3.ss) <- c("model","ss")
phase3.ss$model <- as.factor(phase3.ss$model)
phase3.summary <- summarise(group_by(phase3.ss,model), ss.mean=mean(ss), ss.sd=sd(ss), ss.se = ss.sd/n())
ggplot(data=phase3.summary, aes(y=ss.mean, x=model)) + geom_bar(stat = "identity") + geom_errorbar(aes(ymin=ss.mean-ss.sd,ymax=ss.mean+ss.sd),width=.1) + coord_flip() +scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase3-ss.png")
summary(phase3.glm.ss <- glm(ss ~ model, family = binomial(link="logit"), phase3.ss))


phase3.lr <- as.tibble(t(rbind(ovm.lr,ovm.daily.lr,ovm.timestep.lr)))
colnames(phase3.lr) <- names
phase3.lr <- gather(phase3.lr)
colnames(phase3.lr) <- c("model","lr")
phase3.lr$model <- as.factor(phase3.lr$model)
phase3.summary <- summarise(group_by(phase3.lr,model), lr.mean=mean(lr), lr.sd=sd(lr), lr.se = lr.sd/n())
ggplot(data=phase3.summary, aes(y=lr.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=lr.mean-lr.sd,ymax=lr.mean+lr.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase3-lr.png")
summary(phase3.lr.glm <- glm(lr ~ model, family=binomial(link="logit"), phase3.lr))
#plot(phase3.lr.glm)

phase3.rlr <- as.tibble(t(rbind(ovm.rlr,ovm.daily.rlr,ovm.timestep.rlr)))
colnames(phase3.rlr) <- names
phase3.rlr <- gather(phase3.rlr)
colnames(phase3.rlr) <- c("model","rlr")
phase3.rlr$model <- as.factor(phase3.rlr$model)
phase3.summary <- summarise(group_by(phase3.rlr,model), rlr.mean=mean(rlr), rlr.sd=sd(rlr), rlr.se = rlr.sd/n())
ggplot(data=phase3.summary, aes(y=rlr.mean, x=model)) + geom_bar(stat="identity") + geom_errorbar(aes(ymin=rlr.mean-rlr.sd,ymax=rlr.mean+rlr.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 1))
ggsave("../../figs/phase3-rlr.png")
summary(phase3.glm.rlr <- glm(rlr ~ model, family = binomial, phase3.rlr))


phase3.dk <- as.tibble(cbind(ovm.dk$distance.km,ovm.daily.dk$distance.km,ovm.timestep.dk$distance.km))
colnames(phase3.dk) <- names
phase3.dk <- gather(phase3.dk)
colnames(phase3.dk) <- c("model","dk")
phase3.dk$model <- as.factor(phase3.dk$model)
phase3.summary <- summarise(group_by(phase3.dk,model), dk.mean=mean(dk), dk.sd=sd(dk), dk.se = dk.sd/n())
ggplot(data=phase3.summary, aes(y=dk.mean, x=model)) + geom_bar(stat = "identity") + geom_linerange(aes(ymin=dk.mean,ymax=dk.mean+dk.sd),width=.1) + coord_flip()+scale_y_continuous(limits = c(0, 500))
ggsave("../../figs/phase3-dispersal.png")
#ggplot(d


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

jpeg('../../figs/regions-nmds.jpg')
regions.nmds <- metaMDS(regions.community_matrix,distance="bray", k=2)
plot(regions.nmds, display="sites")
ordiellipse(regions.nmds, group=phases$phase, col=2:4, kind = "ehull", lwd=2, label=TRUE)
dev.off()
# PCA
jpeg('../../figs/regions-phase1-pca.jpg')
phase1.regions.rda <- rda(phase1.regions.community_matrix, scale = TRUE)
biplot(phase1.regions.rda, display=c("sites","species"), type=c("points","text"), scaling = 3)
orditorp(phase1.regions.rda, display="species")
ordilabel(phase1.regions.rda, scaling = 3)
dev.off()

jpeg('../../figs/regions-phase2-pca.jpg')
phase2.regions.rda <- rda(phase2.regions.community_matrix, scale = TRUE)
biplot(phase2.regions.rda, display=c("sites","species"), type=c("points","text"), scaling = 3)
orditorp(phase2.regions.rda, display="species")
ordilabel(phase2.regions.rda, scaling = 3, col="blue",font=1)
dev.off()

jpeg('../../figs/regions-phase3-pca.jpg')
phase3.regions.rda <- rda(phase3.regions.community_matrix, scale = TRUE)
priSpp <- diversity(phase3.regions.community_matrix, index = "invsimpson", MARGIN = 2)
priSite <- diversity(phase3.regions.community_matrix, index = "invsimpson", MARGIN = 1)
#biplot(phase3.regions.rda, display=c("sites","species"), scaling = 3)
plot(phase3.regions.rda, type = "n", scaling = 3)
ordilabel(phase3.regions.rda, display = "sites",priority = priSite, font = 3, fill = "hotpink",
          col = "blue", scaling = 3)
ordilabel(phase3.regions.rda, display = "species",priority = priSpp, font = 2 ,
          scaling = 3)
dev.off()
#orditorp(phase3.regions.rda, display="species")

phase2.regions.rda <- rda(phase2.regions.community_matrix, scale = TRUE)
priSpp <- diversity(phase2.regions.community_matrix, index = "invsimpson", MARGIN = 2)
priSite <- diversity(phase2.regions.community_matrix, index = "invsimpson", MARGIN = 1)
#biplot(phase2.regions.rda, display=c("sites","species"), scaling = 3)
plot(phase2.regions.rda, type = "n", scaling = 3)
ordilabel(phase2.regions.rda, display = "sites",priority = priSite, font = 3, fill = "hotpink",
          col = "blue", scaling = 3)
ordilabel(phase2.regions.rda, display = "species",priority = priSpp, font = 2 ,
          scaling = 3)





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
