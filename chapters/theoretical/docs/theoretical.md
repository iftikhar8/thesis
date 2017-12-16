# CHAPTER 3: Comparing the influence of the implementation of different larval behavioural strategies on connectivity patterns in biophysical dispersal models

# Introduction

## Background on modelling

Biophysical dispersal models are popular tools to understand the influence of various processes (both physical and biological) on marine dispersal, and thus the underlying marine ecosystems.


# Behaviours affecting connectivity

Orientation CITE different examples


# Ontogenetic vertical migration strategies


# Do implementation choices matter?

Examples of (daily, timestep, stage?)

## What have people done before



## Significance
 - know what to look for when modelling
 - comparison of many behaviours - is it specific to the area (australia coastline)


Aims:
1. To investigate how connectivity patterns are affected by the implementation of different forms of larval behaviour, specifically-- diel vertical migration (DVM), ontogenetic vertical migration (OVM), and horizontal orientated swimming

[Combine these aims]
2. To investigate how different implementation methods of ontogenetic vertical migration affect connectivity dispersal patterns.
3. To investigate how different parametrisation strategies (reflecting species differences) of ontogenetic vertical migration effect connectivity patterns.


The more I think about it…I think you might want to combine these two aims.  So the aim would be to evaluate the impact of OVM implementation strategy, method and parametrization, on patterns.  You know there is likely to be differences in patterns based on parameters used, i.e. for different speices…but the issue is that there are also different ways of implementing OVM in a biophysical model. You want to know how much patterns are affected by the method as opposed to parameters to know if this is important.  If variability is mainly from params, that’s fine and good to know…but if its from method then we need to suggest what is best and probably be doing the same thing.

Hypothesis:
1. Compared to passive practice, should reduce SR, increase LR, reduce DD
  i. Comment on effect of different types of flow regimes on the differences?
2. The patterns should differ as places within the water column change the currents the larvae are moved by
3. There should be an effect, but is predicted to be minimal [Why?]

# Methods

## Model development

[Worth building a flow diagram?]

The biophysical dispersal model— Zooplankton Interconnections and Source-Sink Observation Utility (ZISSOU, v1.1.3 [github.com/shawes/zissou])—is an individual-based model (IBM) developed in accordance with recommendations from the “Manual of recommended practices for modelling physical-biological interactions during fish early life” (ICES 2009).  Movement of particles within the model is forced by offline oceanographic current data but can be influenced by larval  behavioural traits parameterised using probability distributions capturing known biological variability. The system was designed for high-performance, high customisation, and platform independence; written in the Scala programming  language (v2.12.4) using parallel libraries.

### Physical sub-model

ZISSOU accesses ocean circulation data as network common data forms (NetCDF); self-describing, machine-independent data formats. The data can be accessed either using locally stored files or using the Open-source Project for a Network Data Access Protocol (OPeNDAP; http://www.opendap.org). This project took advantage of Java NetCDF software libraries developed by UCAR/Unidata [http://doi.org/10.5065/D6H70CW6]. The ocean data must be in an Arakawa-A or Arakawa-B grid structure [CITE arakawa 97]. This version of ZISSOU utilises only the 3-dimensional velocity fields, and not other environmental variables such as salinity or temperature.

Runge-Kutta fourth-order integration (RK4) is used to move the particle through space and time, calculating a weighted average of four increments using the chosen model time-step (@eq:rk4). The velocity at any given position in space is interpolated using a tri-cubic interpolation scheme on the hydrodynamic model, such that the velocity for a given particle in the oceanographic space is interpolated from neighbouring grids using 64 points (4 x 4 x 4). If this is not possible, for example due to boundary conditions, trilinear interpolation using 8 points (2 x 2 x 2) is substituted.

$$\overrightarrow{v_{t+h}} = \overrightarrow{v_{t}} + \rfrac{1}{6} (k_{1} + 2k_{2} + 2k_{3} + k_{4})h$${#eq:rk4}
$$k_{1} = f(x_{t},y_{t})$$
$$k_{2} = f(x_{t} + \rfrac{1}{2}h, y_{t} + \rfrac{1}{2}k_{1}h)$$
$$k_{3} = f(x_{t} + \rfrac{1}{2}h, y_{t} + \rfrac{1}{2}k_{2}h)$$
$$k_{4} = f(x_{t} + h, y_{t} + k_{3}h)$$

The integrated velocity vector (*v~t+h~*), at time *t* and time step *h* is calculated using the weighted average of the four seperate interpolations (*k~1~, k~2~, k~3~, k~4~*), which interpolate the velocities at the beginning of the time step, two midpoint approximations and the end of the time step. The interpolation function *f(x,y)* calculates the velocities using the tri-cubic interpolation function described above.

To model the natural turbulent effect of ocean systems in a 3D stochastic model, ZISSOU uses a random displacement mechanism []@eq:turb; CITE Brickman & Smith 2002]

$$D_{(t+1)} = D_{(t)} + \overrightarrow{v} +\Delta{t} + \sqrt{\frac{2K}{\Delta{t}}Q}$${#eq:turb}

The displacement (D) is calculated using the velocity vector (v) from the hydrodynamic model, the time step (Δt), the eddy diffusivity (K) and a random number from a Gaussian distribution with a mean of zero (Q).

Psuedo-random numbers are generated in the model using a Mersenne Twister algorithm, WELL44497b [CITE Paennon]. The seed for the random number generator is an optional parameter of the model to allow for reproducibility of results if needed.

## Biological sub-model

Biological traits are specified using a configurable XML file as input to the model. The biological model implements many biological processes that are considered to be important for marine larval dispersal, e.g. the spawning period, pelagic larval duration, and vertical migration (@tbl:biological-params). The pelagic larval duration is specified by the length of the duration in days. It can be either random (used in a combination with a settlement competency window) that allows the larvae to settle when they find suitable habitat, or a fixed duration and larvae settle if they are over suitable habitat at the end of the duration. The settlement competency window is a specified time period when the larvae become competent to settle, it can be specified as number of days or a developmental stage. Spawning sites are given as GPS locations, with the release period, clutch size of eggs, interval of spawned clutches, and the release depth all options to specify for the marine species being modelled. The developmental ages for fish larvae (preflexion, flexion, postflexion) can all be specified by giving a mean and standard deviation of days, which is assigned to individual larvae at birth using a gaussian distribution (if no standard deviation is specified, the mean is the value). For pelagic eggs, a preflexion developmental age specifies the time of hatching. Settlement sites are represented as GIS polygons within the model, using point in polygon algorithms to determine if larvae are over settlement sites. The polygons are supplied as input in the Shapefile format, a common geospatial vector data format specified by the Environmental Systems Research Institute [Esri; CITE ESRI]. Mortality is specified as a daily rate, which is applied at midnight each day in the system using a random number generator, similar to many other connectivity studies [CITE mortality studies].

: The options for the biological and behavioural traits that can be specified in the biological sub-model. {#tbl:biological-params}

| Trait  | Option  |  Description | Input type
| --|---|--
| Pelagic larval duration  | Random  | Larvae are allowed to settle at a suitable habitat if they are within a given settlement competency window | Days (mean and standard deviation for gaussian distribution)
|  |  Fixed |  Seconds
| Settlement competency window  | Fixed | Time the larvae become  |  Days
| Development age   | Preflexion  | The time the larvae start the preflexion stage (hatching from eggs). If this value is greater than 0, the first period the larvae are considered to be pelagic eggs. | Days (mean and s.d. for gaussian distribution)
|  | Flexion  | The age the flexion developmental period starts  | Days (mean and s.d. for gaussian distribution))
|  | Postflexion  | the age the postflexion period starts  | Days (mean and s.d. for gaussian distribution)
| Spawning sites  | Location  | The latitude and longitude of where to release the eggs  | GPS Coordinates
|  | Depth  | The depth the eggs are spawned  |  Metres
|  | Clutch size | The number of eggs to spawn  |  Real number
|  | Period  | The period to release the eggs over  | Date range
|  | Interval  | The number of days to release the eggs over the release period  | Days (1 = daily, 7 = weekly)
| Settlement sites  | n/a  | The sites of settlement for the larvae given as GIS polygons  | Shapefile
| Mortality  | Linear  | The number of larvae to be randomly killed each day  | Rate (day~-1~)
| Vertical migration  | Diel  | Vertically migrates the particles twice daily at sunset and sunrise  | Probabilities of the larvae being found at user specified depths during the day or at night
|  | Ontogenetic  | Vertically migrates the fish based on their ontogenetic stage  | Probabilities of the larvae being found at user specified depths at each of the developmental stages (hatching, preflexion, flexion, and postflexion)
| Settlement sensory distance  |   |  The distance at which a larvae can sense a reef to settle  | Kilometres
| Olfactory distance  |   | The distance at which a larvae can sense a reef and orientate towards it | Kilometres
| Horizontal swimming  | Critical swimming speed  |  | ms~-1~
|  | In situ swimming speed  |   |  ms~-1~
|  | Swimming endurance  |   | ms~-1~

In addition to biological traits, several behavioural traits for larvae are able to be included in the model, e.g. orientated horizontal swimming, vertical migration, and the ability to sense suitable settlement sites (@tbl:biological-params). Vertical migration can be implemented as either diel or ontogenetic vertical migration. Both are based around the probability of being in a specific depth range based on either the time of day (i.e. night or day), or their ontogenetic stage (@fig:ovm-example). The vertical position was changed by applying a probability distribution function to determine too which depth the larvae moved. For diel vertical migration this probability distribution function was applied one hour before sunset or sunrise using an approximation calculated using the current latitude / longitude of the larvae. For ontogenetic vertical migration the timing of migration can be chosen from migrating when the next developmental stage is reached, migrating once a day or migrating at every time step (with given constraints of movement).

![Example of ontogenetic vertical migration input for a fish than migrates downwards with ontogeny, where the probabilities at different depths are specified for each stage, and must add up to one for each developmental stage](chapters/theoretical/figs/ovm-example.png){#fig:ovm-example}

The fish larvae can be given a settlement sensory distance which allows them to discover a reef and settle if they come within the specified distance, acting as psuedo-behaviour for cues such as vision, hearing or olfaction [CITE Leis 2007; Kingsford]. The nearest point on the reef polygon is identified and then the distance is compared to the larva's current position. Olfactory distance works similar to settlement sensory, allowing the larvae to orientate towards the nearest settlement habitat if it is within the specified distance. The horizontal swimming speed is calculated using known critical swimming speeds, the *in situ* swimming potential and the swimming endurance of the larvae at postflexion (@eq:swim). Critical swimming speed is a measure of the swimming capacity of the larvae, the *in situ* swimming speed is a measure of larval fish swimming in the ocean by divers, and endurance is a measure of how long they can keep swimming before tiring [CITE Leis 2006]. Therefore the speed they are allowed to swim is constructed from their maximum possible speed, proportioned to what they have been seen swimming, and tempered by their known endurance. The speed is added to both the *u* and *v* velocities after applying stochasticity (@eq:u; @eq:v). Fish can swim, orientated to the nearest habitat, if they find themselves within a user configured olfactory range.

$$s = U_{crit}S_{p}E_{p}$${#eq:swim}

$$u^{\prime} = u + X_{[0,1]} \times s \times \cos(\theta)$${#eq:u}
$$v^{\prime} = v + X_{[0,1]} \times s \times \sin(\theta)$${#eq:v}

*U~crit~* is the critical swimming speed (ms~-1~), *S~p~* is the *in situ* swimming potential (%), and *E~p~* is the endurance potential (%) of the fish larvae. \theta is the angle of direction to a settlement site if it was sensed within the olfactory distance.

## Model configuration

### Study location

The New South Wales (NSW) coastline (2,137 km) was divided into approximately 17 equally sized regions (approximately 125 km each). Rock reef patches along the NSW coastline were identified using freely available benthic data obtained from NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). Within each NSW sub-region, four rocky reef patches were chosen as spawning sites for the larvae spanning the region, and larvae were released within a GPS location of a reef patch. Weekly releases of 1000 larvae at each patch were spawned over the period July 2007 to June 2008. In total 3.5 million larvae were released over the release period. No mortality was applied, therefore only measuring potential dispersal. Larvae were allowed to settle to the identified rocky reef patches or benthic habitat patches marked as unknown, as unmapped patches could be potential rocky reef settlement sites.

![The 17 regions (each containing four rock reef patches) used to spawn the reef fish larvae along the coastline of New South Wales, Australia](chapters/theoretical/figs/release-sites.png){#fig:release-sites.png}

### Physical sub-model

The oceanographic circulation model used was BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], a hindcast model based on the Ocean Forecasting Australia Model (OFAM). BRAN is a data-assimilating model that aims to resolve mesoscale eddies in 3-dimensions, at the scale of 10 km in the horizontal (0.1° latitude and longitude) and 5-10 m vertically (15 depth bins between 0-105 m). The model consists of mean daily current velocities, sea-level anomaly, sea-surface temperature, and salinity over the period January 1993 to September 2012. An eddy diffusivity value (K) of 300 ms^-1^ was used, as per similar studies in the region [CITE condie, chiswell]. The time-step of the model was 2 hours.

### Biological sub-model

To populate the parameters of the model, we used characteristics of temperate rocky reef fish, and chose Pomacentridae due many species distribution along the NSW coast, and their high representation in the literature [CITE example]. The literature on early-life fish histories is biased towards tropical and sub-tropical species, therefore where values for temperate Pomacentridae were not found, information of tropical larvae was utilised (@tbl:bio-params). The individual larvae only settled if at the end of their pelagic larval duration they were able to sense a settlement reef patch (within the settlement sensory distance of suitable settlement habitat). The larvae were spawned in the preflexion stage, assumed a species with benthic eggs which is common for Pomacentridae. The larvae were given a sensory zone of 10 km with which to sense settlement reef habitat, a generous example of sensory abilities used to help overcome the coarse 10 km of the oceanographic model resolution (@tbl:bio-base). The oceanographic model often had no velocities near the coast (due its inherent grid structure), limiting the ability of fish to settle on some reefs. To orientate and swim towards a reef, the fish were given a olfactory range of 15 km, which was 5km longer than the settlement sensory ability.

: Biological features of the Pomacentridae larvae that were used in every model run of the experiment {#tbl:bio-base}

| Biological feature          | Value            | Reference          |
|-----------------------------|------------------|--------------------|
| PLD                         | 18.3 (±1.5) days |[CITE Wellington & Victor] |
| Preflexion age              | 0 days           | [CITE Murphy 2007] |
| Flexion age                 | 5 (±0.5) days    |                    |
| Postflexion age             | 8 (±0.5) days    |                    |
| Settlement sensory distance | 10 km            |                    |


In order to address the first aim of evaluating the influence of different behaviours on connectivity patterns I ran a series of models with different behaviours; diel vertical migration (DVM; @tbl:dvm), ontogenetic vertical migration (OVM; @tbl:scenarios-ovm - Pomacentridae strategy), and orientated horizontal swimming (OHS; @tbl:orientate) implemented. Each behaviour (and combination of congruent behaviours) was compared to a base case of completely passive transport (@tbl:scenarios-behaviour).

: Orientated horizontal swimming (OHS) parameterisation, used in the swimming equation described above {#tbl:orientate}

| OHS feature  | Value        | Reference                   |
|------------------------------|--------------|-----------------------------|
| Olfactory distance           | 15 km        |                             |
| *U~crit~*                    | 0.463 ms~-1~ | [CITE Leis and Fisher 2006] |
| *In situ* swimming potential | 0.25         |                             |
| Endurance                    | 0.50          |                             |

: Diel vertical migration (DVM) values {#tbl:dvm}

| DVM      | Depth (m) | Proportion  |
|-------|-----------|:------------|
| Day   | 0-50      | 0.1         |
|       | 51-100    | 0.9         |
| Night | 0-50      | 0.8         |
|       | 51-100    | 0.2         |

[I think its worth defining a term here to describe these things…here’s my stab at it.  You should use the term in chapter 3 as well.  Then use it above when describing OVM and, if you make the figure I suggested, use it there as well.  This will allow you have a term which essentially describes this multi-dimensional parameter which is fundamental to the OVM behavior in the model.]

The second aim, to assess the impact on connectivity of using different ontogenetic vertical migration parameters was addressed by conducting model runs using proportional depth stage abundance profiles which represented the seven fish families studied in Chapter 3 (@tbl:scenarios-ovm). The ontogenetic vertical migration was implemented such that the larvae moved when they reached their next ontogenetic stage (based on developmental time). Lastly, in order to explore the impact of the OVM implementation strategy on connectivity patterns I compared three different methods of ontogenetic vertical migration (@tbl:scenarios-ovm). The first method migrated the larvae using the given probabilities after each time-step. Due to the short time-period, larvae were restricted from moving upwards or downwards 25 m. In the the second method the larvae performed vertical migration every 24 hours in the system, and the last method migrated a larva when it moved to the next ontogenetic stage.

: Depth stage profiles for each of the seven fish families evaluated in Chapter 3. Values represent the proportional (within a stage) abundance of each stage within each of three depth ranges (surface: 0-5 m; mixed layer: 5-50 m; deep layer: 51-100 m) and are used to parameterise models run to address Aim 2 of this study. {#tbl:scenarios-behaviour}

| Scenario | DVM | OVM | OHS |
|:--------:|:----:|:---:|:-----------:|
|    1     |  —   |  —  |      —      |
|    2     | Yes  |  —  |      —      |
|    3     |  —   | Yes |      —      |
|    4     |  —   |  —  |     Yes     |
|    5     | Yes  | Yes |      —      |
|    6     | Yes  |  —  |     Yes     |
|    7     |  —   | Yes |     Yes     |
|    8     | Yes  | Yes |     Yes     |


: Proportional depth stage abundance profiles for each of the seven fish families evaluated in Chapter 3. Values represent the proportional (within a stage) abundance of each stage within each of three depth ranges (surface: 0-5 m; mixed layer: 5-50 m; deep layer: 51-100 m) and are used to parameterise models run to address Aim 2 of this study. {#tbl:scenarios-ovm}

| Scenario      | Depth (m) | Preflexion | Flexion | Postflexion |
|---------------|-----------|:-----------|:--------|:------------|
| Labridae      | 0-5       | .275       | .250    | .350        |
|               | 6-50      | .650       | .550    | .400        |
|               | 51-100    | .075       | .200    | .250        |
| Mullidae      | 0-5       | .500       | .500    | .650        |
|               | 6-50      | .475       | .375    | .225        |
|               | 51-100    | .025       | .125    | .125        |
| Pomacentridae | 0-5       | .400       | .350    | .050        |
|               | 6-50      | .500       | .500    | .850        |
|               | 51-100    | .100       | .150    | .100        |
| Scaridae      | 0-5       | .600       | .350    | .300        |
|               | 6-50      | .300       | .425    | .500        |
|               | 51-100    | .100       | .225    | .200        |
| Scorpaenidae  | 0-5       | .425       | .100    | .100        |
|               | 6-50      | .525       | .650    | .500        |
|               | 51-100    | .050       | .250    | .400        |
| Serranidae    | 0-5       | .450       | .275    | .100        |
|               | 6-50      | .450       | .350    | .300        |
|               | 51-100    | .100       | .375    | .600        |
| Synodontidae  | 0-5       | .150       | .250    | .150        |
|               | 6-50      | .550       | .550    | .650        |
|               | 51-100    | .300       | .200    | .200        |

[Should I turn this into graph? Feel like its horrible to read]

: The three different scenarios for implementing ichthyoplankton ontogenetic vertical migration (OVM) in the biophysical dispersal model {#tbl:scenarios-impl}

| Scenario | OVM migration timing                            |
|----------|-------------------------------------------------|
| 1        | Time step migration |
| 2        | Daily migration                                 |
| 3        | Stage migration           |

## Data analysis

[I would explain how you generally did you comparisons…like how nMDS would be used to compare different model runs as well as the general summary stats that you used.  Its worth spending some time to address the question of how one actually compares connectivity patterns.But then I would be really clear what you did specifically for each aim.  I think for you this would be:]

[Univariate comparisons of all the metrics you summarized. You have no variance here so can just do qualitative comparisons.
[Multivariate comparisons where each region is the replicate and connectivity to other regions is response variable, nMDS of raw sett numbers, nMDS of relative (to base case) numbers]

[For stats, you want to evaluate the effect of the model but as each was only run once, there is no replication.  One option is to treat regions as replicates, as you did, then you have n=17 per model.  So the response variable is tot sett from a region and you have model as repeated measures factor.  This should help account for the inherent variability amongst regions to tell  you if there is still an effect of model.]

[As discussed, this is super confusing.  Talk about replicates and response variables. And now reading what you’ve written, I’m not sure this is the same as what we discussed on the phone.  In traditional multivariate analysis, the sites are the replicates and you said that was regions for you, no models.  So now I’m not clear what you did. But I think what you have written here is probably the way to go. I think of a sample in multivariate analysis as having a fingerprint…which are the values of all the multiple response variables.  For you the sample is the model and the fingerprint of each model is the settlement for each region.]


Each scenario was measured using a connectivity matrix, with rows as source regions (*i*) and columns are settlement regions (*j*), and each value (*~i,j~*) is the proportion of larvae that were spawned at (*i*) and settled at (*j*) over the release period. Settlement was considered over the total release period.

To compare the connectivity matrices of different scenarios, I used the ordination data reduction technique non-metric multidimensional scaling (NMDS) with the Bray-Curtis dissimilarity measures and a square root transform to account for highly abundant areas. It allowed for multivariate analysis, comparing the proportion of settlement from source regions to settlement regions.

For each scenario we standardised it by dividing by a base model run within the aim (Passive, Pomcentridae OVM, and Stange abudnance), a scenario included in every model.

Non-metric multidimensional scaling (NMDS) ordination was used to assess settlement patterns between models and within scenarios using Bray-Curtis dissimilarities measures with a square root transform. For the analysis comparing scenarios, models were treated as sites and settlement regions were treated as species. Regions were used instead of reefs due to non-convergence when analysing the reefs. To compare the differences of models within scenarios, source regions corresponded to sites and settlement regions corresponded to species. NMDS was conducted using the r package *vegan* [CITE]. Correspondence analysis using the r package *ca* [CITE] was performed to see which settlement regions were contributing to the differences seen in dispersal settlement patterns. Cluster analysis of the behaviour and OVM strategies scenarios was performed used a Bray-Curtis dissimilarity measure, and the average-link clustering method. To tests for differences between models with each scenario, PERMANOVA using the adonis function within the r package *vegan* was used; with release regions as sites and settlement regions as each species, grouped by the models within a scenario. In addition to ordination, using the sites (natal reefs) and species (settlement reefs) model, settlement site richness and Shannon-Weiner diversity of settlement was measured. The connectivity metrics of self-recruitment, local retention, settlement success and dispersal distance (**FORMAT see definitions**) were calculated for each scenarios. One-way ANOVAs were used to test for differences between models within each scenario, and Student-Newman-Keuls (SNK) post-hoc tests were used to make comparisons between groups if the ANOVA was significant. The R package *ConnMattTools* [CITE] was used to obtain connectivity metrics, and the package *agricolae* [CITE] was used to perform SNK tests. To test differences in connectivity patterns for each of the models with a scenario, we used a graph theory analyses. Connectance, the proportion of the links between natal and settlement sites in a graph compared to the theoretical maximum, was used to compare the models. The r package *igraph* was used for this analysis.

# Results

The behavioural scenario contained the most dissimilar patterns of settlement (@fig:nmds; @fig:nmds-behaviour). The models containing orientation behaviour were driven by increased settlement at the regions NSW13, NSW14, NSW16 (@fig:behaviour-ca). Diel migration produced increased settlement at the region NSW01, while OVM and no behaviour had higher settlement at the region NSW15. The scenario of different methods of OVM implementation was more dissimilar than the scenario of different OVM strategies (@fig:nmds). OVM strategies were bunched together, while the OVM methods appeared to be equally dissimilar to each other. The differences in settlement patterns of the OVM strategies were driven by small changes in settlement at each of the regions (@fig:nmds-ovm; @fig:ovm-ca). The clearest difference was at NSW01, where Scaridae had increased settlement success. The scenario of different OVM methods showed similar patterns to the OVM strategies, again with NSW01 driving the clearest differences with increased settlement for stage based migration (@fig:nmds-implementation; @fig:implementations-ca). There were no differences between the settlement patterns for the behaviour scenario (F~(1,7)~=0.045; r^2^=0.00; p > 0.05), or OVM strategies (F~(1,6)~=0.005; r^2^=0.00; p > 0.05), or the OVM methods (F~(1,2)~=0.037; r^2^=0.00; p > 0.05).

## Behaviours

The largest dissimilarity of larval behaviour settlement patterns was the model with DVM behaviours (@fig:cluster a). The rest of the behaviour scenarios were grouped into behaviour with orientation and behaviour without orientation. DVM coupled with orientation, and DVM coupled with both OVM and orientation had the least dissimilar connectivity patterns. These two models also had the highest diversity index, and DVM with orientation had the highest settlement sites richness (@tbl:metrics). In addition, these models, along with orientation, and orientation with OVM, had the highest proportions of connectance. Larvae with no behaviour had the lowest settlement site richness. DVM produced the lowest settlement site diversity, and DVM by itself and couple with OVM produced the lowest connectance values between settlement sites. The lowest values of self-recruitment occurred in the no behaviour and OVM models, 12% lower than DVM. Local-retention was maximised when orientation was included, the highest local retention rates occurring when DVM, OVM and orientation were all included in the model. The lowest mean local retention rate of 35% occurred when no behaviour was included. The settlement success of no behaviour and diel models were significantly lower (≥ 20%; p \< 0.05) than the settlement success of the model combining OVM and orientation (@tbl:metrics). No behaviour and OVM produced the longest patterns of dispersal, with the mean dispersal over 140km before settlement. Combing DVM wiht orientation reduced the dispersal distance by 35% compared to no behaviour.

## Ontogenetic vertical migration strategies

The variation within each metric was small between each ontogenetic vertical migration strategy. The cluster analysis for the OVM strategies had Mullidae as the out-group (i.e. most dissimilar; @fig:cluster b). The two strategies with the most similar patterns of settlement were Pomacentridae and Synodontidae. Mullidae is the single OVM strategy implemented with over 50% of its larvae in the surface waters at each stage. Staying in the surface waters produced the equal highest settlement site richness, the highest settlement success, and the longest dispersal distance. Scorpaenidae and Serranidae have OVM strategies that keep them deep 51-100m waters the most. This migrating deeper strategy produced the highest settlement diversity, self-recruitment, and local retention.

## Ontogenetic vertical migration methods

Differences in implementation produced more variation amongst the metrics than the OVM strategies. Migrating the larvae as they move between stages produced the highest richness, diversity, and connectance (@tbl:metrics). Stage based migration also increased self-recruitment and local retention. Changing the  larvae ontogenetic position at a daily rate increased the mean dispersal distance by 7%. Changing the OVM position at the end of each 2-hour model time-step produced the lowest values in each metric except for self-recruitment, which peaked at 58%.

### Figures and tables

![nMDS ordination plot using Bray-Curtis dissimilarities between the different settlement patterns for each scenario within each of the treatments; behaviour, OVM strategy, OVM method (2D stress = 0.03)](chapters/theoretical/figs/nmds-regions.png){#fig:nmds}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the behaviour scenario; ellipses denote regions (2D stress = 0.04)](chapters/theoretical/figs/phase1-all-nmds.png){#fig:nmds-behaviour}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the different ontogenetic vertical migration strategies for reef fish (2D stress = 0.04)](chapters/theoretical/figs/phase2-all-nmds.png){#fig:nmds-ovm}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the different ontogenetic vertical migration methods (2D stress = 0.04)](chapters/theoretical/figs/phase3-all-nmds.png){#fig:nmds-implementation}

![Cluster analysis of the behaviour (a) and ontogenetic vertical migration (OVM) strategies, using a Bray-Curtis dissimilarity measure and clustered using the average-link method.](chapters/theoretical/figs/cluster.png){#fig:cluster}

![Correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the behaviour scenarios](chapters/theoretical/figs/phase1-ca.png){#fig:behaviour-ca}

![Correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the ontogenetic vertical migration strategies](chapters/theoretical/figs/phase2-ca.png){#fig:ovm-ca}

![Correspondence analysis of the total settlement patterns to each region along NSW for each of the different implementation methods (stage-based, daily, and time-step) of ontogenetic vertical migration in the biophysical dispersal model](chapters/theoretical/figs/phase3-ca.png){#fig:implementations-ca}


: Metrics measured for each modelling scenario grouped by the three aims; behaviour (Passive = no behaviour, Diel = diel vertical migration, OVM = ontogenetic vertical migration; Diel = diel vertical migration, Or = orientated horizontal swimming), OVM strategy, and OVM method. Richness and the Shannon-Weiner diversity were measured using the settlement reefs as a proxy for species. Connectance (%) is a measure of describing the proportion of all links between the natal and settlement sites that are realised. The mean self-recruitment (%), local-retention (%), settlement success (%) and dispersal distance (km) are metrics of connectivity. ^a-b^Means values in a column without a common superscript letter are different using ANOVA with SNK post-hoc tests (p \< 0.05), not superscript letter in a column means the ANOVA was not significant. **Bold** denotes the highest metric value per scenario and *italics* denote the lowest value. {#tbl:metrics}

| Scenario     | Model         | Richness | Diversity | Connectance | Self-recruitment | Local retention | Settlement success | Dispersal distance |
|--------------|---------------|----------|-----------|-------------|------------------|-----------------|--------------------|--------------------|
| Behaviour    |               |          |           |             |                  |                 |                    |                    |
|              | Passive       | *262*    | 4.69      | 0.44        | *0.58*           | *0.35*          | 0.57^a^            | **144.8**          |
|              | Diel          | 266      | *4.67*    | *0.43*      | **0.70**         | 0.41            | *0.55^a^*          | 107.5              |
|              | OVM           | 264      | 4.75      | 0.45        | *0.58*           | 0.39            | 0.65^ab^           | 143.5              |
|              | Or            | 267      | 4.80      | **0.46**    | 0.61             | 0.45            | 0.70^ab^           | 105.6              |
|              | Diel+OVM      | 267      | 4.76      | *0.43*      | 0.62             | 0.40            | 0.62^ab^           | 129.6              |
|              | Diel+Or       | **270**  | **4.85**  | **0.46**    | 0.65             | 0.49            | 0.74^ab^           | *94.5*             |
|              | Diel+OVM+Or   | 269      | **4.85**  | **0.46**    | 0.65             | **0.50**        | 0.74^ab^           | 94.6               |
|              | OVM+Or        | 269      | 4.84      | **0.46**    | 0.62             | 0.47            | **0.77**^b^        | 103.3              |
| OVM Strategy |               |          |           |             |                  |                 |                    |                    |
|              | Labridae      | **265**  | 4.75      | **0.45**    | 0.58             | 0.39            | 0.65               | 142.9              |
|              | Mullidae      | **265**  | 4.71      | **0.45**    | 0.56             | 0.38            | **0.66**           | **150.4**          |
|              | Pomacentridae | 264      | 4.75      | **0.45**    | 0.58             | 0.39            | 0.65               | 143.5              |
|              | Scaridae      | 263      | 4.76      | 0.44        | 0.60             | 0.39            | 0.64               | 138.8              |
|              | Scorpaenidae  | 263      | 4.78      | 0.44        | 0.61             | **0.40**        | 0.63               | 134.9              |
|              | Serranidae    | 263      | **4.79**  | **0.45**    | **0.62**         | **0.40**        | 0.63               | 131.0              |
|              | Synodontidae  | **265**  | 4.76      | **0.45**    | 0.59             | 0.39            | 0.64               | 141.1              |
| OVM Method   |               |          |           |             |                  |                 |                    |                    |
|              | Time-step     | 263      | 4.69      | 0.44        | **0.58**         | 0.35            | 0.57               | 144.4              |
|              | Daily         | 263      | 4.72      | **0.45**    | 0.53             | 0.38            | **0.70**           | **154.5**          |
|              | Stage         | **264**  | **4.75**  | **0.45**    | **0.58**         | **0.39**        | 0.65               | 143.5              |




# Discussion

- shows the influence of the currents

## Phase 1

- orientation / diel / ovm all produced specific patterns
- orientation seemed to have to strongest effect
  - perhaps it means the implementation was to strong?
- surprising that OVM was so similar to no behaviour.

- What have behaviours found before?


Orientation has been seen to increase settlement success, inreasing as the size of olflactor window increases (Staatermann 2010)

## Phase 2

- Surprised that they weren't more different
- Perhaps the coarseness meant that such an effect

- Species that spend more time towards the surface dispersal further than species that spend more time lower in the water column. The wind driven currents at the surface are stronger, producing a greater dispersal distance. It appears this added dispersal kernel led to increased settlement success of the larvae.
-

## Phase 3

- The different methods of ontogenetic implementation did change the settlement distributions of the larvae.
- Therefore careful consideration needs to be made about how larval behaviours are implemented in dispersal models.


## Limitations

## Future directions

More empirical data of fish ability to orientate - cues perhaps.



## Conclusion

- include larval behaviours if there is known information about the species
