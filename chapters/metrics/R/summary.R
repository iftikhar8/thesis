library("tibble")
library("readr")
library("corrr")
library("ggplot2")
library("dplyr")
metrics.data <- read_csv("data/lit_review_cleaned.csv")

# Dispersal poroportions
dispersal.data <- metrics.data %>% select(ID,Dispersal_kernel) %>% distinct(ID,Dispersal_kernel)
summary(dispersal.data)

# Connectivity matrix proportions
cm.data <- metrics.data %>% select(ID,Connectivity_matrix_potential) %>% distinct(ID,Connectivity_matrix_potential)
summary(cm.data)

# Graph theory proportions
graph.data <- metrics.data %>% select(ID,Graph_theory) %>% distinct(ID,Graph_theory)
summary(graph.data)