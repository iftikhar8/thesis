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

2. To investigate how different implementation methods and strategies (reflecting species differences) of ontogenetic vertical migration affect connectivity dispersal patterns.


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

$$s = U_{crit} \times \X_{[S_{p},1] \times E_{p}$${#eq:swim}

$$u^{\prime} = u + s \times \cos(\theta)$${#eq:u}
$$v^{\prime} = v + s \times \sin(\theta)$${#eq:v}

*U~crit~* is the critical swimming speed (ms~-1~), X is a random number with a distrinutoon minimum of *S~p~* is the *in situ* swimming potential (expressed as a proportion of *U~crit~*) and the maximum of 1, and *E~p~* is the endurance potential (proportion of time step it is expected to swim) of the fish larvae. \&theta is the angle of direction to a settlement site if it was sensed within the olfactory distance.

## Model configuration

### Study location

The New South Wales (NSW) coastline (2,137 km) was divided into approximately 17 equally sized regions (approximately 125 km each). Rocky reef patches were identified using freely available benthic data obtained from NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). Within each sub-region, four rocky reef patches (approximately X m^2^ each) from across the sub-region were chosen as spawning sites. Larvae were released weekly from the centre of each spawning site in batches of  1000 over the period July 2007 to June 2008. In total 3.5 million larvae were released. Larvae were allowed to settle to the identified rocky reef patches or benthic habitat patches marked as unknown, as unmapped patches could be potential rocky reef settlement sites.

![The 17 regions (each containing four rock reef patches) used to spawn the reef fish larvae along the coastline of New South Wales, Australia](chapters/theoretical/figs/release-sites.png){#fig:release-sites.png}

### Physical sub-model

The oceanographic circulation model used was BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], a hindcast model based on the Ocean Forecasting Australia Model (OFAM). BRAN is a data-assimilating model that aims to resolve mesoscale eddies in 3-dimensions, at the scale of 10 km in the horizontal (0.1° latitude and longitude) and 5-10 m vertically (15 depth bins between 0-105 m). The model consists of mean daily current velocities, sea-level anomaly, sea-surface temperature, and salinity over the period January 1993 to September 2012. An eddy diffusivity value (K) of 300 ms^-1^ was used, as per similar studies in the region [CITE condie, chiswell]. The time-step of the model was 2 hours.

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

: Diel vertical migration (DVM) values {#tbl:dvm}

| DVM      | Depth (m) | Probability  | Reference
|-------|-----------|:------------| ------------
| Day   | 0-50      | 0.1         | CITE Gray 1997
|       | 51-100    | 0.9         | CITE Gray 1997
| Night | 0-50      | 0.7         | CITE Gray 1997
|       | 51-100    | 0.3         | CITE Gray 1997

[I think its worth defining a term here to describe these things…here’s my stab at it.  You should use the term in chapter 3 as well.  Then use it above when describing OVM and, if you make the figure I suggested, use it there as well.  This will allow you have a term which essentially describes this multi-dimensional parameter which is fundamental to the OVM behavior in the model.]

The second aim, to assess the impact on connectivity of using different ontogenetic vertical migration parameters was addressed by conducting model runs using proportional depth stage abundance profiles which represented the seven fish families studied in Chapter 3 (@fig:scenarios-ovm; for the actual values see Table S1). The ontogenetic vertical migration was implemented such that the larvae moved when they reached their next ontogenetic stage (based on developmental time). Lastly, in order to explore the impact of the OVM implementation strategy on connectivity patterns I compared three different methods of ontogenetic vertical migration (@tbl:scenarios-impl). The first method migrated the larvae using the given probabilities after each time-step. Due to the short time-period, larvae were restricted to only moving upwards or downwards 25 m, while keeping the proportions of ontogenetic migration probabilities consistent. This migration strategy uses the assumption that individual fish larvae are always migrating in the water column and their vertical position can change on other cues (e.g. predation avoidance, light, and feeding). The second method use the same assumption, but instead vertically migrates the larvae only once every 24 hours, but it allows the larvae to move anywhere within the specified depth range, as it is known many larvae are capable of large vertical migrations in short timeframes ([CITE DVM paper]). The last method only migrates a larvae when it moves into the next ontogenetic stages, assuming that vertical migration is more of gradual migration based on developmental stage.

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

![Proportional depth stage abundance profiles for each of the seven fish families evaluated in Chapter 3. Values represent the proportional (within a stage) abundance of each ontogenetic stage (preflexion, flexion, postflexion) within each of three depth ranges (surface: 0-5 m; middle: 6-50 m; deep layer: 51-100 m) and are used to parameterise models run to address Aim 2 of this study.](chapters/theoretical/figs/ovm-strategies.png){@fig:scenarios-ovm}

: The three different scenarios for implementing ichthyoplankton ontogenetic vertical migration (OVM) in the biophysical dispersal model {#tbl:scenarios-impl}

| Scenario | OVM migration timing                            |
|----------|-------------------------------------------------|
| 1        | Time step migration |
| 2        | Daily migration                                 |
| 3        | Stage migration           |

## Data analysis

[Is that correct, as the way you’ve written it could mean something else.  So I would think if you relased 10,000 larvae from i and 200 settled at j, then the number would be 200/10,000.  But as you wrote it it could mean the proportion (out of all spawned larvae) that were spawned at i and settled at j.  That would be 200/Total larvae spawned]

[These are not clear enough.  I’ve had a go at clarifying but I’m not sure I actually got it right, so check that.  Ideally you want to probably have a section where you talk about univariate metrics and one where you look at multivariate.]

Each individual model run produced as output a connectivity matrix, which represents the connectivity between larval source (row~*i*~) and settlement (column~*j*~) regions where each element~*i,j*~ is the proportion of all larvae spawned at *i* which settled at *j* over the release period. Several univariate measures were extracted from each matrix: settlement site richness (the number of reefs receiving settlers), Shannon-Weiner diversity of settlement (using number of reefs and total larvae settled per reef), self-recruitment, local retention, settlement success, dispersal distance (see Definitions), and connectance (the proportion of the edges connecting natal and settlement sites in a graph compared to the theoretical maximum number of edges). Differences between model scenarios were assessed by comparing each metric amongst different sets of matrices (depending on the aim) with regions (n = 17) used as replicates using one-way repeated measure ANOVAs, to account for the regional oceangraphic variation in each model. Tukey's HSD post-hoc pairwise tests were used to assess differences amongst regions where ANOVAs were significant (\&alpha = 0.05). The r package *ConnMattTools* [CITE] was used to obtain connectivity metrics and the package *igraph* [CITE] was used for obtaining measures of connectance.

Multivariate comparisons of connectivity matrices were made using non-metric multidimensional scaling (NMDS) which allowed for the assessment of the relative similarity of regional patterns (replicates) across different model scenarios (variables). I used the Bray-Curtis dissimilarity measures to get distance matrices and applied a square root transform to account for highly abundant areas of settlement. There were strong differences in settlement patters for the different regions due to variations in regional oceanography. These differences are interesting but can serve to swamp the more pertinent comparisons between models. In order to capture these differences between models more explicitly raw settlement proportions were standardised by settlement proportion values from the passive (no behaviour) connectivity matrix. To test for differences in these multivariate patterns of settlement between models, PERMANOVA tests were conducted using the *adonis* function in the r package *vegan* [CITE vegan]. Correspondence analysis using the r package *ca* [CITE] was used to see which regions were contributing the most to differences amongst models. Cluster analysis for each model was also used to test for groups of similar models, again using a Bray-Curtis dissimilarity measure and the average-link clustering method.

# Results

Figures should be cited in the order in which they appear in the text.

You have an issue here in that youi have these specific aims which seem separate but then the first thing you do is compare across them. This comparison is good but you need to rethink how you’ve laid out your analysis then.

Maybe the way to go here is to restate the aim a bit more integrated.  So you are looking to evaluate the impact on connectivity patterns of 1) different behaviours and 2) specifically the implementation strategies and parameters of OVM.

Then when you describe your analysis, after you give a general overview of your approach to comparing these complex data sets from each model run you can say that your structure your analysis to:

1.	 Compare overall effects on connectivity of all models to understand how patterns are affected by different behaviours and the nuainces of OVM integration.  How do those nuances compare to the more general question of which behaviours to inclue.
2.	Evaluate behaviour diffs more specifically
3.	Evaluate OVM diffs more specifically.

Note you could perhaps go the other way around…look at specific diffs first and then pull it all together to put it in context.


## Behavioural scenarios

Including orientation increased the diversity of the settlement reefs, although behaviours did not seem to effect the richness of the settlement reefs (@tbl:metrics). Larvae with only DVM behaviours had lowered richness, diversity, and connectedness of settlement patterns, conversely all other behavioural combinations increased these values compared to passive larvae. Including behaviour in models generally increased self-recruitment (with OVM the exception), increased local retention, increased settlement success and lowered the dispersal distance of larvae (@tbl:metrics). Self-recruitment varied significantly between behavioural models (F~7,112~ = 18.00, p \< 0.05), the self-recruitment for DVM was significantly different to all other models. The self-recruitment for models containing DVM was significantly greater than the model with no behaviour. Settlement success was significantly increased approximately 20% when OHS was included with either DVM, OVM or a combination of both compared to a model with no behaviour (F~7,112~ = 63.02, p \< 0.05). Local retention was also significantly increased with all behaviour, except OVM. Larvae with DVM behaviour increased local retention the most, and it the highest values came when combining it with the behaviour OHS. The distance dispersed before settling was also reduced by adding any behaviour to the larvae (F~7,112~ = 23.66, p \< 0.05), with DVM restricting the dispersal distance the most.

Evaluating the settlement patterns from regions using the settlement to other regions, the most dissimilar pattern occurred when only diel vertical migration was included (@fig:cluster a). The rest of the settlement patterns for the different behaviours were grouped into models with and without orientation (@fig:cluster a). The effect of including behaviours on settlement pattens differed depending on the source region, for some regions, such as off the southern coastline of NSW the effect was less noticeable (@fig:nmds-behaviour). The effect appeared to be greatest amongst all the patterns at mid-north to central coast, the regions Nambucca, Solitary Islands, Pt Stephens, and Newcastle. There were no significant differences in overall settlement patterns between the behaviours (F~model(7,128)~ = 0.95, p > 0.05, r^2^ = 0.05). The dissimilarities in DVM settlement was strongly driven by increased settlement at the Tweed (@fig:behaviour-ca). Including OVM and OHS strongly increased settlement at the southern NSW region of Merimbula and into Victoria.

TAKE HOME POINTS FOR DISCUSSION

- Behaviour influences settlement patterns (strong currents make it hard to find statistical differences, but the patterns are different). Especially settlement success.
- Including OHS seems to be important to settlement patterns
- OVM didn't have as big as effect as possible
- Effects can be regional (important to remember if only releasing from one point)

## Ontogenetic vertical migration scenarios

Serranidae, an OVM pattern where postflexion larvae migrate downwards had the highest settlement diversity (@tbl:metrics). This strategy of migrating downwards with ontogeny below 50 m, most pronounced in Serranidae and Scorpaenidae, increased self-recruitment, local retention, settlement success, and lowered the dispersal distance. This pattern contrasted with Mullidae larvae that migrated upwards towards the surface during postflexion, which produced the least diverse patterns of settlement. Staying close to the surface lowered self-recruitment (F~6,96~ = 31.10, p \< 0.05), local retention (F~6,96~ = 40.90, p \< 0.05), settlement success (F~6,96~ = 42.84, p \< 0.05), and increased the dispersal distance of the larvae (F~6,96~ = 63.25, p \< 0.05; @tbl:metrics). The settlement patterns of different larval migration strategies by source region were not significantly different from each other (F~model(6,112)~ = 0.12, p > 0.05, r^2^=0.01; @fig:nmds-ovm). Mullidae were the only pattern that were able to settle at the distant rocky reefs of Lord Howe Island (@fig:ovm-ca). The deeper strategy used by Serranidae increased settlement at the Tweed in northern NSW, with the equal highest settlement overall with Scorpaendiae, but also had the highest dispersal distance. Patterns clustered together with similar migration strategies (@fig:cluster b).

SR
model           6    96  31.10362  <.0001
labridae      mullidae pomacentridae      scaridae  scorpaenidae
     "b"           "a"           "b"          "bc"          "cd"
serranidae  synodontidae
     "d"           "b"

SS model           6    96  42.83704  <.0001
     labridae      mullidae pomacentridae      scaridae  scorpaenidae
               "b"           "a"          "cd"          "bc"          "de"
        serranidae  synodontidae
               "e"           "c"
LR
model           6    96 40.90339  <.0001
               labridae      mullidae pomacentridae      scaridae  scorpaenidae
                      "b"           "a"           "b"           "b"           "c"
               serranidae  synodontidae
                      "c"           "b"

DK
model           6    96  63.25106  <.0001

                      labridae      mullidae pomacentridae      scaridae  scorpaenidae
                             "d"           "e"           "d"           "c"           "b"
                      serranidae  synodontidae
                             "a"          "cd"


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
