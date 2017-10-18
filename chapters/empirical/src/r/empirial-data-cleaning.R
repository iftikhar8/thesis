require(tidyverse)


# Read csv ----------------------------------------------------------------

# Read in both datasets
data.measure <- read_csv("../../data/ichthyoplankton-measurements.csv")
data.tow <- read_csv("../../data/ichthyoplankton-tow.csv")

# Select relevant columns
data.measure <- filter(data.measure, family != "bothid" & family != "triglid")
data.measure <- filter(data.measure, is.na(not_calibrated), is.na(damaged))
data.measure <- dplyr::select(data.measure, -subgroup, -photo_id, -damaged, -not_calibrated)

# Create factors (tibble does not import as factors)
data.measure$stage <- factor(data.measure$stage, levels = c("PRE", "FLE", "POS"), ordered=TRUE)
data.measure$family <- as.factor(data.measure$family)
data.measure$net <- as.factor(data.measure$net)
data.measure$depth <- as.factor(data.measure$depth)
data.measure$preservation_method <- as.factor(data.measure$preservation_method)
data.measure$feature <- as.factor(data.measure$feature)
data.measure$location <- as.factor(data.measure$location)
data.measure$station <- as.factor(data.measure$station)
data.measure$site <- as.factor(data.measure$site)
data.tow$net <- as.factor(data.tow$net_number)
data.tow$feature <- as.factor(data.tow$feature)
data.tow$feature_name <- as.factor(data.tow$feature_name)
data.tow$location <- as.factor(data.tow$location)
data.tow$site <- as.factor(data.tow$site)
data.tow$station <- as.factor(data.tow$station)


# Length data -------------------------------------------------------------
data.measure <- mutate(data.measure, total_length = standard_length + caudal_fin_length)
data.length <- data.measure %>% left_join(data.tow)
save(data.length, file="length.RData")


# Ontogeny data -----------------------------------------------------------
data.ontogeny <- summarize(group_by(data.measure, location, station, feature, net, family, stage), count = n())
# Join the tow data and calculate the concentration
data.ontogeny <- data.ontogeny %>% 
  spread( key=stage, value=count, drop =FALSE, fill = 0) %>% 
  gather(key=stage, value=count, PRE, FLE, POS,  na.rm = FALSE) %>% 
  left_join(data.tow) %>% 
  mutate(conc = count/volume) %>% 
  mutate(depth = if_else(net == 'N1' || net == 'N2', 0, if_else(net == 'M5' || net == 'M4', 25 ,75))) %>% 
  mutate(presence = ifelse(conc > 0, TRUE , FALSE))
data.ontogeny$depth <- as.factor(data.ontogeny$depth)
save(data.ontogeny, file="ontogeny.RData")