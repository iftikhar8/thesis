library(ggplot2)

dataset <- read.csv("data/lit_review_metanalysis.csv")
fish_dataset <- subset(dataset,dataset$Species_type=='Fish')

#basic summary of data
summary(dataset)

#exploratory plots

#resolution size
plot(dataset$Model_resolution_min ~ dataset$Settlement_success_mean)
plot(dataset$Model_resolution_min ~ dataset$Self_recruitment_mean)
plot(dataset$Model_resolution_min ~ dataset$Distance_travelled_mean)
plot(dataset$Model_resolution_min ~ dataset$Local_retention_mean)

#settlement reef size
plot(dataset$Settlement_site_size ~ dataset$Settlement_success_mean)
plot(dataset$Settlement_site_size ~ dataset$Self_recruitment_mean)
plot(dataset$Settlement_site_size ~ dataset$Distance_travelled_mean)
plot(dataset$Settlement_site_size ~ dataset$Local_retention_mean)

#pld
plot(dataset$PLD_fixed ~ dataset$Settlement_success_mean)
plot(dataset$PLD_fixed ~ dataset$Self_recruitment_mean)
plot(dataset$PLD_fixed ~ dataset$Distance_travelled_mean)
plot(dataset$PLD_fixed ~ dataset$Local_retention_mean)

#OVM behaviour
ggplot(data=dataset,aes(y=Settlement_success_mean,x=Ontogenetic_vertical_migration)) + geom_boxplot()
ggplot(data=dataset,aes(y=Self_recruitment_mean,x=Ontogenetic_vertical_migration)) + geom_boxplot()
ggplot(data=dataset,aes(y=Distance_travelled_mean,x=Ontogenetic_vertical_migration)) + geom_boxplot()
ggplot(data=dataset,aes(y=Local_retention_mean,x=Ontogenetic_vertical_migration)) + geom_boxplot()

#passive behaviour
ggplot(data=dataset,aes(y=Settlement_success_mean,x=Passive_movement)) + geom_boxplot()
ggplot(data=dataset,aes(y=Self_recruitment_mean,x=Passive_movement)) + geom_boxplot()
ggplot(data=dataset,aes(y=Distance_travelled_mean,x=Passive_movement)) + geom_boxplot()
ggplot(data=dataset,aes(y=Local_retention_mean,x=Passive_movement)) + geom_boxplot()

#sensory ability
ggplot(data=dataset,aes(y=Settlement_success_mean,x=Sensory_ability)) + geom_boxplot()
ggplot(data=dataset,aes(y=Self_recruitment_mean,x=Sensory_ability)) + geom_boxplot()
ggplot(data=dataset,aes(y=Local_retention_mean,x=Sensory_ability)) + geom_boxplot()

#settlement competency
ggplot(data=dataset,aes(y=Settlement_success_mean,x=Settlement_competency_window)) + geom_boxplot()
ggplot(data=dataset,aes(y=Self_recruitment_mean,x=Settlement_competency_window)) + geom_boxplot()
ggplot(data=dataset,aes(y=Local_retention_mean,x=Settlement_competency_window)) + geom_boxplot()


