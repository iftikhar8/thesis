install.packages("ggplot2")
library("ggplot2")

dataset <- read.csv("data/lit_review_metanalysis.csv")
fish_dataset <- subset(dataset,dataset$Species_type=='Fish')

self_rec <- dataset$Self_recruitment_mean
settlement_success <- dataset$Settlement_success_mean
local_ret <- dataset$Local_retention_mean
distance <- dataset$Distance_travelled_mean

#basic summary of data
summary(dataset)

#boxplots
boxplot(settlement_success , xlab="Settlement success")
boxplot(self_rec, xlab = "self recruitment")
boxplot(distance, xlab = "distance travelled")
boxplot(local_ret, xlab = "local retention")

#resolution size
plot(dataset$Model_resolution_min ~ settlement_success)
plot(dataset$Model_resolution_min ~ self_rec)
plot(dataset$Model_resolution_min ~ distance)
plot(dataset$Model_resolution_min ~ local_ret)

#settlement reef size
plot(settlement_success~ dataset$Settlement_site_size,xlim=c(0,30))
plot(dataset$Settlement_site_size ~ self_rec)
plot(dataset$Settlement_site_size ~ distance)
plot(dataset$Settlement_site_size ~ local_ret)
#follow up the outliers - what is unique about these?
#look at mortality for settlement_succes

#pld
#average settling time? 
plot(dataset$PLD_fixed ~ settlement_success)
line <- lm(dataset$PLD_fixed ~ settlement_success)
abline(line)
summary(line)

plot(dataset$PLD_fixed ~ self_rec)
line <- lm(dataset$PLD_fixed ~ self_rec)
abline(line)
summary(line)

plot(dataset$PLD_fixed ~ distance)
line <- lm(dataset$PLD_fixed ~ distance)
abline(line)
summary(line)

plot(dataset$PLD_fixed ~ local_ret)
line <- lm(dataset$PLD_fixed ~ local_ret)
abline(line)
summary(line)


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

#correlating metrics check
plot(self_rec ~ settlement_success)
line <- lm(self_rec ~ settlement_success)
abline(line)
summary(line)

plot(self_rec ~ dataset$Local_retention_mean)

plot(self_rec ~ distance)
line <- lm(self_rec ~ distance)
abline(line)
summary(line)

plot(local_ret ~ settlement_success)
plot(local_ret ~ distance)

plot(settlement_success ~ distance)
line <- lm(settlement_success ~ distance)
abline(line)
summary(line)

