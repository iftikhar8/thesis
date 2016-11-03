library("ggplot2")
library("tibble")
library("readr")
library("dplyr")

review.data <- read_csv("data/lit_review.csv")

#Summary statistics
spec(review.data)
summary(review.data)

review.ichthy.data <- filter(review.data,Species_type == "Fish")
papers.data <- review.data %>% select(Paper_ID,Published,Oceanic_region,Years_total,Geographical_zone,Model_reuse,Model_name,Physical_model,Nested_submodels,Model_time_step) %>% 
  distinct(Paper_ID,Published,Oceanic_region,Years_total,Geographical_zone,Model_reuse,Model_name,Physical_model,Nested_submodels,Model_time_step) 




#Metrics by mortality
ggplot(review.data, aes(Mortality, Self_recruitment_mean)) + geom_boxplot()
ggplot(review.data, aes(Mortality, Settlement_success_mean)) + geom_boxplot()
ggplot(review.data, aes(Mortality, Distance_travelled_mean)) + geom_boxplot()


#Years by publications
ggplot(papers.data, aes(Published)) + geom_bar()

#Model runs per publication
reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x))))
}

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
ggplot(papers.data.complete,aes(x=Years_total)) + geom_density() + scale_x_log10(breaks=c(1,10,100,1000))
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


#Mortality
review.data %>% group_by(Mortality_function) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

