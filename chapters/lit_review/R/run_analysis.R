library("ggplot2")
library("tibble")
library("readr")
library("dplyr")

review.data <- read_csv("data/lit_review_cleaned.csv")
ichthy.data <- filter(review.data,Species_type == "Fish")

papers.data <- review.data %>% select(Paper_ID,Published,Oceanic_region,Years_total) %>% distinct(Paper_ID,Published,Oceanic_region,Years_total) 

#Figure 1: Metrics by mortality
fig1a <- ggplot(review.data, aes(Mortality, Self_recruitment_mean))
fig1a + geom_boxplot()

fig1b <- ggplot(review.data, aes(Mortality, Settlement_success_mean))
fig1b + geom_boxplot()

fig1c <- ggplot(review.data, aes(Mortality, Distance_travelled_mean))
fig1c + geom_boxplot()

#Figure 2: Years by publications
fig2 <- ggplot(papers.data, aes(Published)) 
fig2 + geom_bar()

#Figure 3: Model runs per publication
reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x))))
}

fig3 <- ggplot(review.data,aes(reorder_size(DOI)))
fig3 + geom_bar() + theme(axis.text.x=element_blank(),
                        axis.ticks.x=element_blank()) + xlab("Models per paper")

#Table 1: Proportions of implemented behaviours
review.data %>% group_by(Mortality) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Growth) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Sensory_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Settlement_competency_window) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Orientation) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
review.data %>% group_by(Mortality) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

#Table 2: Proportions of swimming behaviours
non.passive.models <- filter(review.data,Passive_movement==FALSE)
non.passive.models %>% group_by(Horizontal_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Vertical_swimming_ability) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Ontogentic_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Diel_vertical_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Halocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Circatidal_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Pynocline_migration) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Sinking_velocity) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))
non.passive.models %>% group_by(Egg_buoyancy) %>% summarise (n = n()) %>% mutate(freq = n / sum(n))

# Figure 4. Publications by oceangraphic region
fig4 <- ggplot(papers.data,aes(reorder_size(Oceanic_region)),fill=gray) + geom_bar() + coord_flip()

# Figure 5. Years per study
#fig5 <- ggplot(papers.data,aes(reorder_size(Years_total)),fill=gray) + geom_bar() + coord_flip()
papers.data.complete = na.omit(papers.data)
fig5 <- ggplot(papers.data.complete,aes(x=Years_total)) + geom_density() + scale_x_log10(breaks=c(1,10,100,1000))

#Figure 6 PLDs
fig6 <- ggplot(review.data,aes(x=PLD_fixed)) + geom_histogram(binwidth = 10)




