library("tidyverse")
library("lintr")

###
# Read in and tidy data
##
data <- read_csv('../../data/ichthyoplankton-measurements.csv')

# Select relevant data
data <- filter(data, family != "bothid" & family != 'triglid')
data <- filter(data, is.na(not_calibrated), is.na(damaged))
data <- select(data, -subgroup, -photo_id, -damaged, -not_calibrated)

# Create factors
data$stage <- factor(data$stage,levels=c("PRE","FLE","POS"))
data$family <- as.factor(data$family)
data$net <- as.factor(data$net)
data$site <- as.factor(data$site)
data$depth <- as.factor(data$depth)
data$preservation_method <- as.factor(data$preservation_method)
data$feature <- as.factor(data$feature)
data$location <- as.factor(data$location)

data <- mutate(data, total_length = standard_length + caudal_fin_length)

###
# Exploratory graphs
##

# Ontogeny
ggplot(data,aes(family)) + geom_bar()
ggsave("families_count.png",path="../../figs/")

ggplot(data,aes(family,fill=stage)) + geom_bar(position="dodge")
ggsave("families_stage_count.png",path="../../figs/")

ggplot(data,aes(site,fill=stage)) + geom_bar() + facet_wrap(~family)
ggsave("site_stage.png",path="../../figs/")

ggplot(data,aes(location,fill=stage)) + geom_bar() + facet_wrap(~family)
ggsave("location_stage.png",path="../../figs/")

ggplot(data,aes(feature,fill=stage)) + geom_bar() + facet_wrap(~family)
ggsave("feature_stage.png",path="../../figs/")

ggplot(data,aes(depth,fill=stage)) + geom_bar(position="dodge") + facet_wrap(~family)
ggsave("depth_stage.png",path="../../figs/")