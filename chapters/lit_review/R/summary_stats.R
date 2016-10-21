library("tibble")
library("readr")
library("corrr")
library("ggplot2")
library("dplyr")
clean_dataset <- read_csv("data/lit_review_cleaned.csv")
spec(clean_dataset)
summary(clean_dataset)
isNum <- sapply(clean_dataset, is.numeric)
numeric_data <- select(clean_dataset, which(isNum))
correlated <- numeric_data %>% correlate() # finds all the correlations between numeric values

ggplot(settlement, aes(sr, ss)) 
geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area()

journals <- factor(clean_dataset$Journal)