library("ggplot2")
library("tibble")
library("readr")

review_data <- read_csv("data/lit_review_cleaned.csv")
papers <- review_data %>% select(Published,DOI) %>% distinct(Published,DOI) 

#Figure 1: Metrics by mortality
fig1a <- ggplot(review_data, aes(Mortality, Self_recruitment_mean))
fig1a + geom_boxplot()

fig1b <- ggplot(review_data, aes(Mortality, Settlement_success_mean))
fig1b + geom_boxplot()

fig1c <- ggplot(review_data, aes(Mortality, Distance_travelled_mean))
fig1c + geom_boxplot()

#Figure 2: Years by publications
fig2 <- ggplot(papers, aes(Published)) 
fig2 + geom_bar()

#Figure 3: Model runs per publication
reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x))))
}

fig3 <- ggplot(review_data,aes(reorder_size(DOI)))
fig3 + geom_bar() + theme(axis.text.x=element_blank(),
                        axis.ticks.x=element_blank()) + xlab("Models per paper")

#Table 1: Proportions of implemented behaviours
review_data %>% group_by(Mortality) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review_data %>% group_by(Growth) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review_data %>% group_by(Sensory_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review_data %>% group_by(Settlement_competency_window) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review_data %>% group_by(Orientation) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review_data %>% group_by(Mortality) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Table 2: Proportions of swimming behaviours
non.passive.models <- filter(review_data,Passive_movement==FALSE)
non.passive.models %>% group_by(Horizontal_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Vertical_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Ontogentic_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Diel_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Halocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Circatidal_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Pynocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Sinking_velocity) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Egg_buoyancy) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))