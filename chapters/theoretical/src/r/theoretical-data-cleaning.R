library(tidyverse)
source("theoretical-functions.R")

prefix_old <- "/Users/steve/Documents/PhD/Thesis"
prefix <- "/Users/Steven/Documents/Thesis"

reefs.id <- read_csv("../../data/reefs.csv")
save(reefs.id,file="reefs.rda")

passive.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/passive"))
passive.reefs <- summarize(group_by(passive.data.conn, settle), count = n())
passive.regions <- get_regions(passive.reefs, reefs.id)
passive.reefs <- rename(passive.reefs, passive=count)
passive.regions <- rename(passive.regions, passive=count)
passive.conn.reefs <- get_connectivity_matrix_reefs(passive.data.conn)
passive.conn.regions <- get_connectivity_matrix_regions(passive.data.conn, reefs.id)
passive.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/passive"))
passive.dk.regions <- get_dispersal_distance_regions(passive.data.dk, reefs.id)
rm(passive.data.conn)
rm(passive.data.dk)

passive.surface.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/passive-surface"))
passive.surface.reefs <- summarize(group_by(passive.surface.data.conn, settle), count = n())
passive.surface.regions <- get_regions(passive.surface.reefs, reefs.id)
passive.surface.reefs <- rename(passive.surface.reefs, passive.surface=count)
passive.surface.regions <- rename(passive.surface.regions, passive.surface=count)
passive.surface.conn.reefs <- get_connectivity_matrix_reefs(passive.surface.data.conn)
passive.surface.conn.regions <- get_connectivity_matrix_regions(passive.surface.data.conn, reefs.id)
passive.surface.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/passive-surface"))
passive.surface.dk.regions <- get_dispersal_distance_regions(passive.surface.data.dk, reefs.id)
rm(passive.surface.data.conn)
rm(passive.surface.data.dk)

diel.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel"))
diel.reefs <- summarize(group_by(diel.data.conn, settle), count = n())
diel.regions <- get_regions(diel.reefs, reefs.id)
diel.reefs <- rename(diel.reefs, diel=count)
diel.regions <- rename(diel.regions, diel=count)
diel.conn.reefs <- get_connectivity_matrix_reefs(diel.data.conn)
diel.conn.regions <- get_connectivity_matrix_regions(diel.data.conn, reefs.id)
diel.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/diel"))
diel.dk.regions <- get_dispersal_distance_regions(diel.data.dk, reefs.id)
rm(diel.data.conn)
rm(diel.data.dk)

ovm.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm"))
ovm.reefs <- summarize(group_by(ovm.data.conn, settle), count = n())
ovm.regions <- get_regions(ovm.reefs, reefs.id)
ovm.conn.reefs <- get_connectivity_matrix_reefs(ovm.data.conn)
ovm.conn.regions <- get_connectivity_matrix_regions(ovm.data.conn, reefs.id)
ovm.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm"))
ovm.dk.regions <- get_dispersal_distance_regions(ovm.data.dk, reefs.id)
ovm.reefs <- rename(ovm.reefs, ovm=count)
ovm.regions <- rename(ovm.regions, ovm=count)
rm(ovm.data.conn)
rm(ovm.data.dk)

orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/orientate"))
orientate.reefs <- summarize(group_by(orientate.data.conn, settle), count = n())
orientate.regions <- get_regions(orientate.reefs, reefs.id)
orientate.reefs <- rename(orientate.reefs, orientate=count)
orientate.regions <- rename(orientate.regions, orientate=count)
orientate.conn.reefs <- get_connectivity_matrix_reefs(orientate.data.conn)
orientate.conn.regions <- get_connectivity_matrix_regions(orientate.data.conn, reefs.id)
orientate.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/orientate"))
orientate.dk.regions <- get_dispersal_distance_regions(orientate.data.dk, reefs.id)
rm(orientate.data.conn)
rm(orientate.data.dk)

orientate.surface.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/orientate-surface"))
orientate.surface.reefs <- summarize(group_by(orientate.surface.data.conn, settle), count = n())
orientate.surface.regions <- get_regions(orientate.surface.reefs, reefs.id)
orientate.surface.reefs <- rename(orientate.surface.reefs, orientate.surface=count)
orientate.surface.regions <- rename(orientate.surface.regions, orientate.surface=count)
orientate.surface.conn.reefs <- get_connectivity_matrix_reefs(orientate.surface.data.conn)
orientate.surface.conn.regions <- get_connectivity_matrix_regions(orientate.surface.data.conn, reefs.id)
orientate.surface.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/orientate-surface"))
orientate.surface.dk.regions <- get_dispersal_distance_regions(orientate.surface.data.dk, reefs.id)
rm(orientate.surface.data.conn)
rm(orientate.surface.data.dk)

ovm.orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-orientate"))
ovm.orientate.reefs <- summarize(group_by(ovm.orientate.data.conn, settle), count = n())
ovm.orientate.regions <- get_regions(ovm.orientate.reefs, reefs.id)
ovm.orientate.reefs <- rename(ovm.orientate.reefs, ovm.orientate=count)
ovm.orientate.regions <- rename(ovm.orientate.regions, ovm.orientate=count)
ovm.orientate.conn.reefs <- get_connectivity_matrix_reefs(ovm.orientate.data.conn)
ovm.orientate.conn.regions <- get_connectivity_matrix_regions(ovm.orientate.data.conn, reefs.id)
ovm.orientate.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-orientate"))
ovm.orientate.dk.regions <- get_dispersal_distance_regions(ovm.orientate.data.dk, reefs.id)
rm(ovm.orientate.data.conn)
rm(ovm.orientate.data.dk)

diel.orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel-orientate"))
diel.orientate.reefs <- summarize(group_by(diel.orientate.data.conn, settle), count = n())
diel.orientate.regions <- get_regions(diel.orientate.reefs, reefs.id)
diel.orientate.reefs <- rename(diel.orientate.reefs, diel.orientate=count)
diel.orientate.regions <- rename(diel.orientate.regions, diel.orientate=count)
diel.orientate.conn.reefs <- get_connectivity_matrix_reefs(diel.orientate.data.conn)
diel.orientate.conn.regions <- get_connectivity_matrix_regions(diel.orientate.data.conn, reefs.id)
diel.orientate.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/diel-orientate"))
diel.orientate.dk.regions <- get_dispersal_distance_regions(diel.orientate.data.dk, reefs.id)
rm(diel.orientate.data.conn)
rm(diel.orientate.data.dk)

diel.ovm.orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel-ovm-orientate"))
diel.ovm.orientate.reefs <- summarize(group_by(diel.ovm.orientate.data.conn, settle), count = n())
diel.ovm.orientate.regions <- get_regions(diel.ovm.orientate.reefs, reefs.id)
diel.ovm.orientate.reefs <- rename(diel.ovm.orientate.reefs, diel.ovm.orientate=count)
diel.ovm.orientate.regions <- rename(diel.ovm.orientate.regions, diel.ovm.orientate=count)
diel.ovm.orientate.conn.reefs <- get_connectivity_matrix_reefs(diel.ovm.orientate.data.conn)
diel.ovm.orientate.conn.regions <- get_connectivity_matrix_regions(diel.ovm.orientate.data.conn, reefs.id)
diel.ovm.orientate.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/diel-ovm-orientate"))
diel.ovm.orientate.dk.regions <- get_dispersal_distance_regions(diel.ovm.orientate.data.dk, reefs.id)
rm(diel.ovm.orientate.data.conn)
rm(diel.ovm.orientate.data.dk)

diel.ovm.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel-ovm"))
diel.ovm.reefs <- summarize(group_by(diel.ovm.data.conn, settle), count = n())
diel.ovm.regions <- get_regions(diel.ovm.reefs, reefs.id)
diel.ovm.reefs <- rename(diel.ovm.reefs, diel.ovm=count)
diel.ovm.regions <- rename(diel.ovm.regions, diel.ovm=count)
diel.ovm.conn.reefs <- get_connectivity_matrix_reefs(diel.ovm.data.conn)
diel.ovm.conn.regions <- get_connectivity_matrix_regions(diel.ovm.data.conn, reefs.id)
diel.ovm.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/diel-ovm"))
diel.ovm.dk.regions <- get_dispersal_distance_regions(diel.ovm.data.dk, reefs.id)
rm(diel.ovm.data.conn)
rm(diel.ovm.data.dk)

save(passive.reefs,passive.regions, passive.conn.reefs, passive.conn.regions,passive.dk.regions,
     passive.surface.reefs,passive.surface.regions, passive.surface.conn.reefs, passive.surface.conn.regions,passive.surface.dk.regions,
     ovm.reefs,ovm.regions, ovm.conn.reefs, ovm.conn.regions,ovm.dk.regions,
     diel.reefs,diel.regions, diel.conn.reefs, diel.conn.regions,diel.dk.regions,
     orientate.reefs,orientate.regions, orientate.conn.reefs, orientate.conn.regions,orientate.dk.regions,
     orientate.surface.reefs,orientate.surface.regions, orientate.surface.conn.reefs, orientate.surface.conn.regions,orientate.surface.dk.regions,
     ovm.orientate.reefs,ovm.orientate.regions, ovm.orientate.conn.reefs, ovm.orientate.conn.regions,ovm.orientate.dk.regions,
     diel.ovm.orientate.reefs,diel.ovm.orientate.regions, diel.ovm.orientate.conn.reefs, diel.ovm.orientate.conn.regions,diel.ovm.orientate.dk.regions,
     diel.ovm.reefs,diel.ovm.regions, diel.ovm.conn.reefs, diel.ovm.conn.regions,diel.ovm.dk.regions,
     diel.orientate.reefs,diel.orientate.regions, diel.orientate.conn.reefs, diel.orientate.conn.regions,diel.orientate.dk.regions,
     file="phase1.rda")

###
# Phase 2 data cleaning
#

ovm.labrid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-labrid"))
ovm.labrid.reefs <- summarize(group_by(ovm.labrid.data.conn, settle), count = n())
ovm.labrid.regions <- get_regions(ovm.labrid.reefs, reefs.id)
ovm.labrid.reefs <- rename(ovm.labrid.reefs, labridae=count)
ovm.labrid.regions <- rename(ovm.labrid.regions, labridae=count)
ovm.labrid.conn.reefs <- get_connectivity_matrix_reefs(ovm.labrid.data.conn)
ovm.labrid.conn.regions <- get_connectivity_matrix_regions(ovm.labrid.data.conn, reefs.id)
ovm.labrid.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-labrid"))
ovm.labrid.dk.regions <- get_dispersal_distance_regions(ovm.labrid.data.dk, reefs.id)
rm(ovm.labrid.data.conn)
rm(ovm.labrid.data.dk)

ovm.mullid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-mullid"))
ovm.mullid.reefs <- summarize(group_by(ovm.mullid.data.conn, settle), count = n())
ovm.mullid.regions <- get_regions(ovm.mullid.reefs, reefs.id)
ovm.mullid.reefs <- rename(ovm.mullid.reefs, mullidae=count)
ovm.mullid.regions <- rename(ovm.mullid.regions, mullidae=count)
ovm.mullid.conn.reefs <- get_connectivity_matrix_reefs(ovm.mullid.data.conn)
ovm.mullid.conn.regions <- get_connectivity_matrix_regions(ovm.mullid.data.conn, reefs.id)
ovm.mullid.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-mullid"))
ovm.mullid.dk.regions <- get_dispersal_distance_regions(ovm.mullid.data.dk, reefs.id)
rm(ovm.mullid.data.conn)
rm(ovm.mullid.data.dk)

#ovm-pomacentrid
ovm.pomacentrid.reefs <- rename(ovm.reefs, pomacentridae=ovm)
ovm.pomacentrid.regions <- rename(ovm.regions, pomacentridae=ovm)

ovm.scarid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-scarid"))
ovm.scarid.reefs <- summarize(group_by(ovm.scarid.data.conn, settle), count = n())
ovm.scarid.regions <- get_regions(ovm.scarid.reefs, reefs.id)
ovm.scarid.reefs <- rename(ovm.scarid.reefs, scaridae=count)
ovm.scarid.regions <- rename(ovm.scarid.regions, scaridae=count)
ovm.scarid.conn.reefs <- get_connectivity_matrix_reefs(ovm.scarid.data.conn)
ovm.scarid.conn.regions <- get_connectivity_matrix_regions(ovm.scarid.data.conn, reefs.id)
ovm.scarid.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-scarid"))
ovm.scarid.dk.regions <- get_dispersal_distance_regions(ovm.scarid.data.dk, reefs.id)
rm(ovm.scarid.data.conn)
rm(ovm.scarid.data.dk)

ovm.scorpaenid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-scorp"))
ovm.scorpaenid.reefs <- summarize(group_by(ovm.scorpaenid.data.conn, settle), count = n())
ovm.scorpaenid.regions <- get_regions(ovm.scorpaenid.reefs, reefs.id)
ovm.scorpaenid.reefs <- rename(ovm.scorpaenid.reefs, scorpaenidae=count)
ovm.scorpaenid.regions <- rename(ovm.scorpaenid.regions, scorpaenidae=count)
ovm.scorpaenid.conn.reefs <- get_connectivity_matrix_reefs(ovm.scorpaenid.data.conn)
ovm.scorpaenid.conn.regions <- get_connectivity_matrix_regions(ovm.scorpaenid.data.conn, reefs.id)
ovm.scorpaenid.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-scorp"))
ovm.scorpaenid.dk.regions <- get_dispersal_distance_regions(ovm.scorpaenid.data.dk, reefs.id)
rm(ovm.scorpaenid.data.conn)
rm(ovm.scorpaenid.data.dk)

ovm.serranid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-serranid"))
ovm.serranid.reefs <- summarize(group_by(ovm.serranid.data.conn, settle), count = n())
ovm.serranid.regions <- get_regions(ovm.serranid.reefs, reefs.id)
ovm.serranid.reefs <- rename(ovm.serranid.reefs, serranidae=count)
ovm.serranid.regions <- rename(ovm.serranid.regions, serranidae=count)
ovm.serranid.conn.reefs <- get_connectivity_matrix_reefs(ovm.serranid.data.conn)
ovm.serranid.conn.regions <- get_connectivity_matrix_regions(ovm.serranid.data.conn, reefs.id)
ovm.serranid.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-serranid"))
ovm.serranid.dk.regions <- get_dispersal_distance_regions(ovm.serranid.data.dk, reefs.id)
rm(ovm.serranid.data.conn)
rm(ovm.serranid.data.dk)

ovm.synodontid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-synod"))
ovm.synodontid.reefs <- summarize(group_by(ovm.synodontid.data.conn, settle), count = n())
ovm.synodontid.regions <- get_regions(ovm.synodontid.reefs, reefs.id)
ovm.synodontid.reefs <- rename(ovm.synodontid.reefs, synodontidae=count)
ovm.synodontid.regions <- rename(ovm.synodontid.regions, synodontidae=count)
ovm.synodontid.conn.reefs <- get_connectivity_matrix_reefs(ovm.synodontid.data.conn)
ovm.synodontid.conn.regions <- get_connectivity_matrix_regions(ovm.synodontid.data.conn, reefs.id)
ovm.synodontid.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-synod"))
ovm.synodontid.dk.regions <- get_dispersal_distance_regions(ovm.synodontid.data.dk, reefs.id)
rm(ovm.synodontid.data.conn)
rm(ovm.synodontid.data.dk)

save(ovm.labrid.reefs, ovm.labrid.regions, ovm.labrid.conn.reefs, ovm.labrid.conn.regions, ovm.labrid.dk.regions,
     ovm.mullid.reefs, ovm.mullid.regions, ovm.mullid.conn.reefs, ovm.mullid.conn.regions, ovm.mullid.dk.regions,
     ovm.pomacentrid.reefs, ovm.pomacentrid.regions,
     ovm.serranid.reefs, ovm.serranid.regions, ovm.serranid.conn.reefs, ovm.serranid.conn.regions, ovm.serranid.dk.regions,
     ovm.synodontid.reefs, ovm.synodontid.regions, ovm.synodontid.conn.reefs, ovm.synodontid.conn.regions, ovm.synodontid.dk.regions,
     ovm.scorpaenid.reefs, ovm.scorpaenid.regions, ovm.scorpaenid.conn.reefs, ovm.scorpaenid.conn.regions, ovm.scorpaenid.dk.regions,
     ovm.scarid.reefs, ovm.scarid.regions, ovm.scarid.conn.reefs, ovm.scarid.conn.regions, ovm.scarid.dk.regions,
     file="phase2.rda")


ovm.daily.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-daily"))
ovm.daily.reefs <- summarize(group_by(ovm.daily.data.conn, settle), count = n())
ovm.daily.regions <- get_regions(ovm.daily.reefs, reefs.id)
ovm.daily.conn.reefs <- get_connectivity_matrix_reefs(ovm.daily.data.conn)
ovm.daily.conn.regions <- get_connectivity_matrix_regions(ovm.daily.data.conn, reefs.id)
ovm.daily.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-daily"))
ovm.daily.dk.regions <- get_dispersal_distance_regions(ovm.daily.data.dk, reefs.id)
ovm.daily.reefs <- rename(ovm.daily.reefs, daily=count)
ovm.daily.regions <- rename(ovm.daily.regions, daily=count)
rm(ovm.daily.data.conn)
rm(ovm.daily.data.dk)

ovm.timestep.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-timestep"))
ovm.timestep.reefs <- summarize(group_by(ovm.timestep.data.conn, settle), count = n())
ovm.timestep.regions <- get_regions(ovm.timestep.reefs, reefs.id)
ovm.timestep.conn.reefs <- get_connectivity_matrix_reefs(ovm.timestep.data.conn)
ovm.timestep.conn.regions <- get_connectivity_matrix_regions(ovm.timestep.data.conn, reefs.id)
ovm.timestep.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-timestep"))
ovm.timestep.dk.regions <- get_dispersal_distance_regions(ovm.timestep.data.dk, reefs.id)
ovm.timestep.reefs <- rename(ovm.timestep.reefs, timestep=count)
ovm.timestep.regions <- rename(ovm.timestep.regions, timestep=count)
rm(ovm.timestep.data.conn)
rm(ovm.timestep.data.dk)

#ovm-impl1
ovm.stage.reefs <- rename(ovm.reefs, stage=ovm)
ovm.stage.regions <- rename(ovm.regions, stage=ovm)


save(ovm.timestep.reefs, ovm.timestep.regions, ovm.timestep.conn.reefs, ovm.timestep.conn.regions, ovm.timestep.dk.regions,
     ovm.daily.reefs,ovm.daily.regions, ovm.daily.conn.reefs, ovm.daily.conn.regions, ovm.daily.dk.regions,
     ovm.stage.reefs, ovm.stage.regions,
     file="phase3.rda")

phase1.reefs.data <- passive.reefs %>% full_join(passive.surface.reefs) %>% full_join(diel.reefs) %>% full_join(ovm.reefs) %>% full_join(orientate.reefs) %>% 
  full_join(orientate.surface.reefs) %>% full_join(diel.ovm.orientate.reefs) %>% full_join(ovm.orientate.reefs) %>% full_join(diel.ovm.reefs) %>% full_join(diel.orientate.reefs) 
phase1.regions.data <- passive.regions %>% full_join(passive.surface.regions) %>% full_join(diel.regions) %>% full_join(ovm.regions) %>% full_join(orientate.regions) %>% 
  full_join(orientate.surface.regions) %>% full_join(diel.ovm.orientate.regions) %>% full_join(ovm.orientate.regions) %>% full_join(diel.ovm.regions) %>% full_join(diel.orientate.regions)

phase2.reefs.data <- ovm.pomacentrid.reefs %>% full_join(ovm.labrid.reefs) %>% full_join(ovm.mullid.reefs) %>% full_join(ovm.scarid.reefs) %>% 
  full_join(ovm.scorpaenid.reefs) %>% full_join(ovm.serranid.reefs) %>% full_join(ovm.synodontid.reefs)
phase2.regions.data <- ovm.pomacentrid.regions %>% full_join(ovm.labrid.regions) %>% full_join(ovm.mullid.regions) %>% full_join(ovm.scarid.regions) %>% 
  full_join(ovm.scorpaenid.regions) %>% full_join(ovm.serranid.regions) %>% full_join(ovm.synodontid.regions)

phase3.reefs.data <- ovm.stage.reefs %>% full_join(ovm.timestep.reefs) %>% full_join(ovm.daily.reefs)
phase3.regions.data <- ovm.stage.regions %>% full_join(ovm.timestep.regions) %>% full_join(ovm.daily.regions)

reefs.data <- phase1.reefs.data %>% full_join(phase2.reefs.data) %>% full_join(phase3.reefs.data)
regions.data <- phase1.regions.data %>% full_join(phase2.regions.data) %>% full_join(phase3.regions.data)

save(phase1.reefs.data, phase1.regions.data, 
     phase2.reefs.data, phase2.regions.data, 
     phase3.reefs.data, phase3.regions.data,
     reefs.data, regions.data,
     file="nmds.rda")
