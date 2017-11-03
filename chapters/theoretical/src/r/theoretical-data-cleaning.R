source("theoretical-functions.R")

prefix <- "/Users/Steven/Documents/Thesis"
eggs <- 248000

reefs.id <- read_csv("../../data/reefs.csv")
save(reefs.id,file="reefs.rda")


passive.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/passive"))
passive.reefs <- summarize(group_by(passive.data.conn, settle), count = n())
passive.conn.reefs <- get_connectivity_matrix_reefs(passive.data.conn)/eggs
passive.conn.regions <- get_connectivity_matrix_regions(passive.data.conn, reefs.id)/eggs
passive.data.dk <- read_in_dispersal_kernel(path)
passive.dk.regions <- get_dispersal_distance_regions(passive.data.dk, reefs.id)
rm(passive.data.conn)
rm(passive.data.dk)

diel.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel"))
diel.reefs <- summarize(group_by(diel.data.conn, settle), count = n())
diel.conn.reefs <- get_connectivity_matrix_reefs(diel.data.conn)/eggs
diel.conn.regions <- get_connectivity_matrix_regions(diel.data.conn, reefs.id)/eggs
diel.data.dk <- read_in_dispersal_kernel(path)
diel.dk.regions <- get_dispersal_distance_regions(diel.data.dk, reefs.id)
rm(diel.data.conn)
rm(diel.data.dk)

ovm.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm"))
ovm.reefs <- summarize(group_by(ovm.data.conn, settle), count = n())
ovm.conn.reefs <- get_connectivity_matrix_reefs(ovm.data.conn)/eggs
ovm.conn.regions <- get_connectivity_matrix_regions(ovm.data.conn, reefs.id)/eggs
ovm.data.dk <- read_in_dispersal_kernel(path)
ovm.dk.regions <- get_dispersal_distance_regions(ovm.data.dk, reefs.id)
rm(ovm.data.conn)
rm(ovm.data.dk)

orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/orientate"))
orientate.reefs <- summarize(group_by(orientate.data.conn, settle), count = n())
orientate.conn.reefs <- get_connectivity_matrix_reefs(orientate.data.conn)/eggs
orientate.conn.regions <- get_connectivity_matrix_regions(orientate.data.conn, reefs.id)/eggs
orientate.data.dk <- read_in_dispersal_kernel(path)
orientate.dk.regions <- get_dispersal_distance_regions(orientate.data.dk, reefs.id)
rm(orientate.data.conn)
rm(orientate.data.dk)

ovm.orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-orientate"))
ovm.orientate.reefs <- summarize(group_by(ovm.orientate.data.conn, settle), count = n())
ovm.orientate.conn.reefs <- get_connectivity_matrix_reefs(ovm.orientate.data.conn)/eggs
ovm.orientate.conn.regions <- get_connectivity_matrix_regions(ovm.orientate.data.conn, reefs.id)/eggs
ovm.orientate.data.dk <- read_in_dispersal_kernel(path)
ovm.orientate.dk.regions <- get_dispersal_distance_regions(ovm.orientate.data.dk, reefs.id)
rm(ovm.orientate.data.conn)
rm(ovm.orientate.data.dk)

diel.orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel-orientate"))
diel.orientate.reefs <- summarize(group_by(diel.orientate.data.conn, settle), count = n())
diel.orientate.conn.reefs <- get_connectivity_matrix_reefs(diel.orientate.data.conn)/eggs
diel.orientate.conn.regions <- get_connectivity_matrix_regions(diel.orientate.data.conn, reefs.id)/eggs
diel.orientate.data.dk <- read_in_dispersal_kernel(path)
diel.orientate.dk.regions <- get_dispersal_distance_regions(diel.orientate.data.dk, reefs.id)
rm(diel.orientate.data.conn)
rm(diel.orientate.data.dk)

diel.ovm.orientate.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel-ovm-orientate"))
diel.ovm.orientate.reefs <- summarize(group_by(diel.ovm.orientate.data.conn, settle), count = n())
diel.ovm.orientate.conn.reefs <- get_connectivity_matrix_reefs(diel.ovm.orientate.data.conn)/eggs
diel.ovm.orientate.conn.regions <- get_connectivity_matrix_regions(diel.ovm.orientate.data.conn, reefs.id)/eggs
diel.ovm.orientate.data.dk <- read_in_dispersal_kernel(path)
diel.ovm.orientate.dk.regions <- get_dispersal_distance_regions(diel.ovm.orientate.data.dk, reefs.id)
rm(diel.ovm.orientate.data.conn)
rm(diel.ovm.orientate.data.dk)

diel.ovm.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/diel-ovm"))
diel.ovm.reefs <- summarize(group_by(diel.ovm.data.conn, settle), count = n())
diel.ovm.conn.reefs <- get_connectivity_matrix_reefs(diel.ovm.data.conn)/eggs
diel.ovm.conn.regions <- get_connectivity_matrix_regions(diel.ovm.data.conn, reefs.id)/eggs
diel.ovm.data.dk <- read_in_dispersal_kernel(path)
diel.ovm.dk.regions <- get_dispersal_distance_regions(diel.ovm.data.dk, reefs.id)
rm(diel.ovm.data.conn)
rm(diel.ovm.data.dk)

save(passive.reefs,passive.regions, passive.conn.regions,passive.dk.regions,
     ovm.reefs,ovm.regions, ovm.conn.regions,ovm.dk.regions,
     diel.reefs,diel.regions, diel.conn.regions,diel.dk.regions,
     orientate.reefs,orientate.regions, orientate.conn.regions,orientate.dk.regions,
     ovm.orientate.reefs,ovm.orientate.regions, ovm.orientate.conn.regions,ovm.orientate.dk.regions,
     diel.ovm.orientate.reefs,diel.ovm.orientate.regions, diel.ovm.orientate.conn.regions,diel.ovm.orientate.dk.regions,
     diel.ovm.reefs,diel.ovm.regions, diel.ovm.conn.regions,diel.ovm.dk.regions,
     diel.orientate.reefs,diel.orientate.regions, diel.orientate.conn.regions,diel.orientate.dk.regions,
     file="phase1.rda")

###
# Phase 2 data cleaning
#

ovm.labrid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-labrid"))
ovm.labrid.reefs <- summarize(group_by(ovm.labrid.data.conn, settle), count = n())
ovm.labrid.conn.reefs <- get_connectivity_matrix_reefs(ovm.labrid.data.conn)/eggs
ovm.labrid.conn.regions <- get_connectivity_matrix_regions(ovm.labrid.data.conn, reefs.id)/eggs
ovm.labrid.data.dk <- read_in_dispersal_kernel(path)
ovm.labrid.dk.regions <- get_dispersal_distance_regions(ovm.labrid.data.dk, reefs.id)
rm(ovm.labrid.data.conn)
rm(ovm.labrid.data.dk)

ovm.mullid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-mullid"))
ovm.mullid.reefs <- summarize(group_by(ovm.mullid.data.conn, settle), count = n())
ovm.mullid.conn.reefs <- get_connectivity_matrix_reefs(ovm.mullid.data.conn)/eggs
ovm.mullid.conn.regions <- get_connectivity_matrix_regions(ovm.mullid.data.conn, reefs.id)/eggs
ovm.mullid.data.dk <- read_in_dispersal_kernel(path)
ovm.mullid.dk.regions <- get_dispersal_distance_regions(ovm.mullid.data.dk, reefs.id)
rm(ovm.mullid.data.conn)
rm(ovm.mullid.data.dk)

ovm.scarid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-scarid"))
ovm.scarid.reefs <- summarize(group_by(ovm.scarid.data.conn, settle), count = n())
ovm.scarid.conn.reefs <- get_connectivity_matrix_reefs(ovm.scarid.data.conn)/eggs
ovm.scarid.conn.regions <- get_connectivity_matrix_regions(ovm.scarid.data.conn, reefs.id)/eggs
ovm.scarid.data.dk <- read_in_dispersal_kernel(path)
ovm.scarid.dk.regions <- get_dispersal_distance_regions(ovm.scarid.data.dk, reefs.id)
rm(ovm.scarid.data.conn)
rm(ovm.scarid.data.dk)

ovm.scorpaenid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-scorp"))
ovm.scorpaenid.reefs <- summarize(group_by(ovm.scorpaenid.data.conn, settle), count = n())
ovm.scorpaenid.conn.reefs <- get_connectivity_matrix_reefs(ovm.scorpaenid.data.conn)/eggs
ovm.scorpaenid.conn.regions <- get_connectivity_matrix_regions(ovm.scorpaenid.data.conn, reefs.id)/eggs
ovm.scorpaenid.data.dk <- read_in_dispersal_kernel(path)
ovm.scorpaenid.dk.regions <- get_dispersal_distance_regions(ovm.scorpaenid.data.dk, reefs.id)
rm(ovm.scorpaenid.data.conn)
rm(ovm.scorpaenid.data.dk)

ovm.serranid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-serranid"))
ovm.serranid.reefs <- summarize(group_by(ovm.serranid.data.conn, settle), count = n())
ovm.serranid.conn.reefs <- get_connectivity_matrix_reefs(ovm.serranid.data.conn)/eggs
ovm.serranid.conn.regions <- get_connectivity_matrix_regions(ovm.serranid.data.conn, reefs.id)/eggs
ovm.serranid.data.dk <- read_in_dispersal_kernel(path)
ovm.serranid.dk.regions <- get_dispersal_distance_regions(ovm.serranid.data.dk, reefs.id)
rm(ovm.serranid.data.conn)
rm(ovm.serranid.data.dk)

ovm.synodontid.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-synod"))
ovm.synodontid.reefs <- summarize(group_by(ovm.synodontid.data.conn, settle), count = n())
ovm.synodontid.conn.reefs <- get_connectivity_matrix_reefs(ovm.synodontid.data.conn)/eggs
ovm.synodontid.conn.regions <- get_connectivity_matrix_regions(ovm.synodontid.data.conn, reefs.id)/eggs
ovm.synodontid.data.dk <- read_in_dispersal_kernel(path)
ovm.synodontid.dk.regions <- get_dispersal_distance_regions(ovm.synodontid.data.dk, reefs.id)
rm(ovm.synodontid.data.conn)
rm(ovm.synodontid.data.dk)

save(ovm.labrid.reefs,ovm.labrid.conn.reefs, ovm.labrid.conn.regions, ovm.labrid.dk.regions,
     ovm.mullid.reefs,ovm.mullid.conn.reefs, ovm.mullid.conn.regions, ovm.mullid.dk.regions,
     ovm.serranid.reefs,ovm.serranid.conn.reefs, ovm.serranid.conn.regions, ovm.serranid.dk.regions,
     ovm.synodontid.reefs,ovm.synodontid.conn.reefs, ovm.synodontid.conn.regions, ovm.synodontid.dk.regions,
     ovm.scorpaenid.reefs,ovm.scorpaenid.conn.reefs, ovm.scorpaenid.conn.regions, ovm.scorpaenid.dk.regions,
     ovm.scarid.reefs,ovm.scarid.conn.reefs, ovm.scarid.conn.regions, ovm.scarid.dk.regions,
     file="phase2.rda")


ovm.daily.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-daily"))
ovm.daily.reefs <- summarize(group_by(ovm.daily.data.conn, settle), count = n())
ovm.daily.conn.reefs <- get_connectivity_matrix_reefs(ovm.daily.data.conn)/eggs
ovm.daily.conn.regions <- get_connectivity_matrix_regions(ovm.daily.data.conn, reefs.id)/eggs
ovm.daily.data.dk <- read_in_dispersal_kernel(path)
ovm.daily.dk.regions <- get_dispersal_distance_regions(ovm.daily.data.dk, reefs.id)
rm(ovm.daily.data.conn)
rm(ovm.daily.data.dk)

ovm.timestep.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/theoretical/data/model-output/ovm-timestep"))
ovm.timestep.reefs <- summarize(group_by(ovm.timestep.data.conn, settle), count = n())
ovm.timestep.conn.reefs <- get_connectivity_matrix_reefs(ovm.timestep.data.conn)/eggs
ovm.timestep.conn.regions <- get_connectivity_matrix_regions(ovm.timestep.data.conn, reefs.id)/eggs
ovm.timestep.data.dk <- read_in_dispersal_kernel(path)
ovm.timestep.dk.regions <- get_dispersal_distance_regions(ovm.timestep.data.dk, reefs.id)
rm(ovm.timestep.data.conn)
rm(ovm.timestep.data.dk)


save(ovm.timestep.reefs,ovm.timestep.conn.reefs, ovm.timestep.conn.regions, ovm.timestep.dk.regions,
     ovm.daily.reefs,ovm.daily.conn.reefs, ovm.daily.conn.regions, ovm.daily.dk.regions, 
     file="phase3.rda")


