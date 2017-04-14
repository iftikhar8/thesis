###
# Literature review chapter R code
###

# Install libraries if required
install.packages("ggplot2")
install.packages("tidyverse")

# Load all required libraries
library("grid")
library("tidyverse")
library("ggplot2")

# Load external functions
source("sort_factor.R")
source("get_factor_proportion.R")
source("multiplot.R")

# Clean the data sources after running
CLEAN <- FALSE

# Load the dataset
data.all <- read_csv("../data/lit_review.csv")

# Make column headers lowercase
colnames(data.all) <- tolower(colnames(data.all))

# Subset some data
data.fish <- filter(data.all, species_type == "Fish")

## Current trends section

# Years 
data.all$published <- as.factor(data.all$published)
years.data <- data.all %>% select(paper_id, published) %>% distinct(paper_id, published)
years.plot <- ggplot(years.data,aes(published),fill=gray) + geom_bar() +
  labs(x="Years of publication", y="Number of studies")
ggsave("../figs/years.png", plot=years.plot, width=5, height=4, dpi=100)


taxa.plot <- ggplot(data=data.all,aes(sort_factor(species_type))) + 
  geom_bar() + coord_flip() + ylab("Number of models using the taxa") + xlab("Taxa") + 
  scale_x_discrete(labels = c("Cnidarian","Gastropod","Macroalgae","Echinoderm","Polychaete","Coral","Crustacean","Mollusc","Bivalvia","Fish","Generic"))
ggsave("../figs/taxa.png", plot=taxa.plot, width=6, height=2.5, dpi=100)

# Motivations
data.all$motivation <- as.factor(data.all$motivation)
motivations.data <- data.all %>% select(paper_id, motivation) %>% distinct(paper_id, motivation)
motivations.prop <- get_factor_proportion(motivations.data$motivation)
motivations.plot <- ggplot(motivations.data,aes(motivation),fill=gray) + geom_bar() +
  labs(x="Categories of review motivations", y="Number of studies")
ggsave("../figs/motivations.png",plot=motivations.plot)

if(CLEAN) {
  rm(motivations.data)
  rm(motivations.prop)
  rm(motivations.plot)
}

# Oceanic regions
data.all$oceanic_region <- as.factor(data.all$oceanic_region)
data.all$geographical_zone <- as.factor(data.all$geographical_zone)
regions.data <- data.all %>% select(paper_id,oceanic_region,geographical_zone) %>% distinct(paper_id,oceanic_region,geographical_zone)
regions.prop <- get_factor_proportion(regions.data$oceanic_region)
regions.zoneprop <- get_factor_proportion(regions.data$geographical_zone)
regions.plot <- ggplot(regions.data,aes(sort_factor(oceanic_region)),fill=gray) + geom_bar() + coord_flip() + xlab("Oceanic region") + ylab("Number of papers per region")
ggsave("../figs/oceanic_region.png",plot=regions.plot)
rm(regions.data)

# Models used
data.all$physical_model <- as.factor(data.all$physical_model)
data.all$model_name <- as.factor(data.all$model_name)
models.data <- data.all %>% select(paper_id,physical_model,model_name) %>% distinct(paper_id,physical_model,model_name)
models.biophysical <- get_factor_proportion(models.data$model_name)
models.physical <- get_factor_proportion(models.data$physical_model)

# Nested models
nested.data <- data.all %>% select(paper_id, nested_submodels) %>% distinct(paper_id, nested_submodels)
summary(nested.data)
# Time-step
summary(data.all$model_time_step)
# Model integration 
data.all$model_integration <- as.factor(data.all$model_integration) 
integration.data <- data.all %>% select(paper_id, model_integration) %>% distinct(paper_id, model_integration)
summary(integration.data$model_integration)

## Biological models

# Spawning sites
data.all <- data.all %>% mutate(spawning_sites_diff=spawning_settlement_sites-spawning_release_sites)
spawning_sites.data <- data.all %>% select(paper_id, spawning_sites_diff) %>% distinct(paper_id, spawning_sites_diff)
summary(spawning_sites.data$spawning_sites_diff > 0)

# Years total
model_years.data <- data.all %>% select(paper_id, years_total) %>% distinct(paper_id, years_total)
summary(model_years.data$years_total == 1)

# Behaviours
data.all <- data.all %>% mutate(movement = 
                                  circatidal_migration |
                                  pynocline_migration |
                                  halocline_migration |
                                  ontogentic_vertical_migration |
                                  vertical_swimming_ability |
                                  horizontal_swimming_ability |
                                  sinking_velocity  | 
                                  diel_vertical_migration) %>% mutate(settlement = sensory_extent > 0)


## Metrics used
mean(data.all$settlement_success_mean)
settlement_success.data <- na.omit(data.all$settlement_success_mean)
summary(settlement_success.data)


## Comparisons with metrics section

### PHYSICAL COMPARISONS
#BPM model
data.all$model_name <- as.factor(data.all$model_name)
plot1 <- ggplot(data.all,aes(model_name,self_recruitment_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot2 <- ggplot(data.all,aes(model_name,local_retention_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot3 <- ggplot(data.all,aes(model_name,settlement_success_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot4 <- ggplot(data.all,aes(model_name,distance_travelled_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
png("../figs/model_bdm_metrics.png", width=700, height=504)
multiplot(plot1,plot2,plot3,plot4, cols=2)
dev.off()


#Ocean model
data.all$physical_model <- as.factor(data.all$physical_model)
plot1 <- ggplot(data.all,aes(physical_model,self_recruitment_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot2 <- ggplot(data.all,aes(physical_model,local_retention_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot3 <- ggplot(data.all,aes(physical_model,settlement_success_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot4 <-ggplot(data.all,aes(physical_model,distance_travelled_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
png("../figs/model_physical_metrics.png", width=700, height=504)
multiplot(plot1,plot2,plot3,plot4, cols=2)
dev.off()

# Oceanic region
data.all$oceanic_region <- as.factor(data.all$oceanic_region)
plot1 <- ggplot(data.all,aes(oceanic_region,self_recruitment_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot2 <- ggplot(data.all,aes(oceanic_region,local_retention_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot3 <- ggplot(data.all,aes(oceanic_region,settlement_success_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot4 <-ggplot(data.all,aes(oceanic_region,distance_travelled_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
ocean.plot <- multiplot(plot1,plot2,plot3,plot4, cols=2)
png("../figs/oceanic_metrics.png",width = 750, height = 750)
multiplot(plot1,plot2,plot3,plot4, cols=2)
dev.off()

# System choice
data.all$system <- as.factor(data.all$system)
bartlett.test(self_recruitment_mean ~ system, data=data.all)
t.test(self_recruitment_mean ~ system, data=data.all, var.equal=FALSE)
bartlett.test(local_retention_mean ~ system, data=data.all)
t.test(local_retention_mean ~ system, data=data.all, var.equal=FALSE)
bartlett.test(settlement_success_mean ~ system, data=data.all)
t.test(settlement_success_mean ~ system, data=data.all, var.equal=TRUE)
bartlett.test(distance_travelled_mean ~ system, data=data.all)
t.test(distance_travelled_mean ~ system, data=data.all, var.equal=FALSE)


# Model resolution
resolution.data <- data.all %>% select(model_resolution_min,self_recruitment_mean,settlement_success_mean,
                                       local_retention_mean,distance_travelled_mean)
resolution.sr_lm <- lm(model_resolution_min ~ self_recruitment_mean, data = resolution.data)
resolution.ss_lm <- lm(model_resolution_min ~ settlement_success_mean, data = resolution.data)
resolution.lr_lm <- lm(model_resolution_min ~ local_retention_mean, data = resolution.data)
resolution.dd_lm <- lm(model_resolution_min ~ distance_travelled_mean, data = resolution.data)
summary(resolution.sr_lm)
summary(resolution.ss_lm)
summary(resolution.lr_lm)
summary(resolution.dd_lm)

#Nested models
bartlett.test(self_recruitment_mean ~ nested_submodels, data=data.all)
t.test(self_recruitment_mean ~ nested_submodels, data=data.all, var.equal=FALSE)
#bartlett.test(local_retention_mean ~ nested_submodels, data=data.all)
#t.test(local_retention_mean ~ nested_submodels, data=data.all, var.equal=FALSE)
bartlett.test(settlement_success_mean ~ nested_submodels, data=data.all)
t.test(settlement_success_mean ~ nested_submodels, data=data.all, var.equal=TRUE)
bartlett.test(distance_travelled_mean ~ nested_submodels, data=data.all)
t.test(distance_travelled_mean ~ nested_submodels, data=data.all, var.equal=FALSE)


### BIOLOGICAL COMPARISONS

#Pelagic larval duration
pld.sr_lm <- lm(self_recruitment_mean ~ pld_fixed, data = data.all)
pld.ss_lm <- lm(settlement_success_mean ~ pld_fixed, data = data.all)
pld.lr_lm <- lm(local_retention_mean ~ pld_fixed, data = data.all)
pld.dd_lm <- lm(distance_travelled_mean ~ pld_fixed, data = data.all)
summary(pld.sr_lm)
summary(pld.lr_lm)
summary(pld.ss_lm)
summary(pld.dd_lm)
ggplot(data.all,aes(pld_fixed,self_recruitment_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(data.all,aes(pld_fixed,local_retention_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(data.all,aes(pld_fixed,settlement_success_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(data.all,aes(pld_fixed,distance_travelled_mean)) + geom_point() + geom_smooth(method=lm)

#Settlement compentency window
data.all <- data.all %>% mutate(window=pld_fixed-settlement_competency_type_start)
window.sr_lm <- lm(window ~ self_recruitment_mean, data = data.all)
window.ss_lm <- lm(window ~ settlement_success_mean, data = data.all)
window.lr_lm <- lm(window ~ local_retention_mean, data = data.all)
window.dd_lm <- lm(window ~ distance_travelled_mean, data = data.all)
summary(window.sr_lm)
summary(window.ss_lm)
summary(window.lr_lm)
summary(window.dd_lm)
ggplot(data.all,aes(window,self_recruitment_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(data.all,aes(window,local_retention_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(data.all,aes(window,settlement_success_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(data.all,aes(window,distance_travelled_mean)) + geom_point() + geom_smooth(method=lm)

#Mortality
mortality.prop <- data.all %>% filter(mortality == TRUE) %>% group_by(mortality_function) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
plot1 <- ggplot(data.all, aes(mortality, self_recruitment_mean)) + geom_boxplot() + geom_jitter(width = 0.2)
plot2 <- ggplot(data.all, aes(mortality, local_retention_mean)) + geom_boxplot()+ geom_jitter(width = 0.2)
plot3 <- ggplot(data.all, aes(mortality, settlement_success_mean)) + geom_boxplot()+ geom_jitter(width = 0.2)
plot4 <- ggplot(data.all, aes(mortality, distance_travelled_mean)) + geom_boxplot()+ geom_jitter(width = 0.2)
png("../figs/mortality_metrics.png",width = 750, height = 750)
multiplot(plot1,plot2,plot3,plot4, cols=2)
dev.off()

bartlett.test(self_recruitment_mean ~ mortality, data=data.all)
bartlett.test(local_retention_mean ~ mortality, data=data.all)
bartlett.test(settlement_success_mean ~ mortality, data=data.all)
bartlett.test(distance_travelled_mean ~ mortality, data=data.all)
t.test(self_recruitment_mean ~ mortality, data=data.all, var.equal=TRUE)
t.test(local_retention_mean ~ mortality, data=data.all, var.equal=FALSE)
t.test(settlement_success_mean ~ mortality, data=data.all, var.equal=TRUE)
t.test(distance_travelled_mean ~ mortality, data=data.all, var.equal=FALSE)

mortality.linear <- data.all %>% filter(mortality_function == "Linear" & mortality_rate > 0)
mortality.lm_sr <- lm(self_recruitment_mean ~ mortality_rate, data=mortality.linear)

ggplot(mortality.linear, aes(mortality_rate, self_recruitment_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(mortality.linear, aes(mortality_rate, local_retention_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(mortality.linear, aes(mortality_rate, settlement_success_mean)) + geom_point() + geom_smooth(method=lm)
ggplot(mortality.linear, aes(mortality_rate, distance_travelled_mean)) + geom_point() + geom_smooth(method=lm)

review.ichthy.data
papers.data <- review.data %>% select(Paper_ID,Published,Oceanic_region,Years_total,Geographical_zone,Model_reuse,Model_name,Physical_model,Nested_submodels,Model_time_step) %>%
  distinct(Paper_ID,Published,Oceanic_region,Years_total,Geographical_zone,Model_reuse,Model_name,Physical_model,Nested_submodels,Model_time_step)

#Metrics by mortality
ggplot(review.data, aes(Mortality, Self_recruitment_mean)) + geom_boxplot()
ggplot(review.data, aes(Mortality, Settlement_success_mean)) + geom_boxplot()
ggplot(review.data, aes(Mortality, Distance_travelled_mean)) + geom_boxplot()

#Metrics by behaviour
behaviour.data <- data.all %>% mutate(settlement = sensory_ability & passive_movement & !orientation) %>% 
  mutate(move_orien = movement & orientation & !sensory_ability) %>% 
  mutate(orien_settle = orientation & sensory_ability & passive_movement) %>% 
  mutate(move_orien_settle = orientation & sensory_extent > 0 & !passive_movement) %>% 
  mutate(move_settle = sensory_ability & movement & !orientation) %>% 
  mutate(no_behav = passive_movement == TRUE & sensory_ability == FALSE & orientation == FALSE) %>% 
  mutate(orien = orientation == TRUE & sensory_ability == FALSE & passive_movement == TRUE) %>% 
  mutate(move = passive_movement == FALSE & sensory_ability == FALSE & orientation == FALSE)

behaviour.data <- behaviour.data %>% gather(behaviours, implemented, no_behav,move,orien,settlement,move_orien,orien_settle,move_settle,move_orien_settle) %>% filter(implemented == TRUE)
behaviour.data$behaviours <- factor(behaviour.data$behaviours,levels = c('no_behav','move','settlement','move_settle','orien','orien_move','orien_settle','orien_move_settle'),ordered=TRUE)


plot1 <- ggplot(behaviour.data,aes(behaviours,self_recruitment_mean)) + geom_boxplot(na.rm = TRUE) + geom_jitter(width=0.2) + 
  scale_x_discrete(limits=c('no_behav','move','settlement','move_settle','orien','orien_move','orien_settle','orien_move_settle'),
                   labels=c("P","M","S","MS","O","OM","OS","OMS"))
plot2 <- ggplot(behaviour.data,aes(behaviours,local_retention_mean)) + geom_boxplot(na.rm = TRUE) + geom_jitter(width=0.2) +
  scale_x_discrete(limits=c('no_behav','move','settlement','move_settle','orien','orien_move','orien_settle','orien_move_settle'),
                   labels=c("P","M","S","MS","O","OM","OS","OMS"))
plot3 <- ggplot(behaviour.data,aes(behaviours,settlement_success_mean)) + geom_boxplot(na.rm = TRUE) + geom_jitter(width=0.2) +
  scale_x_discrete(limits=c('no_behav','move','settlement','move_settle','orien','orien_move','orien_settle','orien_move_settle'),
                   labels=c("P","M","S","MS","O","OM","OS","OMS"))
plot4 <- ggplot(behaviour.data,aes(behaviours,distance_travelled_mean)) + geom_boxplot(na.rm = TRUE) + geom_jitter(width=0.2) +
  scale_x_discrete(limits=c('no_behav','move','settlement','move_settle','orien','orien_move','orien_settle','orien_move_settle'),
                   labels=c("P","M","S","MS","O","OM","OS","OMS"))

png("../figs/behaviour_metrics.png",width = 750, height = 750)
multiplot(plot1,plot2,plot3,plot4, cols=2)
dev.off()

fit <- aov(self_recruitment_mean ~ behaviours, data = behaviour.data)
hist(residuals(fit), col="darkgray")

kruskal.test(self_recruitment_mean ~ behaviours, data = behaviour.data)
kruskal.test(local_retention_mean ~ behaviours, data = behaviour.data)
kruskal.test(settlement_success_mean ~ behaviours, data = behaviour.data)
kruskal.test(distance_travelled_mean ~ behaviours, data = behaviour.data)

dunn.test(behaviour.data$self_recruitment_mean,behaviour.data$behaviours, method="hs", list=TRUE,rmc=TRUE)
dunn.test(behaviour.data$settlement_success_mean,behaviour.data$behaviours, method="bh")
dunn.test(behaviour.data$distance_travelled_mean,behaviour.data$behaviours, method="bh")

#Years by publications
ggplot(papers.data, aes(Published)) + geom_bar()

#Model runs per publication


ggplot(review.data,aes(reorder_size(DOI))) + geom_bar() + theme(axis.text.x=element_blank(),
                                                                axis.ticks.x=element_blank()) + xlab("Models per paper")

#Proportions of implemented behaviours
review.data %>% group_by(Mortality) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Growth) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Sensory_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Settlement_competency_window) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Orientation) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Mortality) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Proportions of swimming behaviours for FISH larvae
ichthy.swimming <- filter(review.ichthy.data,Passive_movement==FALSE)
ichthy.swimming %>% group_by(Horizontal_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Vertical_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Ontogentic_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Diel_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Halocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Circatidal_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Pynocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Sinking_velocity) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
ichthy.swimming %>% group_by(Egg_buoyancy) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Proportions of swimming behaviours for ALL larvae
larvae.swimming <- filter(review.data,Passive_movement==FALSE)
larvae.swimming %>% group_by(Horizontal_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Vertical_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Ontogentic_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Diel_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Halocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Circatidal_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Pynocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Sinking_velocity) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
larvae.swimming %>% group_by(Egg_buoyancy) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Publications by oceanographic region
ggplot(papers.data,aes(reorder_size(Oceanic_region)),fill=gray) + geom_bar() + coord_flip()
papers.data %>% group_by(Geographical_zone) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Years per study
#ggplot(papers.data,aes(reorder_size(Years_total)),fill=gray) + geom_bar() + coord_flip()
papers.data.complete = na.omit(papers.data)
ggplot(papers.data.complete,aes(x=Years_total)) + geom_density()
ggplot(papers.data.complete,aes(x=Years_total)) + geom_histogram(binwidth = 5)
ggplot(papers.data.complete,aes(x=Years_total)) + geom_boxplot()

#Models used
summary(papers.data$Model_reuse)
models.particle.freq <- papers.data %>% group_by(Model_name) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
models.ocean.freq <-papers.data %>% group_by(Physical_model) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
models.sub
#Pelagic larval durations
ggplot(review.data,aes(x=PLD_fixed)) + geom_histogram(binwidth = 15)
review.data %>% group_by(PLD_type) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Species modelled
ggplot(data=review.data,aes(reorder_size(Species_type)),fill=gray) + geom_bar() + coord_flip()
summary(review.data$Species_type=='Fish')
summary(review.data$Species_type=='Bivalvia')
fish.species <- factor(na.omit(review.data$Species_scientific_name))

#Settlement competency
f1 <- lm(Settlement_competency_type_start~PLD_fixed,data=review.data)
f2 <- lm(PLD_fixed~Settlement_competency_type_start,data=review.data)
f <- ggplot(review.data, aes(Settlement_competency_type_start,PLD_fixed))+geom_point() + geom_smooth(method=lm)

#Mortality
review.data %>% group_by(Mortality_function) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Self-recruitment
ggplot(review_data,aes(Self_recruitment_mean)) + geom_boxplot()

#Metrics
ggplot(data=dataset,aes(y=Settlement_success_mean,x=Settlement_competency_window)) + geom_boxplot()
ggplot(data=dataset,aes(y=Self_recruitment_mean,x=Settlement_competency_window)) + geom_boxplot()
ggplot(data=dataset,aes(y=Local_retention_mean,x=Settlement_competency_window)) + geom_boxplot()
