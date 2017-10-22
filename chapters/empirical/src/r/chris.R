#                                INTRODUCTION ------------------------
# __TO DO ALL CODE --------------------------------------------------------
# Use which() when subsetting, not logical factors as NA's break them
#
# Density Plotting Function
# Estimates the PDF
# And of course the area under is 1
# Try the following bandwidths (default is not recommended)
#     SJ-ste (more extreme) Sheather and Jones
#	SJ-dpi



# __TABLE OF CONTENTS -----------------------------------------------------
# Assign options, global variables, etc
# Import data and have a quick look




# __TO DO THIS CODE -------------------------------------------------------

# Merging Data
# Data Cleaning
# Project Specific Outlier Identification and Data Cleaning
# Exploratory Data Analysis (EDA)
# Analysis
# Modelling
# Exploratory and Predictive




# __STYLE -----------------------------------------------------------------
# Section Heading
# ~ HEADING
#   ~ CAPITALS
#   ~ Rstudio Section Heading
# ~ BEFORE
#   ~ 6 spaces before
#   ~ a heading with lots of ---
#   ~ a heading with .
# ~ AFTER
#   ~ 2 spaces after
#
# N Subsection Heading
# ~ HEADING
#   ~ CAPITALS 
#   ~ 2N __ before heading text
#   ~ Rstudio Section Heading
# ~ BEFORE
#   ~ 4 spaces before (unless after SEciton heading then 2)
# ~ AFTER
#   ~ 0 spaces
#
# Code section                    
# ~ HEADING
#   ~ CAPITALS 
# ~ BEFORE
#   ~ 2 spaces before
# ~ AFTER
#   ~ 0 spaces
#
# General Code Comments / Minor Code section
# ~ HEADING
#   ~ lowercase 
# ~ BEFORE
#   ~ 1 space before
# ~ AFTER
#   ~ 0 spaces
#
# functions
# ~ lowercase, so they easily show up
#
# NAMING CONVENTIONS
# ~ Each Major Heading in Data Cleaning starts with assigning a dataframe to its name, the final data has the same name as this but with the .final
#   suffix e.g. rename section starts with  rename <- any.final and finishes
#   with rename.final <- rename
# 
# ~ To insure code compatability always use the same names when coping
#   this code to other scripts.




# __VERSION HISTORY -------------------------------------------------------
#	v




# __TEMPLATE VERSION HISTORY ----------------------------------------------
#   v3.4    ~ Cleans up comments so they flow better in Rstudio
#           ~ Commented out code we rarely use
#           ~ Insured the default final name in the cleaning section isn't commented out
#
#   v3.1 ~ Various minor things 
#        ~ Adds Flatliner code that removes flatliners
#        ~ Improves duplication code so it finds and removes all duplications, not just those after the first instance
#        ~ Moves Checking Section around a bit and splits data sets into "checking" and "cleaning"
#        ~ Adds Variable Creation section to the end of the Cleaning section.
#        ~ Moved unique ID creation so its the first thing we do. This allows data merging if we need to merge after we create DOI.




# .------------------------------------------------------------------------
#                   ASSIGN OPTIONS, GLOBAL VARIABLES, ETC -----------------
# __SET OPTIONS -----------------------------------------------------------
# Error: how to handle functions errors
options(error=recover) # straight to debugger
# options(error=dump.frames) # have to call debugger

# Warnings:
options(warnings=1) # warnings are issued as soon as possible as opposed to when the top level prompt is returned (default)

# Multithreading
getMKLthreads()



# __CLEAR MEMORY -------------------------------------------------
# MUST BE DONE EVERYTIME AT THE START OF CODE.
# This prevents previous runs objects being accidently used, which is very dangerous since it often goes unnoticed as no error code is produced. This is one of the most common mistakes.
rm(list=ls()) # Remove unneccessary objects (in this call everything)
ls()
gc() # Garbage collection, this can increase available memory after a call to rm




# __SET MEMORY PARAMETERS -------------------------------------------------
# 64 bit R automatically used all memory possible, however 32 bit R does not and we often need to increase the memory limit.
# NB: EMACS uses 32 bit R by default. If  64 bit R is required use M-X R [TAB] [TAB]
?'Memory-limits' # Help on memory limits
memory.limit(size=4095) # Set Memory Limit to Max for 32 bit R. 
memory.limit(size=NA) # report memory limit
memory.limit(size=TRUE) # maximum amount of memory obtained from the OS is reported
memory.limit(size=FALSE) # amount currently in use




# __LOAD LIBRARIES --------------------------------------------------------
# unknownR tutorial
# library(unknownR) # as of today not available for R3.1
# unk()
# learn()


# DATA MANAGEMENT
# PLYR HAS tools for splitting, applying and combining data that are quicker than the usual apply functions
# PYLR FUNCTIONS
#   ~ rbind.fill() ~ rbinds unequal vectors and replaces missing columns with NA
# Auto install packages if not in library
if (!require("plyr"))
    install.packages("plyr")

library(plyr)

# DPYLR FUNCTIONS
#   ~ bind_rows(), bind_cols(), combine() ~ more effecient rbind
library(dplyr)


# LOOK INTO. Handles codeframes, labels, etc much better by using a data.set object instead of a data.frame. Readily converts to a data.frame??
# A better way to load SPSS files since it works when the foreign package does not.
library(memisc)


options(java.parameters = "-Xmx16340m") # this line bumps up the RAM available to rJava to 16GB since xlsx is dependent and this reduces the chance of GC errors. Note that this will break computers if they don't have at least this much RAM, so be careful!!
library(xlsx) 


# DESCRIPTIVE
library(gmodels) # CrossTable (similar to SAS Freq)


# LINEAR MODELS
library(lme4)
library(multcomp)
library(car)


# MISC
library(reshape2)
library(foreign)
library(MASS)
library(Hmisc)
# library(sos)
# library(vegan)
library(lattice)
# library(gplots)
library(lme4)


# SPECIFIC TO THIS CODE



# __SET WORKSPACE ---------------------------------------------------------
# Remember to replace the \ with either a / or a \\. (this has something to do with R using 'c-style escape sequences' eg \n = newline see ?quotes for a full list
setwd("c:\\data\\Egnyte Local Cloud\\Shared\\clients\\misc\\syd uni\\projects\\Steven Hawes Phytoplankton")





# . -----------------------------------------------------------------------
#	IMPORT DATA AND HAVE A QUICK LOOK ---------------------------------------
# # __ IMPORT R DATA AND/OR WORKSPACE ------------------------------------------
load("data/ontogenydf.RData")
raw <- ontogeny_df


# __HAVE A QUICK LOOK AND VISUAL SCAN -------------------------------------
names(raw)

# CHECK: Class and types of vectors if a data.frame
class(raw)
str(raw, list.len=length(raw))

# CHECK: dim of original file = 2016 (includes headings) by 33
# CHECK RESULT:dim of imported file = 2016 by 33
dim(raw)


# CHECK: QUICK VISUAL LOOK
# CHECK RESULT: 

# All if small enough
str(raw)
edit(raw)


# All if small enough
clean <- raw


# . -----------------------------------------------------------------------
# PROJECT SPECIFIC OUTLIER IDENTIFICATION AND DATA CLEANING ---------------
# Look at the data in the rawest form possible. This will usually be to plot the data by order, or ID collected. This can often find some data entry mistakes or operator error mistakes since the data is often entered in order by different operators.




# __CHECK: PRELIMINARY LOOK AT DATA DISTRIBUTIONS AND IDENTIFICATION OF POSSIBLE OUTLEIRS ---------------------------------------------------------
# CHECK RESULT:
str(clean)
names(clean)

clean.nona <- clean[!is.na(clean$conc),]
dim(clean)
dim(clean.nona)
dim(clean) - dim(clean.nona)

min(clean.nona$conc)
max(clean.nona$conc)


# CHECK DISTRIUTION
outlier <- function(data, first, last, nrow){
    if (missing(nrow)) nrow<-3
    if (missing(last)) last <- first
    ncol <- 2 #    if (missing(ncol)) ncol<-2
    
    for (i in first:last){
        if (i == first)  index <- 1 else index <- index + 1;
        if ((index)%%(nrow)==1) {
            windows()
            par(mfrow=c(nrow,ncol))
        }
        plot(data[,i], main= names(data[i]))
        
        plot(density(data[,i], na.rm=TRUE), names(data[i]))
        rug(data[,i])
    }
}


# # To PDF
# outlierpdf <- function(data, first, last, nrow){
#     if (missing(nrow)) nrow <- 3
#     if (missing(last)) last <- first
#     ncol <- 2 #    if (missing(ncol)) ncol<-2
# 
#     pdf()
#     for (i in first:last){
#         if (i == first)  index <- 1 else index <- index + 1;
#         if ((index)%%(nrow)==1) {
#             par(mfrow=c(nrow,ncol))
#         }
#     	plot(data[,i], main= names(data[i]))
# 
#         plot(density(data[,i], na.rm=TRUE), names(data[i]))
#  	rug(data[,i])
#     }
#     dev.off()
#     graphics.off() # Might be required to make it work
# }


# # For easy pasting into Word doco's
# outlierjpg <- function(data, first, last, nrow){
#     if (missing(nrow)) nrow <- 3
#     if (missing(last)) last <- first
#     ncol <- 2 #    if (missing(ncol)) ncol<-2
# 
#     for (i in first:last){
#         if (i == first)  index <- 1 else index <- index + 1;
#         if ((index)%%(nrow)==1) {
#             jpeg(paste("graph",i,".jpeg", sep=""))
#             par(mfrow=c(nrow,ncol))
#         }
#     	plot(data[,i], main= names(data[i]))
# 
#         plot(density(data[,i], na.rm=TRUE), names(data[i]))
#  	rug(data[,i])
#     }
#     graphics.off()
# }


ls()
names(clean)
outlier(clean.nona[30], 1, 1, 2)
graphics.off()

names(clean.nona)
clean2 <- melt(clean.nona[c(5,30)])


# # ____DENSITY PLOTS OVERLAYED----
# # Useful in identiyfing outlier distributions
# names(data)
# # densityplot(~Column1+Column2, data=myData)
# # densityplot(~Speedmph, data=data, groups=DogID, ref=TRUE, plot.points=FALSE, auto.key = list(space = "right"))
# densityplot(~Speedmph, data=data, groups=DogID, ref=TRUE, plot.points=FALSE)
# 
# 
# # # Identify  outlier distributions
# table(data$DogID)
# levels(data$DogID)
# densitycheck1 <- data[(data$DogID %in% levels(data$DogID)[75:77]),] # adjust levels seen until we figure out which is the outlier
# densityplot(~Speedmph, data=densitycheck1, groups=DogID, ref=TRUE, plot.points=FALSE)
# 
# densitycheck2 <- data[!(data$DogID %in% levels(data$DogID)[77]),] # remove suspected outlier to confirm it is
# densityplot(~Speedmph, data=densitycheck2, groups=DogID, ref=TRUE, plot.points=FALSE)
# 
# 
# # # Why are they weird?
# names(data)
# levels(data$DogID)[77]
# describe(data[(data$DogID %in% levels(data$DogID)[77]),23])
# describe(data[data$DogID %in% c("FIDog07"),23])



# __EXAMINATION OF POSSIBLE OUTLIERS AND REMOVE THEM IF NECCESSARY --------
# names(clean)
# subset(clean, liking.initial > 100)
# clean2 <- clean[-238,]
# dim(clean)
# dim(clean2)


# # CHECK FACTORS AND CATEGORICAL VARIABLES
# CHECK RESULT:
# names(clean2)
# str(clean2)
# # This apply function is not ideal since it won't print a warning message if labels are duplicated and removes levels with no data. Find a way to get these (use SiQ Liquor 2014 Aus as test data). d_ply might be better
# apply(clean2[c(3,4,7:40)], 2, table, useNA="always")


# # CHECK: PRELIMINARY LOOK AT DATA DISTRIBUTIONS AND IDENTIFICATION OF POSSIBLE OUTLEIRS
# # CHECK RESULT:

# names(clean2)

# # check format
# str(clean2)

# # check min and max
# min <- apply(clean2[c(5,6,41:length(clean2))],2,min, na.rm=TRUE)
# max <- apply(clean2[c(5,6,41:length(clean2))],2,max, na.rm=TRUE)

# # CHECK:?
# min(min)
# max(min)

# # CHECK: Does it make sense that any maxs are 0?
# min(max)
# max(max)


# # CHECK DISTRIUTION
# names(clean2)
# names(clean2)
# outlier(clean2, 1, length(clean2))
# graphics.off()



# # QUICKER FUNCTION

# # Mean for variables (quicker than apply)
# yb <- rowMeans(y)

# # Std for variables (quicker than apply)
# s <- sqrt(rowSums((y-yb)^2)/(n-1))



# __FINAL DATA SET --------------------------------------------------------

data <- clean.nona
save(data, file=paste("Steve Hawes DATA v1.Rdata",sep=""))






# . -------------------------------------------------------------------------
#	EXPLORATORY DATA ANALYSIS (EDA) -----------------------------------------
#
# Done since Extreme influential outliers can have too great an influence on the model often biasing the model towards that sensory attribute AND making that sensory attributes co-efficient inaccurate.

# USE GGPLOT2 AND START USING VIOLEN PLOTS and DOT BOX PLOTS
# Boxplots if response continuous and predictor discrete, or vice versa
# Scatterplot if both continuous
# Table if both discrete.

# Try out scattplot from car package, gives boxplots, non-para lines and SE's




# __DATA -----------------------------------------------------------
# ____IMPORT DATA -----------------------------------------------------------
paste(project," DATA v",version," ",date,".Rdata",sep="")
load("Steve Hawes DATA v1.Rdata")
names(data)
str(data, list.len=length(data))
dim(data)




# __UNIVARIATE --------------------------------------------------
# ____DESCRIBE TABLES DATA --------------------------------------------------
# use bubble plot from http://www.ats.ucla.edu/stat/r/dae/melogit.htm
# 
# # ____DESCRIBE CONTINUOUS DATA ----------------------------------------------
# describe.continuous <- function(data, first, last, nrow, ncol){
#     if (missing(nrow)) nrow<-3
#     if (missing(ncol)) ncol<-3
#     
#     for (i in first:last){
#         if (i == first)  index <- 1 else index <- index + 1;
#         if ((index)%%(nrow*ncol)==1) {
#             windows()
#             par(mfrow=c(nrow,ncol))
#         }
#         plot(density(data[,i], na.rm=TRUE), names(data[i]))
#         rug(data[,i])
#     }
# }
# 
# names(data)
# describe.continuous(data,4,6,1,3)
# graphics.off()
# 


# ____DESCRIBE CONTINUOUS DATA SPLIT BY A FACTOR USING BOXPLOTS -------------
# Do before CI to insure data is symetric enough we can invoke the CLT and the SE is accurate.

# Used when we have multiple responses and predictors rather than needing to define multiple calls to the base plot function. If there is only 1 of each then it simply plots a single set in the top left corner (which can be fixed by changing nrow=ncol=1).
describe.boxplot <- function(response, predictor, nrow, ncol){
    if (missing(nrow)) {nrow <- 3}
    if (missing(ncol)) {ncol <- 2}
    if (is.data.frame(response)==FALSE) {response <- data.frame(response)}
    if (is.data.frame(predictor)==FALSE) {predictor <- data.frame(predictor)}

    for (j in 1:length(response)){
        for (i in 1:length(predictor)){
            if (i == 1)  index <- 1 else index <- index + 1;
            if ((index)%%(nrow*ncol)==1) {
                windows()
                par(mfrow=c(nrow,ncol))
            }

                ## boxplots
                plot(factor(predictor[,i]), response[,j], xlab=names(predictor[i]), ylab=names(response[j]))
        }
    }
}

names(data)
response <- data[30]
predictor <- data[5]
windows()
describe.boxplot(response, predictor, 1, 1)
graphics.off()





# . -----------------------------------------------------------------------
#	ANALYSIS ----------------------------------------------------------------
#
# A series of simple models are used with 1 predictor tested in each one. If neccessary blocking can be included.
#
# As this is analysis we will often model each predictor seperatly and thereby avoid any issues with multicollinearity and its effects on SS and parameters. If we do need to have multiple predictors in an analysis then we need to be very careful of multicollinearity and its effect on our conclusions and hypothesis tests.
#
# If its modelling and prediction we're after than we need to carefully asses the data for multicollinearity and decide how we are going to account for it. Keeping in mind that it doesn't effect the prediction but does effect our intepretation of the parameters. This is one reason it may be worth keeping all variables in prediction models but not interpretative models.
#
# Mulitcollinearity also inflates the SE. 
#
# For more info read modelling manual.
# RESPONSE = CONTINUOUS use lm.
#            Regression if predictors continuous, ANOVA if discrete.
#
# RESPONSE = DISCRETE use logistic or multinomial.
#            If predictors continuous can test each predictor with a 1way ANOVA
#            with response as predictors.
#            If predictors discrete chi-squared.
#
# If both continuous but we have problems analysing we can try:
#    1) Convert 1 to categorical and try boxplot/ANOVA/median test
#    2) Convert both to categorical and try table/chi-squared. This always works!
#    3) Turn response into a count and model using poisson (refer to modelling manual on how)

str(data)
data.ontogeny.labrid.all <- data[data$family == "labridae",]
hist(data.ontogeny.labrid.all$conc)
str(data.ontogeny.labrid.all)
dim(data.ontogeny.labrid.all)

# add obs for (OLRE) random model later to account for over dispersion
data.ontogeny.labrid.all.old <- data.ontogeny.labrid.all
names(data.ontogeny.labrid.all)
data.ontogeny.labrid.all$obs <- 1:nrow(data.ontogeny.labrid.all)
str(data.ontogeny.labrid.all$obs)
print(data.ontogeny.labrid.all$obs)
plot(data.ontogeny.labrid.all$obs)


# number of 0's
test0 <- data.ontogeny.labrid.all$conc==0
table(test0)
prop.table(table(test0))*100


# TEST for zero inflation in Poisson Count data  -----------------------
# from http://www.flutterbys.com.au/stats/tut/tut11.7a.html
# Compare the number of zeros in the data to the number of zeros that would be expected from a Poisson distribution with a mean equal to the mean count of the data.

# proportion of 0's in the data1
(test.0i.actual <- table(data.ontogeny.labrid.all$count == 0))
test.0i.actual/sum(test.0i.actual)

# proportion of 0's expected from a Poisson distribution
# better to use proportion with large N since it will be stable. count of 0's at low n will not be.
(mu <- mean(data.ontogeny.labrid.all$count))
cnts <- rpois(1000, mu)
(test.0i.theory <- table(cnts == 0))
test.0i.theory/sum(test.0i.theory)

# Are they they same?
test.0i.actual/sum(test.0i.actual)*100
test.0i.theory/sum(test.0i.theory)*100


# Could formally test this by either a proportion test or a chi-squared.
# With Chi-squared not sure if we need to generate data of the same N as the actual data, might not need to since chi-squared might account for this. Note that if we do need to be very careful at small N since # of 0 may vary from realisation to realisation. So we might need to test a few iterations.



# Poisson
# Not 100% sure offset is defined right!!
labrid <- glm(count ~ offset(log(volume)) + feature * depth * stage + temperature + salinity + dissolved_oxygen, family=poisson(link="log"), data.ontogeny.labrid.all)
summary(labrid)
anova(labrid, test="Chisq")

# CHECK: Use SS Pearson residuals / residual DF as this has much less bias (MASS sec 7.5 pg 209)
# CHECK RESULT: OK, as expected since residual deviance << DF
(dispersion.parameter <- sum(residuals(labrid, type="pearson")^2)/ labrid$df.residual)


# Poisson with observation level random effect (OLRE) to account for overdispersion using SITE-----
# Not 100% sure offset is defined right!!
?lme4
?glmer

# Use site as Observation level effect.
labrid.random <- glmer(count ~ offset(log(volume)) + feature * depth * stage + temperature + salinity + dissolved_oxygen + (1|site), family=poisson(link="log"), data=data.ontogeny.labrid.all,  method="ML")
summary(labrid.random)
anova(labrid.random, test="Chisq")


# __CHECK by calculating dispersion parameter ----------------------
# Ben Bolker function from http://bbolker.github.io/mixedmodels-misc/glmmFAQ.html#testing-for-overdispersioncomputing-overdispersion-factor. REFER to that for disclaimers around it being approximate
# The following function works for (at least) lme4 and glmmADMB .

overdisp_fun <- function(model) {
  # ## number of variance parameters in 
  # ## an n-by-n variance-covariance matrix
  # vpars <- function(m) {
  #   nrow(m)*(nrow(m)+1)/2
  # }
  # model.df <- sum(sapply(VarCorr(model),vpars))+length(fixef(model))
  # rdf <- nrow(model.frame(model))-model.df
  
  ## Alternative (newer) number of variance parameters https://github.com/lme4/lme4/issues/220
  rdf <- df.residual(model)
  
  ## Test
  rp <- residuals(model, type="pearson")
  Pearson.chisq <- sum(rp^2)
  prat <- Pearson.chisq/rdf # Dispersion. chris added
  pval <- pchisq(Pearson.chisq, df=rdf, lower.tail=FALSE)
  c(chisq=Pearson.chisq,ratio=prat,rdf=rdf,p=pval)
}


# Original rdf
# OUTPUT
# chisq         ratio           rdf             p 
# 1.165457e+03  4.588411e+00  2.540000e+02 1.269003e-116 
overdisp_fun(labrid.random)


# NEW rdf
# OUTPUT
# chisq         ratio           rdf             p 
# 1.165457e+03  4.588411e+00  2.540000e+02 1.269003e-116
overdisp_fun(labrid.random)


# Poisson with observation level random effect (OLRE) to account for overdispersion using OBSEERVATION-----
# Not 100% sure offset is defined right!!
?lme4
?glmer


# Use site as Observation level effect.
labrid.random.obs <- glmer(count ~ offset(log(volume)) + feature * depth * stage + temperature + salinity + dissolved_oxygen + (1|obs), family=poisson(link="log"), data=data.ontogeny.labrid.all,  method="ML")
summary(labrid.random.obs)
anova(labrid.random.obs, test="Chisq")


# __CHECK by calculating dispersion parameter ----------------------
# Ben Bolker function from http://bbolker.github.io/mixedmodels-misc/glmmFAQ.html#testing-for-overdispersioncomputing-overdispersion-factor. REFER to that for disclaimers around it being approximate
# The following function works for (at least) lme4 and glmmADMB .

overdisp_fun <- function(model) {
  # ## number of variance parameters in 
  # ## an n-by-n variance-covariance matrix
  # vpars <- function(m) {
  #   nrow(m)*(nrow(m)+1)/2
  # }
  # model.df <- sum(sapply(VarCorr(model),vpars))+length(fixef(model))
  # rdf <- nrow(model.frame(model))-model.df
  
  ## Alternative (newer) number of variance parameters https://github.com/lme4/lme4/issues/220
  rdf <- df.residual(model)
  
  ## Test
  rp <- residuals(model, type="pearson")
  Pearson.chisq <- sum(rp^2)
  prat <- Pearson.chisq/rdf # Dispersion. chris added
  pval <- pchisq(Pearson.chisq, df=rdf, lower.tail=FALSE)
  c(chisq=Pearson.chisq,ratio=prat,rdf=rdf,p=pval)
}


# NEW rdf
overdisp_fun(labrid.random.obs)


# __ CHECK by comparing to nmodel with no random effect
# shows observation level is better than site random effect. And both are better then no random effect.
anova(labrid.random, labrid, test='Chisq')
anova(labrid.random.obs, labrid, test='Chisq')
anova(labrid.random, labrid.random.obs, test='Chisq')



## Negative Binomial
# Not 100% sure offset is defined right!!
labrid.nb <- glm.nb(count ~ offset(log(volume)) + feature * depth * stage + temperature + salinity + dissolved_oxygen, data.ontogeny.labrid.all)
summary(labrid.nb)
anova(labrid.nb, test="Chisq")

# CHECK: Use SS Pearson residuals / residual DF as this has much less bias (MASS sec 7.5 pg 209)
# CHECK RESULT: OK, as expected since residual deviance << DF
(dispersion.parameter <- sum(residuals(labrid.nb, type="pearson")^2)/ labrid$df.residual)


## SUITABLE EDA



