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
1. To investigate how connectivity patterns are affected by the implementation of different forms of larval behaviour, specifically-- diel vertical migration (DVM), ontogenetic vertical migration (OVM), and orientated horizontal swimming (OHS)

2. To investigate how different implementation methods (modelling choices) and strategies (reflecting species differences) of ontogenetic vertical migration affect connectivity dispersal patterns.


The more I think about it…I think you might want to combine these two aims.  So the aim would be to evaluate the impact of OVM implementation strategy, method and parametrization, on patterns.  You know there is likely to be differences in patterns based on parameters used, i.e. for different speices…but the issue is that there are also different ways of implementing OVM in a biophysical model. You want to know how much patterns are affected by the method as opposed to parameters to know if this is important.  If variability is mainly from params, that’s fine and good to know…but if its from method then we need to suggest what is best and probably be doing the same thing.

Hypothesis:
1. Compared to passive practice, should reduce SR, increase LR, reduce DD
  i. Comment on effect of different types of flow regimes on the differences?
2. The patterns should differ as places within the water column change the currents the larvae are moved by
3. There should be an effect, but is predicted to be minimal [Why?]

# Methods

## Model development

[Build a flow diagram.]

The biophysical dispersal model— Zooplankton Interconnections and Source-Sink Observation Utility (ZISSOU, v1.1.3 [github.com/shawes/zissou])—is an individual-based model (IBM) developed in accordance with recommendations from the “Manual of recommended practices for modelling physical-biological interactions during fish early life” (ICES 2009).  Movement of particles within the model is forced by offline oceanographic current data but can be influenced by larval behavioural traits parameterised using probability distributions capturing known biological variability. The system was designed for high-performance, high customisation, and platform independence; written in the Scala programming  language (v2.12.4) using parallel libraries.

### Physical sub-model

ZISSOU accesses ocean circulation data as network common data forms (NetCDF); self-describing, machine-independent data formats. The data can be accessed either using locally stored files or using the Open-source Project for a Network Data Access Protocol (OPeNDAP; http://www.opendap.org). This project took advantage of Java NetCDF software libraries developed by UCAR/Unidata [http://doi.org/10.5065/D6H70CW6]. The ocean data must be in an Arakawa-A or Arakawa-B grid structure [CITE arakawa 97]. This version of ZISSOU utilises only the 3-dimensional velocity fields, and no other environmental variables such as salinity or temperature.

Runge-Kutta fourth-order integration (RK4) is used to move the particle through space and time, calculating a weighted average of four increments using the chosen model time-step (@eq:rk4). The velocity at any given position in space is interpolated using a tri-cubic interpolation scheme on the hydrodynamic model, such that the velocity for a given particle in the oceanographic space is interpolated from neighbouring grids using 64 points (4 x 4 x 4). If this is not possible, for example due to boundary conditions, trilinear interpolation using 8 points (2 x 2 x 2) is substituted.

$$\overrightarrow{v_{t+h}} = \overrightarrow{v_{t}} + \frac{1}{6} (k_{1} + 2k_{2} + 2k_{3} + k_{4})h$${#eq:rk4}
$$k_{1} = f(x_{t},y_{t})$$
$$k_{2} = f(x_{t} + \frac{1}{2}h, y_{t} + \frac{1}{2}k_{1}h)$$
$$k_{3} = f(x_{t} + \frac{1}{2}h, y_{t} + \frac{1}{2}k_{2}h)$$
$$k_{4} = f(x_{t} + h, y_{t} + k_{3}h)$$

The integrated velocity vector (*v~t+h~*), at time *t* and time step *h* is calculated using the weighted average of the four seperate interpolations (*k~1~, k~2~, k~3~, k~4~*), which interpolate the velocities at the beginning of the time step, two midpoint approximations and the end of the time step. The tri-cubic interpolation function *f(x,y)* calculates the velocities as described above.

To model the natural turbulent effect of ocean systems in a 3D stochastic model, ZISSOU uses a random displacement mechanism [@eq:turb; CITE Brickman & Smith 2002]

$$D_{(h+1)} = D_{(h)} + \overrightarrow{v} +\Delta{h} + \sqrt{\frac{2K}{\Delta{h}}Q}$${#eq:turb}

The displacement (D) is calculated using the velocity vector (v) from the hydrodynamic model, the time step (Δh), the eddy diffusivity (K) and a random number from a Gaussian distribution with a mean of zero (Q).

Psuedo-random numbers are generated in the model using a Mersenne Twister algorithm, WELL44497b [CITE Paennon]. The seed for the random number generator is an optional parameter of the model to allow for reproducibility of results if needed.

## Biological sub-model

Biological traits are specified using a configurable XML file as input to the model. The biological model implements many biological processes that are considered to be important for marine larval dispersal, e.g. the spawning period, pelagic larval duration, and vertical migration (@tbl:bio-params). The pelagic larval duration is specified by the length of the duration in days. It can be either random (used in a combination with a settlement competency window) that allows the larvae to settle when they find suitable habitat, or a fixed duration and larvae settle if they are over suitable habitat at the end of the duration. The settlement competency window is a specified time period after which the larvae become competent to settle, it can be specified as number of days or a developmental stage. Spawning sites are given as GPS locations (latitude and longitude in decimal degrees), with spawning time and frequency, the spawning depth in the water column, and the number of larvae to spawn, are all options to specify for the marine species being modelled. The particles seeded in the model are referred to as larvae, but that can simulate pelagic eggs through the inclusion of a specific age stage. Developmental stages (preflexion, flexion, postflexion) are based on a description of the mean (± standard deviation) age (in days) of larvae of each stage. From this input, stage transition ages are assigned to individual larvae at birth using a gaussian distribution (if no standard deviation is specified, the mean is the value). Where modelling a pelagic egg stage is necessary, a preflexion developmental age specifies the time of hatching.

: Summary of the biological and behavioural traits that can be specified in the biological sub-model. {#tbl:bio-params}

| Trait  | Options  |  Description | Input type |
| --|---|--- | ----|
| Pelagic larval duration  | Random  | Larvae are allowed to settle at a suitable habitat if they are within a given settlement competency window | Days (mean and standard deviation for gaussian distribution) | Seconds
|  |  Fixed |  Seconds
| Settlement competency window  | Fixed | Time the larvae become  |  Days
| Development age   | Preflexion  | The time the larvae start the preflexion stage (hatching from eggs). If this value is greater than 0, the first period the larvae are considered to be pelagic eggs. | Days (mean and s.d. for gaussian distribution)
|  | Flexion  | The age the flexion developmental period starts  | Days (mean and s.d. for gaussian distribution))
|  | Postflexion  | the age the postflexion period starts  | Days (mean and s.d. for gaussian distribution)
| Spawning sites  | Location  | The latitude and longitude of where to release the larvae  | GPS Coordinates
|  | Depth  | The depth the larvae are spawned  |  Metres
|  | Number | The number of larvae to spawn  |  Positive integer
|  | Period  | The period to release the larvae over  | Date range
|  | Interval  | The number of days to release the larvae over the release period  | Days (e.g. 1 = daily, 7 = weekly)
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

The fish larvae can be given a settlement sensory distance which allows them to discover a site and settle if they come within the specified distance, acting as pseudo-behaviour for cues such as vision, hearing or olfaction [CITE Leis 2007; Kingsford]. If there is no settlement site then the larvae keeps moving. The nearest point on the reef polygon is identified and then the distance is compared to the larva's current position. Olfactory distance works similar to settlement sensory, allowing the larvae to orientate towards the nearest settlement habitat if it is within the specified distance. The horizontal swimming speed is calculated using known critical swimming speeds, the *in situ* swimming potential and the swimming endurance of the larvae at postflexion (@eq:swim). Critical swimming speed (*U~crit~*) is a measure of the swimming capacity of the larvae, the *in situ* swimming speed is a measure of larval fish swimming in the ocean by divers, and endurance is a measure of how long they can keep swimming before tiring [CITE Leis 2006]. *U~crit~* speeds are obtained in laboratory conditions, and as such it is unknown if this is the swimming speed in the ocean. Therefore, ZISSOU allows the *U~crit~* to be tempered by known *in situ* speeds for the species. *In situ* speeds also can be unrealistic due to presence of divers, close distance to reefs and the shallow depth ranges divers can follow fish. Therefore the model constrains the actual swimming speed of the larvae to be between the upper *U~crit~* speed and the lower *in situ* speed (if supplied - otherwise the *U~crit~* is given as the swimming speed in no *in situ* speeds are known). Endurance is also applied as a proportion of time the larvae swims each time step, which can be taken from either laboratory or *in situ* observations, as it is unrealistic to expect reef fish larvae swim at speed without stopping.

[Put in about fish swimming from Leis]

Therefore, the speed they are allowed to swim is constructed from their maximum sustained swimming speed, proportioned by speeds observed in the wild, and tempered by their known endurance. The speed is added to both the *u* and *v* velocities after applying the direction of orientation (@eq:u; @eq:v). Fish can swim, orientated to the nearest habitat, if they find themselves within a user configured olfactory range.

$$s = U_{crit} \times X_{[S_{p},1]} \times E_{p}$${#eq:swim}

$$u^{\prime} = u + s \times \cos(\theta)$${#eq:u}

$$v^{\prime} = v + s \times \sin(\theta)$${#eq:v} 

*U~crit~* is the critical swimming speed (ms~-1~), X is a random number with a distribution contrained by a minimum *S~p~*, which is is the *in situ* swimming potential (expressed as a proportion of *U~crit~*) and the maximum of 1, and *E~p~* is the endurance potential (proportion of time step it is expected to swim) of the fish larvae. \&theta is the angle of direction to a settlement site if it was sensed within the olfactory distance.

## Model configuration

### Study location

The New South Wales (NSW) coastline (2,137 km) was divided into approximately 17 equally sized regions (approximately 125 km each). Rocky reef patches were identified using freely available benthic data obtained from NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). Within each sub-region, four rocky reef patches (approximately X m^2^ each) from across the sub-region were chosen as spawning sites. Larvae were released weekly from the centre of each spawning site in batches of  1000 over the period July 2007 to June 2008. In total 3.5 million larvae were released. Larvae were allowed to settle to the identified rocky reef patches or benthic habitat patches marked as unknown, as unmapped patches could be potential rocky reef settlement sites.

![The 17 regions (each containing four rock reef patches) used to spawn the reef fish larvae along the coastline of New South Wales, Australia](chapters/theoretical/figs/release-sites.png){#fig:release-sites.png}

### Physical sub-model

The oceanographic circulation model used was BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], a hindcast model based on the Ocean Forecasting Australia Model (OFAM). BRAN is a data-assimilating model that aims to resolve mesoscale eddies in 3-dimensions, at the scale of 10 km in the horizontal (0.1° latitude and longitude) and 5-10 m vertically (15 depth bins between 0-105 m). The model consists of mean daily current velocities, sea-level anomaly, sea-surface temperature, and salinity over the period January 1993 to September 2012. An eddy diffusivity value (K) of 300 ms^-1^ was used, as per similar studies in the region [CITE condie, chiswell]. The time-step of the model was two hours.

### Biological sub-model

Model parameters are based on characteristics of a temperate rock reef fish from the family Pomacentridae (Damselfishes). We chose this group as it is relatively well studied, thus providing reasonable estimates of the various parameters required for modelling.  The literature on early-life fish histories is biased towards tropical and sub-tropical species, therefore where values for temperate Pomacentridae were not found, information of tropical larvae was utilised (@tbl:bio-params). An individual larvae only settled if, at the end of their pelagic larval duration, they were able to sense a settlement reef patch (within the settlement sensory distance of suitable settlement habitat). The larvae were spawned in the preflexion stage, assuming a species with benthic eggs which is common for Pomacentridae. The lack of velocity data near the coast is an inherent property of its grid structure but one that limiting the ability of fish to settle on some reef patches. In order to compensate for this as well as the coarse 10 km resolution of the oceanographic model, larvae were given a settlement sensory zone of 10 km with which to sense settlement reef habitat, which was slightly larger (but within 1 standard deviation) than the mean settlement sensory zone of 8.3 km (± 5.2) as seen in Chapter 2 (@tbl:bio-base). To orientate and swim towards a reef, the fish were given an olfactory range of 10 km, which was the maximum extent used in other studies ([CITE Wolanski, Staatermann]), but we assumed the same sensory cues for the larvae as the settlement sensory extent (@tbl:orientate).

: Biological features of the Pomacentridae larvae that were used in every model run of the experiment {#tbl:bio-base}

| Biological feature          | Value            | Reference                  |
|-----------------------------|------------------|----------------------------|
| PLD                         | 18.3 (±1.5) days | [CITE Wellington & Victor] |
| Preflexion age              | 0 days           | [CITE Murphy 2007]         |
| Flexion age                 | 5 (±0.5) days    | [CITE Murphy 2007]         |
| Postflexion age             | 8 (±0.5) days    | [CITE Murphy 2007]          |
| Settlement sensory distance | 10 km            | Based on review in Chapter 2    |

In order to address the first aim of evaluating the influence of different behaviours on connectivity patterns I ran a series of models to compare patterns resulting from the implementation of 1) diel vertical migration (DVM; @tbl:dvm), 2) ontogenetic vertical migration (OVM; @tbl:scenarios-ovm - Pomacentridae strategy), and 3) orientated horizontal swimming (OHS; @tbl:orientate) implemented. Each behaviour (and combination of congruent behaviours) was compared to a base case of completely passive transport (@tbl:scenarios-behaviour).

: Orientated horizontal swimming (OHS) parameterisation, used in the swimming equation described above {#tbl:orientate}

| OHS feature  | Value        | Reference                   |
|------------------------------|--------------|-----------------------------|
| Olfactory distance           | 10 km        |  Based on review in Chapter 2  |
| *U~crit~*                    | 0.463 ms~-1~ | [CITE Leis and Fisher 2006] |
| *In situ* swimming potential | 0.25         | [CITE Leis and Fisher 2006] |
| Endurance                    | 0.50          | [CITE Leis and Fisher 2006] |

: Diel vertical migration (DVM) values used, providing more stratified depth positions during the day and more even distribution at night as seen in temperate fish off NSW [CITE Gray 1997] {#tbl:dvm}

| Time of day | Depth range (m) | Probability |
|-------------|-----------------|:-----------:|
| Day         | 0-25            | 0.1         |
|             | 26-50           | 0.3         |
|             | 51-75           | 0.4         |
|             | 76-100          | 0.2         |
| Night       | 0-25            | 0.3         |
|             | 26-50           | 0.3         |
|             | 51-75           | 0.3         |
|             | 76-100          | 0.1         |

[I think its worth defining a term here to describe these things…here’s my stab at it.  You should use the term in chapter 3 as well.  Then use it above when describing OVM and, if you make the figure I suggested, use it there as well.  This will allow you have a term which essentially describes this multi-dimensional parameter which is fundamental to the OVM behavior in the model.]

The second aim, to assess the impact on connectivity of using different ontogenetic vertical migration parameters was addressed by conducting model runs using proportional depth stage abundance profiles which represented the seven fish families studied in Chapter 3 (@fig:scenarios-ovm; for the actual values see Supplementary Table @tbl:scenarios-ovm). The ontogenetic vertical migration was implemented such that the larvae moved when they reached their next ontogenetic stage (based on developmental time). Lastly, in order to explore the impact of the OVM implementation strategy on connectivity patterns I compared three different methods of ontogenetic vertical migration (@tbl:scenarios-impl). The first method migrated the larvae using the given probabilities after each time-step. Due to the short time-period, larvae were restricted to only moving upwards or downwards 25 m, while keeping the proportions of ontogenetic migration probabilities consistent. This migration strategy uses the assumption that individual fish larvae are always migrating in the water column and their vertical position can change on other cues (e.g. predation avoidance, light, and feeding). The second method use the same assumption, but instead vertically migrates the larvae only once every 24 hours, but it allows the larvae to move anywhere within the specified depth range, as it is known many larvae are capable of large vertical migrations in short timeframes ([CITE DVM paper]). The last method only migrates a larvae when it moves into the next ontogenetic stages, assuming that vertical migration is more of gradual migration based on developmental stage.

: Eight models with combinations of the three different behavioural scenarios were used to test the effects of the three behaviours; No behaviour (scenario 1), diel vertical migration (DVM; scenarios 2,5,6,8), ontogenetic vertical migration (OVM; scenarios 3,5,7,8), and orientated horizontal swimming (OHS, scenarios 4,6,7,8). {#tbl:scenarios-behaviour}

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

![Proportional depth stage abundance profiles for each of the seven fish families evaluated in Chapter 3. Values represent the proportional (within a stage) abundance of each ontogenetic stage (preflexion, flexion, postflexion) within each of three depth ranges (surface: 0-5 m; middle: 6-50 m; deep layer: 51-100 m) and are used to parameterise models run to address Aim 2 of this study.](chapters/theoretical/figs/ovm-strategies.png){#fig:scenarios-ovm}

: The three different scenarios for implementing ichthyoplankton ontogenetic vertical migration (OVM) in the biophysical dispersal model {#tbl:scenarios-impl}

| Scenario | OVM migration timing                            |
|----------|-------------------------------------------------|
| 1        | Time step migration |
| 2        | Daily migration                                 |
| 3        | Stage migration           |

## Data analysis

[Is that correct, as the way you’ve written it could mean something else.  So I would think if you relased 10,000 larvae from i and 200 settled at j, then the number would be 200/10,000.  But as you wrote it it could mean the proportion (out of all spawned larvae) that were spawned at i and settled at j.  That would be 200/Total larvae spawned]

[These are not clear enough.  I’ve had a go at clarifying but I’m not sure I actually got it right, so check that.  Ideally you want to probably have a section where you talk about univariate metrics and one where you look at multivariate.]

Each individual model run produced as output a connectivity matrix, which represents the connectivity between larval source (row~*i*~) and settlement (column~*j*~) regions where each element~*i,j*~ is the proportion of all larvae spawned at *i* which settled at *j* over the release period. Several univariate measures were extracted from each matrix: settlement site richness (the number of reefs receiving settlers), Shannon-Weiner diversity of settlement (using number of reefs and total larvae settled per reef), self-recruitment, local retention, settlement success, dispersal distance (see Definitions), and connectance (the proportion of the edges connecting natal and settlement sites in a graph compared to the theoretical maximum number of edges). Differences between model scenarios were assessed by comparing each metric amongst different sets of matrices (depending on the aim) with regions (n = 17) used as replicates using one-way repeated measure ANOVAs, to account for the regional oceanographic variation in each model. Tukey's HSD post-hoc pairwise tests were used to assess differences amongst regions where ANOVAs were significant (\&alpha = 0.05). The r package *ConnMattTools* [CITE] was used to obtain connectivity metrics and the package *igraph* [CITE] was used for obtaining measures of connectance.

Multivariate comparisons of connectivity matrices were made using non-metric multidimensional scaling (NMDS) which allowed for the assessment of the relative similarity of regional patterns (replicates) across different model scenarios (variables). I used the Bray-Curtis dissimilarity measures to get distance matrices and applied a square root transform to account for highly abundant areas of settlement. There were strong differences in settlement patters for the different regions due to variations in regional oceanography. These differences are interesting but can serve to swamp the more pertinent comparisons between models. In order to capture these differences between models more explicitly raw settlement proportions were standardised by settlement proportion values from the passive (no behaviour) connectivity matrix. To test for differences in these multivariate patterns of settlement between models, PERMANOVA tests were conducted using the *adonis* function in the r package *vegan* [CITE vegan]. Constrained correspondence analysis (CCA) using the r package *vegan* [CITE] was used to see which regions were contributing the most to differences amongst models. CCA was also used to compare the treatments by using total settlement to each site per model. Cluster analysis for each model was also used to test for groups of similar models, again using a Bray-Curtis dissimilarity measure and the average-link clustering method.

# Results

Figures should be cited in the order in which they appear in the text.

You have an issue here in that youi have these specific aims which seem separate but then the first thing you do is compare across them. This comparison is good but you need to rethink how you’ve laid out your analysis then.

Maybe the way to go here is to restate the aim a bit more integrated.  So you are looking to evaluate the impact on connectivity patterns of 1) different behaviours and 2) specifically the implementation strategies and parameters of OVM.

Then when you describe your analysis, after you give a general overview of your approach to comparing these complex data sets from each model run you can say that your structure your analysis to:

1.	 Compare overall effects on connectivity of all models to understand how patterns are affected by different behaviours and the nuainces of OVM integration.  How do those nuances compare to the more general question of which behaviours to inclue.
2.	Evaluate behaviour diffs more specifically
3.	Evaluate OVM diffs more specifically.

Note you could perhaps go the other way around…look at specific diffs first and then pull it all together to put it in context.


## Comparison of behavioural scenarios

Including some behaviour in models increased the self-recruitment compared to no behaviour (F~7,112~ = 16.59, p \< 0.05), except for the behaviour OVM unless it was combined with OHS ; @fig:conn-metrics A). DVM and DVM-OHS produced the highest mean self-recruitment values for each region. Similarly local retention increased when including all behaviours except OVM (unless coupled with OHS; F~7,112~ = 76.39, p \< 0.05; @fig:conn-metrics B). Passive larvae and larvae with OVM produced the most consistent local retention between regions, while changes in local retention attributed to DVM behaviour appeared to be highly region specific. Settlement success was significantly increased approximately 20% when OHS was included with either DVM, OVM or a combination of both compared to a model with no behaviour (F~7,112~ = 87.53, p \< 0.05; @fig:conn-metrics C). Including either OVM or DVM+OVM did not change the settlement success significantly compared to passive larvae. Larvae with no behaviour dispersed the longest (F~7,112~ = 60.54, p \< 0.05), suggesting behaviour constrains the dispersal kernel of larvae. Models with OHS behaviour included had the lowest dispersal distances,  approximately 40% the distance that passive larvae dispersed until settlement (@fig:conn-metrics D).

![The connectivity metrics of mean self-recruitment (%; A), local-retention (%; B), settlement success (%; C) and dispersal distance (km; B) for each region, as measured for each modelling scenario grouped by the three aims; behaviour (Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming), OVM strategy, and OVM method. The whisker plots denote the mean, one standard deviation either side of the mean and min/max values.](chapters/theoretical/figs/conn-metrics.png){#fig:conn-metrics}

Settlement richness, i.e. the number of sites settled to, was changed when behaviour was added to a model (F~7,112~ = 17.94, p \< 0.05; @fig:settle-metrics A). The settlement diversity similarly changed with behaviour (F~7,112~ = 52.99, p \< 0.05). The pattern was the same as with richness, but more pronounced, with OHS reducing the number of settlement sites and abundance of settlers across sites (@fig:settle-metrics B). DVM+OHS produced the greatest differences in settlement diversity, while DVM+OHS had the least variation between regions. Maximum connectance was achieved by including OVM behaviour, but all over behaviour combinations reduced the connectance of the models compared to no behaviour (@fig:settle-metrics C). Models with OHS had the lowest connectance values for models including behaviour.

![The metrics of mean settlement richness (A), settlement diversity (measured using Shannon-Weiner; B), and connectance (a measure of describing the proportion of all links between the natal and settlement sites that are realised; C) for each region, as measured for each modelling scenario grouped by the three aims; behaviour (Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming), OVM strategy, and OVM method. The whisker plots denote the mean, one standard deviation either side of the mean and min/max values.](chapters/theoretical/figs/settle-metrics.png){#fig:settle-metrics}

Cluster analysis of the settlement regions by behavioural models produced two discrete clusters: models with OHS and models with only vertical migration (either DVM or OVM) and no behaviour strategies (@fig:cluster A). The settlement patterns that were most similar were OVM+OHS and DVM+OVM+OHS, and also OVM and OVM+DVM, suggesting that including DVM with OVM does not effect the settlement pattern considerably. The strength of the effect on settlement patterns when including behaviour was regional, however the models with OHS included tended to be grouped together for each source region, suggesting similar settlement patterns compared to the other models (@fig:behaviour-nmds). There were no differences in the settlement patterns between the behaviours (F~model(7,128)~ = 1.27, p > 0.05, r^2^ = 0.06), with the majority of the variation explained by the source region, and hence the prevailing currents (F~model(16,119)~ = 22.02, p \< 0.05, r^2^ = 0.75).  Tweed and Pt Stephens settlement regions exhibited strong dissimilarities between these two behavioural model clusters, in contrast to the regions Pt Macquarie and Jervis Bay where the effect was less noticeable (@fig:behaviour-nmds). Dissimilarities between behaviour scenario models was explained by many different settlement regions (@fig:behaviour-ca). Strong settlement to the Tweed region explained the dissimilarities for DVM models (excluding DVM+OVM) and OHS models. OHS also caused stronger larval settlement at Victoria, Merimbula, and Ballina, and weaker larval settlement at the regions Solitary Islands and Nambucca. Complementary to this, Nambucca and Solitary Islands were strong settlements regions for models with vertical migration or no behaviour (@fig:behaviour-ca).

![Cluster analysis of the behaviour (A; Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming) and ontogenetic vertical migration (OVM) strategies (B), and OVM methods (C) using a Bray-Curtis dissimilarity measure and clustered using the average-link method.](chapters/theoretical/figs/cluster.png){#fig:cluster}

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the behaviour scenario; ellipses denote regions (2D stress = 0.01)](chapters/theoretical/figs/phase1-all-nmds.png){#fig:behaviour-nmds}

![Constrained correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the behaviour scenarios](chapters/theoretical/figs/phase1-ca.png){#fig:behaviour-ca}

TAKE HOME POINTS FOR DISCUSSION

- Behaviour influences settlement patterns (strong currents make it hard to find statistical differences, but the patterns are different). Especially settlement success.
- Including OHS seems to be important to settlement patterns
- OVM didn't have as big as effect as possible
- Effects can be regional (important to remember if only releasing from one point)

## ## Comparison of ontogenetic vertical migration scenarios

Changes in OVM strategies had significant effects on all the connectivity metrics; self-recruitment of larvae (F~6,96~ = 31.88, p \< 0.05; @fig:conn-metrics A), local retention (F~6,96~ = 40.90, p \< 0.05; @fig:conn-metrics B), settlement success (F~6,96~ = 42.84, p \< 0.05; @fig:conn-metrics C), and dispersal distance (F~6,96~ = 63.25, p \< 0.05; @fig:conn-metrics D). The strategy of close to the surface during all stages of ontogeny, e.g. Mullidae, produced the lowest self-recruitment, local retention, settlement success, and the longest dispersal distance. Contrastingly, the strategy of migrating downwards with ontogeny below 50 m, most pronounced in Serranidae and Scorpaenidae, increased self-recruitment, local retention, settlement success, and lowered the dispersal distance.
Different OVM strategies did not produce any differences in richness (F~6,96~ = 1.11, p > 0.05; @fig:settle-metrics A) or diversity (F~6,96~ = 0.79, p > 0.05; @fig:settle-metrics B). The strategies with the lowest connectance occurred with the Labridae and Scaridae strategies, while Synodontidae had the highest connectance values (@fig:settle-metrics C).

Comparing the settlement patterns of OVM strategies, there were no significant differences in strategies (F~model(6,112)~ = 0.13, p > 0.05, r^2^ = 0.01), with the variation largely explained by the regional currents. The dissimilarity patterns between OVM strategies at each settlement region appeared to be different, e.g. Labridae and Mullidae OVM strategies had similar settlement patterns when spawned at Merimbula and Pt Macquarie, but seemingly disparate patterns when spawned at Crowdy Bay and Sydney (@fig:ovm-nmds). Source regions Pt Stephens and Pt Macquarie produced similar patterns of settlement for all strategies, whereas other source regions, e.g. Merimbula or Solitary Islands, produced more varied settlement patterns between OVM strategies. Mullidae (surface strategy) were the only larvae to settle at the offshore region of Lord Howe Island (@fig:ovm-ca). Serranidae, with deeper larvae at post-flexion, had stronger settlement at the Tweed region. The rest of the dissimilarities were a result of small regional settlement changes. The OVM strategies clustered into three groups, the first containing only Mullidae (which were the only ones to reach Lord Howe), the second group containing the two deep vertical migrations strategies of Serranidae and Scorpaenidae, and the rest in the final group (@fig:cluster B).

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the different ontogenetic vertical migration strategies for reef fish (2D stress = 0.06)](chapters/theoretical/figs/phase2-all-nmds.png){#fig:ovm-nmds}

![Constrained correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the ontogenetic vertical migration strategies](chapters/theoretical/figs/phase2-ca.png){#fig:ovm-ca}


Considering different methods of OVM, there were significant differences between self-recruitment (F~(2,32)~ = 5.68, p < 0.05), the daily method having lower self-recruitment than stage based migration (@fig:conn-metrics A). Time-step migration had the lowest mean local retention (F~(2,32)~ = 9.83, p < 0.05; @fig:conn-metrics B) and settlement success (F~(2,32)~ = 32.48, p < 0.05; @fig:conn-metrics C) between the OVM methods. The daily and time step methods both significantly dispersed further than the stage OVM method (F~(2,32)~ = 11.00, p < 0.05; @fig:conn-metrics D). The variation of dispersal distance for the daily OVM method had a standard deviation estimated to be 30% greater than the other methods. OVM methods did not have an effect on settlement site richness (F~(2,32)~ = 1.04, p \> 0.05; @fig:settle-metrics A), there was an effect on diversity (F~(2,32)~ = 11.02, p < 0.05; @fig:settle-metrics B). This effect was caused by the OVM method of daily migration, which had lower settlement site diversity than the other OVM methods. However, the daily method of migration had the highest value of connectance (@fig:settle-metrics C).

The method of migrating daily produced significantly different settlement patterns from all regions compared to the time-step or staged based methods (F~model(2,48)~ = 2.96, p < 0.05, r^2^ = 0.11; @fig:impl-nmds). Ontogenetically migrating larvae daily produced distinctly different patterns to stage and time step migration at the southern latitude source regions of Wollongong, Ulladulla, Jervis Bay, and Batemans Bay. Crowdy Bay and Nambucca, central latitudinal sites produced large variation between all three methods, while only Pt Macquarie and Pt Stephens produced similar settlement patterns for each OVM method. The strongest settlement variation occurs at the Tweed, where settlement is increased when the stage OVM migration method is used (@fig:impl-ca). Daily migration produces stronger settlement at Sydney, Pt Macquarie, and Yamba, whereas time-step migration has the most pronounced settlement at Eden and Solitary Islands. Each method has dissimilar settlement patterns, and clustered into three groups (@fig:cluster C).

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the different ontogenetic vertical migration methods (2D stress = 0.08)](chapters/theoretical/figs/phase3-all-nmds.png){#fig:impl-nmds}


![Constrained correspondence analysis of the total settlement patterns to each region along NSW for each of the different implementation methods (stage-based, daily, and time-step) of ontogenetic vertical migration in the biophysical dispersal model](chapters/theoretical/figs/phase3-ca.png){#fig:impl-ca}


TAKE HOME POINTS FOR DISCUSSION

- Migrating downwards increased self-recruitment and local retention
- Staying high in the water column spreads the dispersal distance (trade off)
- Implementation does make a difference, more so than strategy (and more unpredictable)

## Overall context

The settlement patterns of behaviour were more dissimilar to each other than the OVM methods or strategies (@fig:nmds). The behaviours with OHS and DVM were different to the behaviours including OVM or no behaviour. The variation between settlement patterns for OVM strategies and OVM methods were considerably smaller than the differences in behavioural choices. Although the dissimilarities between OVM methods were twice the dissimilarities measures seen between OVM strategies (@fig:cluster), they were at most 30% compared to the dissimilarities between behavioural models. The OVM method of migrating every time-step appeared to produce the same total settlement patterns as having no behaviour (@fig:nmds). The model including DVM+OVM produced similar total settlement patterns to the Serranidae OVM strategy. The OVM strategies stretch across an axis from Mullidae (most in the surface) to Serranidae and Scorpaenidae (most in the 50-100 m waters).

Differences in behaviour were more influential in determining the settlement richness, diversity, and connectance between regions (@fig:settle-metrics). Diversity was impacted more by changes in OVM method than the strategy choice (@fig:settle-metrics B). Similar trends were seen in amongst the connectivity metrics, where different behaviours effected the metrics more than changes within OVM strategy or OVM methodology (@fig:conn-metrics). The one exception is dispersal distance, which also exhibited variation with both different OVM strategies and methodologies (@fig:conn-metrics D).

![Constrained correspondence analysis of the total settlement patterns for each scenario within each of the treatments; behaviour (Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming), ontogenetic vertical migration (OVM) strategy (strategies based on seven reef fish families), and OVM method (the larvae migrate at the time step (2 hours), daily, or stage based migration such that the larvae migrate vertically when the next ontogenetic stage is reached). The first two axis explain 97.0% of the inertia.](chapters/theoretical/figs/all-nmds.png){#fig:nmds}


# Discussion

## Behaviour


## OVM strategy


## OVM method


## Comparison


## Furture direcitions (i.e. what to model)



## Issues with the models
- passive could move, perhaps why not such a big effect
- perhaps OHS was too strong at 10 km?

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

## Supplementary material

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
