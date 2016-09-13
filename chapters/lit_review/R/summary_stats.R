library("tibble")
library("readr")
library("corrr")
clean_dataset <- read_csv("data/lit_review_cleaned.csv")
spec(clean_dataset)
summary(clean_dataset)
isNum <- sapply(clean_dataset, is.numeric)
numeric_data <- select(clean_dataset, which(isNum))
correlated <- numeric_data %>% correlate() # finds all the correlations between numeric values

by_mortality <- group_by(clean_dataset,Mortality)

p <- ggplot(clean_dataset, aes(Mortality, Self_recruitment_mean))
p + geom_boxplot()

p2 <- ggplot(clean_dataset, aes(Mortality, Settlement_success_mean))
p2 + geom_boxplot(aes(fill = Mortality))

settlement <- summarise(by_mortality,
                   count = n(),
                   sr = mean(Self_recruitment_mean, na.rm = TRUE),
                   ss = mean(Settlement_success_mean, na.rm = TRUE))

ggplot(settlement, aes(sr, ss)) +
  geom_point(aes(size = count), alpha = 1/2) +
  geom_smooth() +
  scale_size_area()