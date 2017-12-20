library(tidyverse)
source("applied-functions.R")

prefix_imac <- "/Users/steve/Documents/PhD/Thesis"
prefix <- "/Users/Steven/Documents/Thesis"

reefs.id <- read_csv("../../data/reefs.csv")
save(reefs.id,file="reefs.rda")

blackcod.2011.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2011"))
blackcod.2011.reefs <- summarize(group_by(blackcod.2011.data.conn, source, settle), count = n())
blackcod.2011.regions <- get_regions(blackcod.2011.reefs, reefs.id)
blackcod.2011.reefs <- rename(blackcod.2011.reefs, blackcod.2011=count)
blackcod.2011.regions <- rename(blackcod.2011.regions, blackcod.2011=count)
blackcod.2011.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2011.data.conn)
blackcod.2011.conn.regions <- get_connectivity_matrix_regions(blackcod.2011.data.conn, reefs.id)
blackcod.2011.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2011"))
blackcod.2011.dk.regions <- get_dispersal_distance_regions(blackcod.2011.data.dk, reefs.id)
rm(blackcod.2011.data.conn)
rm(blackcod.2011.data.dk)

blackcod.2010.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2010"))
blackcod.2010.reefs <- summarize(group_by(blackcod.2010.data.conn, source, settle), count = n())
blackcod.2010.regions <- get_regions(blackcod.2010.reefs, reefs.id)
blackcod.2010.reefs <- rename(blackcod.2010.reefs, blackcod.2010=count)
blackcod.2010.regions <- rename(blackcod.2010.regions, blackcod.2010=count)
blackcod.2010.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2010.data.conn)
blackcod.2010.conn.regions <- get_connectivity_matrix_regions(blackcod.2010.data.conn, reefs.id)
blackcod.2010.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2010"))
blackcod.2010.dk.regions <- get_dispersal_distance_regions(blackcod.2010.data.dk, reefs.id)
rm(blackcod.2010.data.conn)
rm(blackcod.2010.data.dk)

blackcod.2009.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2009"))
blackcod.2009.reefs <- summarize(group_by(blackcod.2009.data.conn, source, settle), count = n())
blackcod.2009.regions <- get_regions(blackcod.2009.reefs, reefs.id)
blackcod.2009.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2009.data.conn)
blackcod.2009.conn.regions <- get_connectivity_matrix_regions(blackcod.2009.data.conn, reefs.id)
blackcod.2009.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2009"))
blackcod.2009.dk.regions <- get_dispersal_distance_regions(blackcod.2009.data.dk, reefs.id)
blackcod.2009.reefs <- rename(blackcod.2009.reefs, blackcod.2009=count)
blackcod.2009.regions <- rename(blackcod.2009.regions, blackcod.2009=count)
rm(blackcod.2009.data.conn)
rm(blackcod.2009.data.dk)

blackcod.2008.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2008"))
blackcod.2008.reefs <- summarize(group_by(blackcod.2008.data.conn, source, settle), count = n())
blackcod.2008.regions <- get_regions(blackcod.2008.reefs, reefs.id)
blackcod.2008.reefs <- rename(blackcod.2008.reefs, blackcod.2008=count)
blackcod.2008.regions <- rename(blackcod.2008.regions, blackcod.2008=count)
blackcod.2008.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2008.data.conn)
blackcod.2008.conn.regions <- get_connectivity_matrix_regions(blackcod.2008.data.conn, reefs.id)
blackcod.2008.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2008"))
blackcod.2008.dk.regions <- get_dispersal_distance_regions(blackcod.2008.data.dk, reefs.id)
rm(blackcod.2008.data.conn)
rm(blackcod.2008.data.dk)

blackcod.2007.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2007"))
blackcod.2007.reefs <- summarize(group_by(blackcod.2007.data.conn, source, settle), count = n())
blackcod.2007.regions <- get_regions(blackcod.2007.reefs, reefs.id)
blackcod.2007.reefs <- rename(blackcod.2007.reefs, blackcod.2007=count)
blackcod.2007.regions <- rename(blackcod.2007.regions, blackcod.2007=count)
blackcod.2007.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2007.data.conn)
blackcod.2007.conn.regions <- get_connectivity_matrix_regions(blackcod.2007.data.conn, reefs.id)
blackcod.2007.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2007"))
blackcod.2007.dk.regions <- get_dispersal_distance_regions(blackcod.2007.data.dk, reefs.id)
rm(blackcod.2007.data.conn)
rm(blackcod.2007.data.dk)

blackcod.2006.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2006"))
blackcod.2006.reefs <- summarize(group_by(blackcod.2006.data.conn, source, settle), count = n())
blackcod.2006.regions <- get_regions(blackcod.2006.reefs, reefs.id)
blackcod.2006.reefs <- rename(blackcod.2006.reefs, blackcod.2006=count)
blackcod.2006.regions <- rename(blackcod.2006.regions, blackcod.2006=count)
blackcod.2006.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2006.data.conn)
blackcod.2006.conn.regions <- get_connectivity_matrix_regions(blackcod.2006.data.conn, reefs.id)
blackcod.2006.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2006"))
blackcod.2006.dk.regions <- get_dispersal_distance_regions(blackcod.2006.data.dk, reefs.id)
rm(blackcod.2006.data.conn)
rm(blackcod.2006.data.dk)

blackcod.2005.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2005"))
blackcod.2005.reefs <- summarize(group_by(blackcod.2005.data.conn, source, settle), count = n())
blackcod.2005.regions <- get_regions(blackcod.2005.reefs, reefs.id)
blackcod.2005.reefs <- rename(blackcod.2005.reefs, blackcod.2005=count)
blackcod.2005.regions <- rename(blackcod.2005.regions, blackcod.2005=count)
blackcod.2005.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2005.data.conn)
blackcod.2005.conn.regions <- get_connectivity_matrix_regions(blackcod.2005.data.conn, reefs.id)
blackcod.2005.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2005"))
blackcod.2005.dk.regions <- get_dispersal_distance_regions(blackcod.2005.data.dk, reefs.id)
rm(blackcod.2005.data.conn)
rm(blackcod.2005.data.dk)

blackcod.2004.data.conn <- read_in_connectivity(paste0(prefix,"/chapters/applied/data/model-output/2004"))
blackcod.2004.reefs <- summarize(group_by(blackcod.2004.data.conn, source, settle), count = n())
blackcod.2004.regions <- get_regions(blackcod.2004.reefs, reefs.id)
blackcod.2004.reefs <- rename(blackcod.2004.reefs, blackcod.2004=count)
blackcod.2004.regions <- rename(blackcod.2004.regions, blackcod.2004=count)
blackcod.2004.conn.reefs <- get_connectivity_matrix_reefs(blackcod.2004.data.conn)
blackcod.2004.conn.regions <- get_connectivity_matrix_regions(blackcod.2004.data.conn, reefs.id)
blackcod.2004.data.dk <- read_in_dispersal_kernel(paste0(prefix,"/chapters/applied/data/model-output/2004"))
blackcod.2004.dk.regions <- get_dispersal_distance_regions(blackcod.2004.data.dk, reefs.id)
rm(blackcod.2004.data.conn)
rm(blackcod.2004.data.dk)


save(blackcod.2011.reefs,blackcod.2011.regions, blackcod.2011.conn.reefs,blackcod.2011.conn.regions, blackcod.2011.regions,blackcod.2011.dk.regions,
     blackcod.2010.reefs,blackcod.2010.regions, blackcod.2010.conn.reefs,blackcod.2010.conn.regions, blackcod.2010.regions,blackcod.2010.dk.regions,
     blackcod.2009.reefs,blackcod.2009.regions, blackcod.2009.conn.reefs,blackcod.2009.conn.regions, blackcod.2009.regions,blackcod.2009.dk.regions,
     blackcod.2008.reefs,blackcod.2008.regions, blackcod.2008.conn.reefs,blackcod.2008.conn.regions, blackcod.2008.regions,blackcod.2008.dk.regions,
     blackcod.2007.reefs,blackcod.2007.regions, blackcod.2007.conn.reefs,blackcod.2007.conn.regions, blackcod.2007.regions,blackcod.2007.dk.regions,
     blackcod.2006.reefs,blackcod.2006.regions, blackcod.2006.conn.reefs,blackcod.2006.conn.regions, blackcod.2006.regions,blackcod.2006.dk.regions,
     blackcod.2005.reefs,blackcod.2005.regions, blackcod.2005.conn.reefs,blackcod.2005.conn.regions, blackcod.2005.regions,blackcod.2005.dk.regions,
     blackcod.2004.reefs,blackcod.2004.regions, blackcod.2004.conn.reefs,blackcod.2004.conn.regions, blackcod.2004.regions,blackcod.2004.dk.regions,
     file="blackcod.rda")

reefs.data <- blackcod.2011.reefs %>% full_join(blackcod.2010.reefs) %>% full_join(blackcod.2009.reefs) %>% full_join(blackcod.2008.reefs) %>% 
  full_join(blackcod.2007.reefs) %>% full_join(blackcod.2006.reefs) %>% full_join(blackcod.2005.reefs)  %>% full_join(blackcod.2004.reefs)
regions.data <- blackcod.2011.regions %>% full_join(blackcod.2010.regions) %>% full_join(blackcod.2009.regions) %>% full_join(blackcod.2008.regions) %>% 
  full_join(blackcod.2007.regions) %>% full_join(blackcod.2006.regions) %>% full_join(blackcod.2005.regions) %>% full_join(blackcod.2004.regions)

save(reefs.data, regions.data, file="nmds.rda")
