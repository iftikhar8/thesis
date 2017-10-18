# Breakdown of the statistical analysis

## Experimental aims

The aim was to see if developmental stage or body length of fish larvae is a predictor of their position in the water column.

## Experimental design

The experiment was conducted on a research vessel, and all data was measured in between Brisbane and Sydney (one location was about 100km below Brisbane, the second location was closer to Forster). As such I didn't design the experiment, but piggy backed onto another experiment and thus it was constrained.

The factors chosen:

- Location: They were at different latitudes
- Feature: The water type was either from coastal source water or from inside an eddy
- Station: 3 stations within a feature (there were 4, but because of a mix of rough conditions and faulty equipment, I removed the fourth for each feature to balance out the missing values)
- Depth: The three depths the fish were caught at
- Stage: (Ex. 1 only) The three stages of development (ontogeny) the fish were measured at


I measured the data for 7 different families of fish.


| Independent factors | Type   | Levels | Nested | Values                             |
|:--------------------|:-------|:-------|:-------|:-----------------------------------|
| location            | random | 2      | no     | NA                                 |
| feature             | fixed  | 2      | no     | coastal, eddy                      |
| station             | random | 3      | yes    | NA                                 |
| depth               | fixed  | 3      | no     | 0, 25, 75                          |
| stage               | fixed  | 3      | no     | pre-flexion, flexion, post-flexion |

Unit of replication = 2 (net)

| Dependent factor | Transformation | Units  |
|:-----------------|:---------------|:-------|
| Concentration    | log(x+1)       | 250m^3^ |
| Length           | NA             | mm     |

Transformation as per Underwood for concentration data. Also x250 to get concentrations at 250m^3. The idea of increasing it was get large enough values so the logarithm transformation was monotomic. Plotting the mean and sd before and after the log transformation.

## Analysis

### Too many zeros
At first the plan was to do a standard ANOVA (or MANOVA) on concentration and length, however, I ran into the issue that there were a lot of zeros. Fish are not everywhere so I didn't have good coverage for each stage at each depth.

Therefore after consulting books and the internet, I came up with the solution to use a generalised linear model, but split it into two, one using all the non-zero data and the other using presence absence data.

### Random?
I also was suspicious of using a random factor for location and sites with levels of 2 and 3 respectively - especially when we are talking about measure points in the ocean hundreds of km apart.

Therefore I decided to drop the idea of location and stations and have a site factor, but describe each site using environmental variables of temperature, salinity & dissolved oxygen. I used a correlation function in R (corrr) to determine that these were not correlated.

### Unbalanced data
For the length data, the number of samples used to get each mean was unbalanced, sometimes in a net you might catch 200 fish of the species I was interested in and sometimes 20.

### Model

Each model was repeated for a fish family, producing 14 analyses.

#### Experiment 1

The stage data, example given using the family labridae.

```
data.ontogeny.labrid.all <- filter(data.ontogeny, family == "labridae")
data.ontogeny.labrid.nonzero <- filter(data.ontogeny.labrid.all, conc > 0)

qqp(data.ontogeny.labrid.nonzero$conc, "lnorm")

glm.presence.labrid <- glm(presence ~ feature * depth * stage + temperature + salinity + dissolved_oxygen, family=binomial, data=data.ontogeny.labrid.all)

glm.nonzero.labrid <- glm(conc ~ feature * depth * stage + temperature + salinity + dissolved_oxygen, family=gaussian(link="log"), data.ontogeny.labrid.nonzero)

summary(glm.presence.labrid)
summary(glm.nonzero.labrid)
```

#### Experiment 2

The length data

```
data.length.labrid <- filter(data.length, family == "labridae")

qqp(data.length.labrid$total_length, "lnorm")
qqp(log(data.length.labrid$total_length), "norm")

lm.length.labrid <- lm(log(total_length) ~ feature * depth + temperature + salinity + dissolved_oxygen,  data=data.length.labrid)

summary(lm.length.labrid)
```
