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
clean <- FALSE

# Load the dataset
data.all <- read_csv("../data/lit_review.csv")

# Make column headers lowercase
colnames(data.all) <- tolower(colnames(data.all))

# Subset some data
data.fish <- filter(data.all, species_type == "Fish")

## Current trends section

# Motivations
data.all$motivation <- as.factor(data.all$motivation)
motivations.data <- data.all %>% select(paper_id, motivation) %>% distinct(paper_id, motivation)
motivations.prop <- get_factor_proportion(motivations.data$motivation)
motivations.plot <- ggplot(motivations.data,aes(motivation),fill=gray) + geom_bar() +
  labs(x="Categories of review motivations", y="Number of studies")
ggsave("../figs/motivations.png",plot=motivations.plot)

if(clean) {
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

# Time-step
summary(data.all$model_time_step)




## Comparisons with metrics section

### PHYSICAL COMPARISONS
#BPM model
data.all$model_name <- as.factor(data.all$model_name)
plot1 <- ggplot(data.all,aes(model_name,self_recruitment_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot2 <- ggplot(data.all,aes(model_name,local_retention_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot3 <- ggplot(data.all,aes(model_name,settlement_success_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot4 <- ggplot(data.all,aes(model_name,distance_travelled_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
model.biological_plot <- multiplot(g1,g2,g3,g4, cols=2)
ggsave("../figs/model_bdm_metrics.png",plot=model.biological_plot)

#Ocean model
data.all$physical_model <- as.factor(data.all$physical_model)
plot1 <- ggplot(data.all,aes(physical_model,self_recruitment_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot2 <- ggplot(data.all,aes(physical_model,local_retention_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot3 <- ggplot(data.all,aes(physical_model,settlement_success_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot4 <-ggplot(data.all,aes(physical_model,distance_travelled_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
model.physical_plot <- multiplot(g1,g2,g3,g4, cols=2)
ggsave("../figs/model_physical_metrics.png",plot=model.physical_plot)

# Oceanic region
data.all$oceanic_region <- as.factor(data.all$oceanic_region)
plot1 <- ggplot(data.all,aes(oceanic_region,self_recruitment_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot2 <- ggplot(data.all,aes(oceanic_region,local_retention_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot3 <- ggplot(data.all,aes(oceanic_region,settlement_success_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
plot4 <-ggplot(data.all,aes(oceanic_region,distance_travelled_mean)) + geom_boxplot()+ geom_jitter(width = 0.2) + coord_flip()
ocean.plot <- multiplot(plot1,plot2,plot3,plot4, cols=2)
ggsave("../figs/oceanic_metrics.png",plot=ocean.plot)

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
summary(resolution.sr_lm)
resolution.ss_lm <- lm(model_resolution_min ~ settlement_success_mean, data = resolution.data)
summary(resolution.ss_lm)
resolution.lr_lm <- lm(model_resolution_min ~ local_retention_mean, data = resolution.data)
summary(resolution.lr_lm)
resolution.dd_lm <- lm(model_resolution_min ~ distance_travelled_mean, data = resolution.data)
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
datastuff <- select(data.all$nested_submodels,data.all$self_recruitment_mean)

#Settlement compentency window

#Add the window
data.all <- data.all %>% mutate(window=pld_fixed-settlement_competency_type_start)
#ggplot(data.all,aes(window,self_recruitment_mean)) + geom_point() + geom_smooth(method=lm)
window.sr_lm <- lm(data.all$window,data.all$self_recruitment_mean)
window.sr_lm <- cor.test(data.all$window,data.all$local_retention_mean)
window.ss_lm <- cor.test(data.all$window,data.all$settlement_success_mean)
window.dt_lm <- cor.test(data.all$window,data.all$distance_travelled_mean)

window.sr_lm <- lm(window ~ self_recruitment_mean, data = data.all)
window.ss_lm <- lm(window ~ settlement_success_mean, data = data.all)
window.lr_lm <- lm(window ~ local_retention_mean, data = data.all)
window.dd_lm <- lm(window ~ distance_travelled_mean, data = data.all)
summary(window.sr_lm)
summary(window.ss_lm)
summary(window.lr_lm)
summary(window.dd_lm)

data.window <- data.all %>% select(PLD_fixed,Settlement_competency_type_start,Settlement_success_mean) %>%
  mutate(window=PLD_fixed-Settlement_competency_type_start) %>%
  na.omit
ggplot(data.window,aes(window,Settlement_success_mean)) + geom_point() + geom_smooth(method=lm)
corrSS <- cor.test(data.window$window,data.window$Settlement_success_mean)


data.window <- data.all %>% select(PLD_fixed,Settlement_competency_type_start,Local_retention_mean) %>%
  mutate(window=PLD_fixed-Settlement_competency_type_start) %>%
  na.omit
ggplot(data.window,aes(window,Local_retention_mean)) + geom_point() + geom_smooth(method=lm)
corrLR <- cor.test(data.window$window,data.window$Local_retention_mean)


#### EXTRA




review.ichthy.data
papers.data <- review.data %>% select(Paper_ID,Published,Oceanic_region,Years_total,Geographical_zone,Model_reuse,Model_name,Physical_model,Nested_submodels,Model_time_step) %>%
  distinct(Paper_ID,Published,Oceanic_region,Years_total,Geographical_zone,Model_reuse,Model_name,Physical_model,Nested_submodels,Model_time_step)




#Metrics by mortality
ggplot(review.data, aes(Mortality, Self_recruitment_mean)) + geom_boxplot()
ggplot(review.data, aes(Mortality, Settlement_success_mean)) + geom_boxplot()
ggplot(review.data, aes(Mortality, Distance_travelled_mean)) + geom_boxplot()


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
