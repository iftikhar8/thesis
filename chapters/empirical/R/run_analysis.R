library("tidyverse")
library("reshape2")
library("ca")
library("vcd")
library("RVAideMemoire")
library("lintr")

source("get_fish_data.R")
source("get_proportions.R")
source("graphing.R")
source("stats.R")

data <- read_csv('../data/ovm_weighted.csv',skip = 2)
names(data) <- tolower(names(data))
str(data)
data.grouped <- group_by(data, site, depth, net, type, location)
summary(data)

synodontids <- getFishData(data,"pre_synodontidae","fle_synodontidae","pos_synodontidae")
synodontids_t <- mutate(synodontids, transform_value = round(value*1000000))
serranids <- getFishData(data,"pre_serranidae","fle_serranidae","pos_serranidae")
pomacentrids <- getFishData(data,"pre_pomacentridae","fle_pomacentridae","pos_pomacentridae")
mullids <- getFishData(data,"pre_mullidae","fle_mullidae","pos_mullidae")
labrids <- getFishData(data,"pre_labridae","fle_labridae","pos_labridae")
scarids <- getFishData(data,"pre_scaridae","fle_scaridae","pos_scaridae")
bothids <- getFishData(data,"pre_bothidae","fle_bothidae","pos_bothidae")
triglids <- getFishData(data,"pre_triglidae","fle_triglidae","pos_triglidae")
scorpids <- getFishData(data,"pre_scorpaenidae","fle_scorpaenidae","pos_scorpaenidae")



labrids.sum <- summarise(labrids, count = sum(value))
performChiSqTest(labrids.sum)
printLineGraphForFish(labrids.sum,"Labrid")
printMosaicGraphForFish(labrids.sum)

scarids.sum <- summarise(scarids, count = sum(value))
performFishersTest(scarids.sum)
printLineGraphForFish(scarids.sum,"Scarid")
printMosaicGraphForFish(scarids.sum)

bothids.sum <- summarise(bothids, count = sum(value))
performFishersTest(bothids.sum)
printLineGraphForFish(bothids.sum,"Bothid")
printMosaicGraphForFish(bothids.sum)

scorpids.sum <- summarise(scorpids, count = sum(value))
performFishersTest(scorpids.sum)
printLineGraphForFish(scorpids.sum,"Scorpid")
printMosaicGraphForFish(scorpids.sum)

serranids.sum <- summarise(serranids, count = sum(value))
performFishersTest(serranids.sum)
printLineGraphForFish(serranids.sum,"Serranid")
printMosaicGraphForFish(serranids.sum)

synodontids.sum <- summarise(synodontids_t, count = sum(transform_value))
performFishersTest(synodontids.sum)
performChiSqTest(synodontids.sum)
printLineGraphForFish(synodontids.sum,"Synodontid")
printMosaicGraphForFish(synodontids.sum)

mullids.sum <- summarise(mullids, count = sum(value))
performFishersTest(mullids.sum)
printLineGraphForFish(mullids.sum,"Mullid")
printMosaicGraphForFish(mullids.sum)

pomacentrids.sum <- summarise(pomacentrids, count = sum(value))
performFishersTest(pomacentrids.sum)
printLineGraphForFish(pomacentrids.sum,"Pomacentrid")
printMosaicGraphForFish(pomacentrids.sum)

matrix <- acast(pomacentrids.sum,depth ~ stage,value.var="count")
ca(matrix)

library(MASS)
answer <- loglm(formula=~depth+stage, data=pomacentrids.sum)
deviance(answer)
