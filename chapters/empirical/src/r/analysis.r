library("tidyverse")
library("lintr")

### Read in and tidy data
data <- read_csv("../../data/ichthyoplankton-measurements.csv")
data.tow <- read_csv("../../data/ichthyoplankton-tow.csv")

# Select relevant data
data <- filter(data, family != "bothid" & family != "triglid")
data <- filter(data, is.na(not_calibrated), is.na(damaged))
data <- select(data, -subgroup, -photo_id, -damaged, -not_calibrated)

# Create factors
data$stage <- factor(data$stage, levels = c("PRE", "FLE", "POS"))
data$family <- as.factor(data$family)
data$net <- as.factor(data$net)
data$depth <- as.factor(data$depth)
data$preservation_method <- as.factor(data$preservation_method)
data$feature <- as.factor(data$feature)
data$location <- as.factor(data$location)
data$station <- as.factor(data$station)
data$site <- as.factor(data$site)

data.tow$net <- as.factor(data.tow$net_number)
data.tow$feature <- as.factor(data.tow$feature)
data.tow$feature_name <- as.factor(data.tow$feature_name)
data.tow$location <- as.factor(data.tow$location)
data.tow$site <- as.factor(data.tow$site)
data.tow$station <- as.factor(data.tow$station)

data <- mutate(data, total_length = standard_length + caudal_fin_length)

data.length <- summarize(group_by(data, location, feature, site,net, depth, family,
  stage), length_mean = mean(total_length), length_sd = sd(total_length),
  length_se = length_sd/n())

data.stage <- summarize(group_by(data, location, station, feature, net, family,
                               stage), count = n())

data.spread <- spread(data.stage, key=stage, value=count, drop =FALSE, fill = 0)
data.gather <- gather(data.spread, key=stage, value=count, PRE, POS, FLE, na.rm = FALSE)

data.concentration <- data.gather %>% left_join(data.tow) %>% mutate(concentration = count/volume * 250)
data.concentration <- mutate(data.concentration, concentration_log = log(concentration + 1),
                             depth = if_else(net == 'N1' || net == 'N2', 0, if_else(net == 'M5' || net == 'M4', 25 ,75)))
data.concentration$depth <- as.factor(data.concentration$depth)

data.summary.total <- summarise(group_by(data.concentration, location, feature, depth,
                                          stage), mean_conc = mean(concentration), sd_conc = sd(concentration),
                                mean_conc_log = mean(concentration_log), sd_conc_log = sd(concentration_log))



ggplot(data = data.summary.total, aes(x = mean_conc, y = sd_conc)) + geom_point()
ggplot(data = data.summary.total, aes(x = mean_conc_log, y = sd_conc_log)) + geom_point()

ggplot(data = data.concentration, aes(y=concentration, x=stage)) + geom_boxplot() + facet_wrap(~family)

model <- lm(concentration_log ~ location * feature * depth * stage * family, data =data.concentration)

### Check for correlations
data.all %>% correlate() %>% focus(concentration, total_length)
data.numeric <- select(data.all, concentration, length_mean, latitude, longitude, sst, chlorophyll_fluorescence, salinity)
data.numeric %>% correlate() %>% focus(concentration, total_length)

### Exploratory graphs

# Distribution of concentration data
plot.conc <- ggplot(data.all, aes(concentration)) + geom_density()

# Ontogeny
plot.families <- ggplot(data, aes(family)) + geom_bar()
ggsave(plot.families, "families_count.png", path = "../../figs/", width = 5, height = 4,
  dpi = 100)

ggplot(data, aes(family, fill = stage)) + geom_bar(position = "dodge") + theme(axis.text.x = element_text(angle = 45,
  vjust = 1, hjust = 1))
ggsave("families_stage_count.png", path = "../../figs/", width = 5, height = 4, dpi = 100)

ggplot(data, aes(site, fill = stage)) + geom_bar() + facet_wrap(~family)
ggsave("site_stage.png", path = "../../figs/", width = 8, height = 7, dpi = 100)

ggplot(data, aes(location, fill = stage)) + geom_bar() + facet_wrap(~family)
ggsave("location_stage.png", path = "../../figs/", width = 8, height = 7, dpi = 100)

ggplot(data, aes(feature, fill = stage)) + geom_bar() + facet_wrap(~family)
ggsave("feature_stage.png", path = "../../figs/", width = 8, height = 7, dpi = 100)

ggplot(data, aes(depth, fill = stage)) + geom_bar(position = "dodge") + facet_wrap(~family)
ggsave("depth_stage.png", path = "../../figs/", width = 8, height = 7, dpi = 100)


data.length <- summarize(group_by(data, location, feature, depth, family), length_mean = mean(total_length))

data.length.depth <- summarize(group_by(data, depth, family), length_mean = mean(total_length),
  length_sd = sd(total_length), length_se = length_sd / n(), cont = n())

ggplot(data.length.depth, aes(depth, length_mean)) + geom_bar(stat = "identity") +
  facet_wrap(~family) + geom_errorbar(aes(ymin = length_mean - length_se, ymax = length_mean +
  length_se, width = 0.1))

ggsave("depth_length.png", path = "../../figs/", width = 8, height = 7, dpi = 100)

data.conc.balanced <- filter(data.concentration, site != "8", site != "16", site != "4", site != "12")
model.concentration <- lm(concentration_log ~ location * feature * depth * stage, data = data.conc.balanced)
Anova(model.concentration, type="II")
summary.lm(model.concentration)

L <- as.fixed(data$location)
W <- as.fixed(data$feature)
D <- as.fixed(data$depth)
model.length <- lm(total_length ~ L * W * D, data = data)
Anova(model.length, type="III")
