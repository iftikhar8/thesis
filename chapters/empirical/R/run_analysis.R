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

# MANOVA on the ichyplankton OVM data
data <- read_csv('../data/ichthyoplankton_ovm.csv')
names(data) <- tolower(names(data))
data.tidied <- data %>% gather(key = "taxa", value = "count", -site, -depth, 
         -net, -type, -location, -fixed_in,-tow_volume) %>%
        separate(col=taxa, into=c("ontogeny","taxa"))

# Weight the data to 250m3
data.weighted <- data.tidied %>% filter(tow_volume > 0) %>%
  mutate(weighted_count = count/tow_volume*250)

total <- summarize(group_by(data.weighted, taxa, ontogeny), total=sum(weighted_count))
   
# Classification Tree
fit <- rpart(ontogeny ~ taxa + depth + type + location,
             method="class", data=data.weighted)
       
      
# Transform data
ggplot(data.weighted, aes(x=taxa, y=log10(weighted_count + 0.5))) + 
  geom_boxplot() + 
  coord_flip()

ggplot(data.weighted, aes(x=log10(weighted_count0.5), group=taxa)) + 
  geom_line(stat="density")

data.transformed <- mutate(data.weighted, transformed_count = log10(weighted_count))

ggplot(data.transformed, aes(x=ontogeny, y=depth, fill=transformed_count)) + 
  geom_tile() + 
  facet_grid(~taxa) +
  scale_fill_viridis() + 
  theme_minimal()



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
