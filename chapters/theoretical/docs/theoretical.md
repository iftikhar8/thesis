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

2. To investigate how different implementation methods and strategies (reflecting species differences) of ontogenetic vertical migration affect connectivity dispersal patterns.



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

ZISSOU accesses ocean circulation data as network common data forms (NetCDF); self-describing, machine-independent data formats. The data can be accessed either using locally stored files or using the Open-source Project for a Network Data Access Protocol (OPeNDAP; http://www.opendap.org). This project took advantage of Java NetCDF software libraries developed by UCAR/Unidata [http://doi.org/10.5065/D6H70CW6]. The ocean data must be in an Arakawa-A or Arakawa-B grid structure [CITE arakawa 97]. This version of ZISSOU utilises only the 3-dimensional velocity fields, and no other environmental variables such as salinity or temperature.

Runge-Kutta fourth-order integration (RK4) is used to move the particle through space and time, calculating a weighted average of four increments using the chosen model time-step (@eq:rk4). The velocity at any given position in space is interpolated using a tri-cubic interpolation scheme on the hydrodynamic model, such that the velocity for a given particle in the oceanographic space is interpolated from neighbouring grids using 64 points (4 x 4 x 4). If this is not possible, for example due to boundary conditions, trilinear interpolation using 8 points (2 x 2 x 2) is substituted.

$$\overrightarrow{v_{t+h}} = \overrightarrow{v_{t}} + \frac{1}{6} (k_{1} + 2k_{2} + 2k_{3} + k_{4})h$${#eq:rk4}
$$k_{1} = f(x_{t},y_{t})$$
$$k_{2} = f(x_{t} + \frac{1}{2}h, y_{t} + \frac{1}{2}k_{1}h)$$
$$k_{3} = f(x_{t} + \frac{1}{2}h, y_{t} + \frac{1}{2}k_{2}h)$$
$$k_{4} = f(x_{t} + h, y_{t} + k_{3}h)$$

The integrated velocity vector (*v~t+h~*), at time *t* and time step *h* is calculated using the weighted average of the four seperate interpolations (*k~1~, k~2~, k~3~, k~4~*), which interpolate the velocities at the beginning of the time step, two midpoint approximations and the end of the time step. The interpolation function *f(x,y)* calculates the velocities using the tri-cubic interpolation function described above.

To model the natural turbulent effect of ocean systems in a 3D stochastic model, ZISSOU uses a random displacement mechanism [@eq:turb; CITE Brickman & Smith 2002]

$$D_{(h+1)} = D_{(h)} + \overrightarrow{v} +\Delta{h} + \sqrt{\frac{2K}{\Delta{h}}Q}$${#eq:turb}

The displacement (D) is calculated using the velocity vector (v) from the hydrodynamic model, the time step (Δh), the eddy diffusivity (K) and a random number from a Gaussian distribution with a mean of zero (Q).

Psuedo-random numbers are generated in the model using a Mersenne Twister algorithm, WELL44497b [CITE Paennon]. The seed for the random number generator is an optional parameter of the model to allow for reproducibility of results if needed.

## Biological sub-model

Biological traits are specified using a configurable XML file as input to the model. The biological model implements many biological processes that are considered to be important for marine larval dispersal, e.g. the spawning period, pelagic larval duration, and vertical migration (@tbl:bio-params). The pelagic larval duration is specified by the length of the duration in days. It can be either random (used in a combination with a settlement competency window) that allows the larvae to settle when they find suitable habitat, or a fixed duration and larvae settle if they are over suitable habitat at the end of the duration. The settlement competency window is a specified time period after which the larvae become competent to settle, it can be specified as number of days or a developmental stage. Spawning sites are given as GPS locations (latitude and longitude in decimal degrees), with spawning time and frequency, the spawning depth in the water column, and the number of larvae to spawn, are all options to specify for the marine species being modelled. The particles seeded in the model are referred to as larvae, but that can simulate pelagic eggs through the inclusion of a specific age stage. Developmental stages (preflexion, flexion, postflexion) are based on a description of the mean (± standard deviation) age (in days) of larvae of each stage. From this input, stage transition ages are assigned to individual larvae at birth using a gaussian distribution (if no standard deviation is specified, the mean is the value). Where modelling a pelagic egg stage is necessary, a preflexion developmental age specifies the time of hatching.

: Summary of the biological and behavioural traits that can be specified in the biological sub-model. {#tbl:bio-params}

| Trait  | Options  |  Description | Input type
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
| Settlement sensory distance  |   |  The distance at which a larva can sense a reef to settle  | Kilometres
| Olfactory distance  |   | The distance at which a larva can sense a reef and orientate towards it | Kilometres
| Horizontal swimming  | Critical swimming speed (*U~crit~*)  | The speed at which a fish can swim before it fatigues as measured in a laboratory setting | ms~-1~
|  | In situ swimming speed  | The swimming speed of the fish larvae recorded by divers *in situ* as a proportion of the *U~crit~* |  Proportion
|  | Swimming endurance  | The proportion of time the fish can spend swimming  | Proportion

Settlement sites are represented as GIS polygons within the model, using point in polygon algorithms to determine if larvae are over settlement sites. The polygons are supplied as input in the Shapefile format, a common geospatial vector data format specified by the Environmental Systems Research Institute [Esri; CITE ESRI]. Larval mortality can be included in the model, specified as a daily rate, which is applied at midnight each day in the system using a random number generator, similar to many other connectivity studies [CITE mortality studies]. Note however for the simulations described in this chapter, which are focused on simply comparing patterns of realised connectivity, no mortality was applied. Several behavioural traits for larvae are able to be included in the model including orientated horizontal swimming, vertical migration, and the ability to sense suitable settlement sites (@tbl:bio-params). Vertical migration can be implemented as either diel or ontogenetic vertical migration. Both are based on the probability of being in a specific depth range based on either the time of day (i.e. night or day), or their ontogenetic stage (@fig:ovm-example). The vertical position was changed by applying a probability distribution function to determine to which depth the larvae moved. For diel vertical migration this probability distribution function was applied one hour before sunset or sunrise using an approximation calculated using the current latitude / longitude of the larvae. For ontogenetic vertical migration, the timing of migration can be chosen from three strategies, migrating vertically when the next developmental stage is reached, vertically migrating once a day or vertically migrating at every time step (with chosen constraints of movement). All stages keep the proportions of vertical migration consistent for each development stage. This allows for modelling vertical behaviour where fish larvae change position in the water column constantly or slowly migrate with age.

![Example of ontogenetic vertical migration input for a fish than migrates downwards with ontogeny, where the probabilities of occurrence at different depths are specified for each stage, and must add up to one for each developmental stage](chapters/theoretical/figs/ovm-example.png){#fig:ovm-example}

The fish larvae can be given a settlement sensory distance which allows them to discover a site and settle if they come within the specified distance, acting as pseudo-behaviour for cues such as vision, hearing or olfaction [CITE Leis 2007; Kingsford]. If there is no settlement site then the larvae keeps moving. The nearest point on the reef polygon is identified and then the distance is compared to the larva's current position. Olfactory distance works similar to settlement sensory, allowing the larvae to orientate towards the nearest settlement habitat if it is within the specified distance. The horizontal swimming speed is calculated using known critical swimming speeds, the *in situ* swimming potential and the swimming endurance of the larvae at postflexion (@eq:swim). Critical swimming speed is a measure of the swimming capacity of the larvae, the *in situ* swimming speed is a measure of larval fish swimming in the ocean by divers, and endurance is a measure of how long they can keep swimming before tiring [CITE Leis 2006]. Therefore, the speed they are allowed to swim is constructed from their maximum sustained swimming speed, proportioned by speeds observed in the wild, and tempered by their known endurance. The speed is added to both the *u* and *v* velocities after applying stochasticity (@eq:u; @eq:v). Fish can swim, orientated to the nearest habitat, if they find themselves within a user configured olfactory range.

Assuming this is your own design, you probably need to justify this a bit more. So why not use observed speeds alone? How does this value compare to the others?

$$s = U_{crit}S_{p}E_{p}$${#eq:swim}

$$u^{\prime} = u + X_{[0,1]} \times s \times \cos(\theta)$${#eq:u}
$$v^{\prime} = v + X_{[0,1]} \times s \times \sin(\theta)$${#eq:v}

*U~crit~* is the critical swimming speed (ms~-1~), *S~p~* is the *in situ* swimming potential (%), and *E~p~* is the endurance potential (%) of the fish larvae. \theta is the angle of direction to a settlement site if it was sensed within the olfactory distance.

## Model configuration

### Study location

The New South Wales (NSW) coastline (2,137 km) was divided into approximately 17 equally sized regions (approximately 125 km each). Rocky reef patches were identified using freely available benthic data obtained from NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). Within each sub-region, four rocky reef patches (approximately X m^2^ each) from across the sub-region were chosen as spawning sites. Larvae were released weekly from the centre of each spawning site in batches of  1000 over the period July 2007 to June 2008. In total 3.5 million larvae were released. Larvae were allowed to settle to the identified rocky reef patches or benthic habitat patches marked as unknown, as unmapped patches could be potential rocky reef settlement sites.

![The 17 regions (each containing four rock reef patches) used to spawn the reef fish larvae along the coastline of New South Wales, Australia](chapters/theoretical/figs/release-sites.png){#fig:release-sites.png}

### Physical sub-model

The oceanographic circulation model used was BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], a hindcast model based on the Ocean Forecasting Australia Model (OFAM). BRAN is a data-assimilating model that aims to resolve mesoscale eddies in 3-dimensions, at the scale of 10 km in the horizontal (0.1° latitude and longitude) and 5-10 m vertically (15 depth bins between 0-105 m). The model consists of mean daily current velocities, sea-level anomaly, sea-surface temperature, and salinity over the period January 1993 to September 2012. An eddy diffusivity value (K) of 300 ms^-1^ was used, as per similar studies in the region [CITE condie, chiswell]. The time-step of the model was 2 hours.

### Biological sub-model

To populate the parameters of the model, we used characteristics of temperate rocky reef fish, and chose Pomacentridae due many species distribution along the NSW coast, and their high representation in the literature [CITE example]. The literature on early-life fish histories is biased towards tropical and sub-tropical species, therefore where values for temperate Pomacentridae were not found, information of tropical larvae was utilised (@tbl:bio-base). The individual larvae only settled if at the end of their pelagic larval duration they were able to sense a settlement reef patch (within the settlement sensory distance of suitable settlement habitat). The larvae were spawned in the preflexion stage, assumed a species with benthic eggs which is common for Pomacentridae. The larvae were given a sensory zone of 10 km with which to sense settlement reef habitat, a generous example of sensory abilities used to help overcome the coarse 10 km of the oceanographic model resolution (@tbl:bio-base). The oceanographic model often had no velocities near the coast (due its inherent grid structure), limiting the ability of fish to settle on some reefs. To orientate and swim towards a reef, the fish were given a olfactory range of 15 km, which was 5km longer than the settlement sensory ability.

: Biological features of the Pomacentridae larvae that were used in every model run of the experiment {#tbl:bio-base}

| Biological feature          | Value            | Reference                  |
|-----------------------------|------------------|----------------------------|
| PLD                         | 18.3 (±1.5) days | [CITE Wellington & Victor] |
| Preflexion age              | 0 days           | [CITE Murphy 2007]         |
| Flexion age                 | 5 (±0.5) days    |                            |
| Postflexion age             | 8 (±0.5) days    |                            |
| Settlement sensory distance | 10 km            |                            |


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

Each scenario was measured using a connectivity matrix, with rows as source regions (*i*) and columns are settlement regions (*j*), and each value (*~i,j~*) is the proportion of larvae that were spawned at (*i*) and settled at (*j*) over the release period. Settlement was considered over the total release period, and therefore there was no variation, only allowing for qualitative measures. Several univariate measures for comparisons between connectivity matrix were used; settlement site richness (the number of reef settled) and Shannon-Weiner diversity of settlement (using number of reefs and total larvae settled), the connectivity metrics of self-recruitment, local retention, settlement success and dispersal distance (**FORMAT see definitions**), and connectance (the proportion of the links between natal and settlement sites in a graph compared to the theoretical maximum). The mean of the metrics across source regions (n = 17), were compared across models using a one-way ANOVA to test for the effects of model parameters. Student-Newman-Keuls (SNK) post-hoc tests for pairwise comparisons if ANOVAs were significant. The R package *ConnMattTools* [CITE] was used to obtain connectivity metrics, The r package *igraph* was used for obtaining measures of connectance, and the package *agricolae* [CITE] was used to perform SNK tests. To compare the connectivity matrices of the different models for each aim, I used the ordination data reduction technique non-metric multidimensional scaling (NMDS). I used the Bray-Curtis dissimilarity measures to get distance matrices and applied a square root transform to account for highly abundant areas of settlement. It allowed for multivariate analysis, comparing the proportion of settlement from source regions to settlement regions. To account for the strong effect of oceanographic currents on settlement, within each aim the raw data was standardised by the passive movement connectivity matrix, which contains no behaviour that is not included in all of the models (settlement sensory ability), and is assumed to be the settlement produced by the currents alone. To test for differences in patterns of settlement between models, PERMANOVA tests were conducted using the *adonis* function in the r package *vegan* [CITE vegan]. Correspondence analysis using the r package *ca* [CITE] was used to see which sites were contributing to the most differences amongst the settlement patterns. Cluster analysis for each scenario was also used to test for groups of similar models, again using a Bray-Curtis dissimilarity measure and the average-link clustering method.

# Results

Figures should be cited in the order in which they appear in the text.

You have an issue here in that youi have these specific aims which seem separate but then the first thing you do is compare across them. This comparison is good but you need to rethink how you’ve laid out your analysis then.

Maybe the way to go here is to restate the aim a bit more integrated.  So you are looking to evaluate the impact on connectivity patterns of 1) different behaviours and 2) specifically the implementation strategies and parameters of OVM.

Then when you describe your analysis, after you give a general overview of your approach to comparing these complex data sets from each model run you can say that your structure your analysis to:

1.	 Compare overall effects on connectivity of all models to understand how patterns are affected by different behaviours and the nuainces of OVM integration.  How do those nuances compare to the more general question of which behaviours to inclue.
2.	Evaluate behaviour diffs more specifically
3.	Evaluate OVM diffs more specifically.

Note you could perhaps go the other way around…look at specific diffs first and then pull it all together to put it in context.


## Behaviours

Including orientation increased the diversity of the settlement reefs, although behaviours did not seem to effect the richness of the settlement reefs (@tbl:metrics). Larvae with only DVM behaviours had lowered richness, diversity, and connectedness of settlement patterns, conversely all other behavioural combinations increased these values compared to passive larvae. Including behaviour in models generally increased self-recruitment (with OVM the exception), increased local retention, increased settlement success and lowered the dispersal distance of larvae (@tbl:metrics). Settlement success was significantly increased approximately 20% when OHS was included with either DVM, OVM or a combination of both compared to a model with no behaviour (F~7,128~ = 2.98, p \< 0.05).

Evaluating the settlement patterns from regions using the settlement to other regions, the most dissimilar pattern occurred when only diel vertical migration was included (@fig:cluster a). The rest of the settlement patterns for the different behaviours were grouped into models with and without orientation (@fig:cluster a). The effect of including behaviours on settlement pattens differed depending on the source region, for some regions, such as off the southern coastline of NSW the effect was less noticeable (@fig:nmds-behaviour). The effect appeared to be greatest amongst all the patterns at mid-north to central coast, the regions Nambucca, Solitary Islands, Pt Stephens, and Newcastle. There were no significant differences in overall settlement patterns between the behaviours (F~model(7,128)~ = 0.95, p > 0.05, r^2^ = 0.05). The dissimilarities in DVM settlement was strongly driven by increased settlement at the Tweed (@fig:behaviour-ca). Including OVM and OHS strongly increased settlement at the southern NSW region of Merimbula and into Victoria.

TAKE HOME POINTS FOR DISCUSSION

- Behaviour influences settlement patterns (strong currents make it hard to find statistical differences, but the patterns are different). Especially settlement success.
- Including OHS seems to be important to settlement patterns
- OVM didn't have as big as effect as possible
- Effects can be regional (important to remember if only releasing from one point)

## Ontogenetic vertical migration

Serranidae, an OVM strategy where postflexion larvae migrate downwards had the highest settlement diversity (@tbl:metrics). This strategy of migrating downwards with ontogeny below 50 m, most pronounced in Serranidae and Scorpaenidae, increased self-recruitment, local retention, settlement success, and lowered the dispersal distance. This pattern contrasted with Mullidae larvae that migrated upwards towards the surface during postflexion produced the least diverse patterns of settlement. Staying close to the surface lowered self-recruitment, local retention, settlement success, and increased the dispersal distance of the larvae (@tbl:metrics). The settlement patterns of different larval migration strategies by source region were not significantly different from each other (F~model(6,112)~ = 0.12, p > 0.05, r^2^=0.01; @fig:nmds-ovm). Mullidae were the only pattern that were able to settle at the distant rocky reefs of Lord Howe Island (@fig:ovm-ca). The deeper strategy used by Serranidae increased settlement at the Tweed in northern NSW. Patterns clustered together with similar migration strategies (@fig:cluster b).

Each different implementation method of ontogenetic migration (time step, daily, or stage) affected the connectivity metrics (@tbl:metrics). Ontogenetically migrating the larvae daily had a different settlement pattern compared to time step and stage migration (F~model(2,48)~ = 2.88, p < 0.05, r^2^ = 0.11; @fig:nmds-implementation). The settlement was different at a number of different sites for each method, stage migration had the most dissimilar abundance at the Tweed (@fig:implementation-ca).


TAKE HOME POINTS FOR DISCUSSION

- Migrating downwards increased self-recruitment and local retention
- Staying high in the water column spreads the dispersal distance (trade off)
- Implementation does make a difference, more so than strategy (and more unpredictable)

## Overall context

The settlement patterns of behaviour were more dissimilar to each other than the OVM methods or strategies (@fig:nmds). The OVM strategies (apart from Mullidae which settled to Lord Howe Island), had the most similar settlement patterns. The OVM methods were more dissimilar than the OVM strategies.


### Figures and tables

: Metrics measured for each modelling scenario grouped by the three aims; behaviour (Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming), OVM strategy, and OVM method. Richness and the Shannon-Weiner diversity were measured using the settlement reefs as a proxy for species. Connectance (%) is a measure of describing the proportion of all links between the natal and settlement sites that are realised. The mean self-recruitment (%), local-retention (%), settlement success (%) and dispersal distance (km) are metrics of connectivity. ^a-b^Means values in a column without a common superscript letter are different using ANOVA with SNK post-hoc tests (p \< 0.05), not superscript letter in a column means the ANOVA was not significant. **Bold** denotes the highest metric value per scenario and *italics* denote the lowest value. {#tbl:metrics}


| Scenario     | Model         | Richness | Diversity | Connectance | Self-recruitment | Local retention | Settlement success | Dispersal distance |
|--------------|---------------|----------|-----------|-------------|------------------|-----------------|--------------------|--------------------|
| Behaviour    | Passive       | **286**  | 4.88      | 0.51        | 0.60             | *0.26*          | *0.43^a^*          | **92.6**           |
|              | DVM          | 285      | *4.80*    | *0.49*      | **0.76**         | 0.41            | 0.52^b^            | *65.1*             |
|              | OVM           | *284*    | 4.95      | 0.53        | *0.58*           | 0.30            | 0.48^ab^           | 82.7               |
|              | OHS            | **286**  | 4.95      | **0.54**    | 0.62             | 0.36            | 0.58^ab^           | 80.6               |
|              | DVM+OVM      | *284*    | 4.69      | 0.53        | 0.66             | 0.34            | 0.51^ab^           | 74.8               |
|              | DVM+OHS       | **286**  | **5.02**  | 0.52        | 0.66             | **0.43**        | **0.65^b^**        | 66.6               |
|              | DVM+OVM+OHS   | **286**  | **5.02**  | 0.52        | 0.66             | **0.43**        | **0.65^b^**        | 66.7               |
|              | OVM+OHS        | **286**  | 5.01      | **0.54**    | 0.63             | 0.40            | **0.64^b^**            | 72.7               |
| OVM Strategy | Labridae      | *284*    | 4.95      | 0.52        | 0.62             | *0.29*          | 0.47               | 82.5               |
|              | Mullidae      | 285      | *4.92*    | 0.52        | *0.59*           | *0.29*          | *0.45*             | **92.7**           |
|              | Pomacentridae | *284*    | 4.95      | 0.53        | 0.62             | 0.30            | 0.48               | 82.7               |
|              | Scaridae      | **286**  | 4.97      | *0.51*      | 0.62             | 0.30            | 0.48               | 78.3               |
|              | Scorpaenidae  | 285      | 4.98      | 0.53        | **0.64**         | 0.31            | **0.49**           | 74.1               |
|              | Serranidae    | 285      | **4.99**  | 0.53        | **0.64**         | **0.32**        | **0.49**           | *70.0*             |
|              | Synodontidae  | 285      | 4.96      | **0.54**    | 0.62             | 0.30            | 0.48               | 80.7               |
| OVM Method   | Time-step     | **285**  | *4.88*    | *0.52*      | 0.60             | *0.26*          | 0.43               | 92.5               |
|              | Daily         | *284*    | **4.95**  | **0.54**    | *0.58*           | 0.29            | **0.50**           | **100.0**          |
|              | Stage         | *284*    | **4.95**  | 0.53        | **0.62**         | **0.30**        | 0.48               | 82.7               |



![Cluster analysis of the behaviour (a) and ontogenetic vertical migration (OVM) strategies, using a Bray-Curtis dissimilarity measure and clustered using the average-link method.](chapters/theoretical/figs/cluster.png){#fig:cluster}

![Correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the behaviour scenarios](chapters/theoretical/figs/phase1-ca.png){#fig:behaviour-ca}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the behaviour scenario; ellipses denote regions (2D stress = 0.04)](chapters/theoretical/figs/phase1-all-nmds.png){#fig:nmds-behaviour}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the different ontogenetic vertical migration strategies for reef fish (2D stress = 0.04)](chapters/theoretical/figs/phase2-all-nmds.png){#fig:nmds-ovm}

![Correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the ontogenetic vertical migration strategies](chapters/theoretical/figs/phase2-ca.png){#fig:ovm-ca}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the different ontogenetic vertical migration methods (2D stress = 0.04)](chapters/theoretical/figs/phase3-all-nmds.png){#fig:nmds-implementation}

![Correspondence analysis of the total settlement patterns to each region along NSW for each of the different implementation methods (stage-based, daily, and time-step) of ontogenetic vertical migration in the biophysical dispersal model](chapters/theoretical/figs/phase3-ca.png){#fig:implementation-ca}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different settlement patterns for each scenario within each of the treatments; behaviour, OVM strategy, OVM method (2D stress = 0.03)](chapters/theoretical/figs/nmds-regions.png){#fig:nmds}

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
