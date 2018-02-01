# CHAPTER 3: Comparing the influence of the implementation of different larval behavioural strategies on connectivity patterns in biophysical dispersal models

## Introduction

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

2. To investigate how different implementation methods (modelling choices) and strategies (reflecting species differences) of ontogenetic vertical migration affect connectivity patterns.


The more I think about it…I think you might want to combine these two aims.  So the aim would be to evaluate the impact of OVM implementation strategy, method and parametrization, on patterns.  You know there is likely to be differences in patterns based on parameters used, i.e. for different speices…but the issue is that there are also different ways of implementing OVM in a biophysical model. You want to know how much patterns are affected by the method as opposed to parameters to know if this is important.  If variability is mainly from params, that’s fine and good to know…but if its from method then we need to suggest what is best and probably be doing the same thing.

Hypothesis:
1. Compared to passive practice, should reduce SR, increase LR, reduce DD
  i. Comment on effect of different types of flow regimes on the differences?
2. The patterns should differ as places within the water column change the currents the larvae are moved by
3. There should be an effect, but is predicted to be minimal [Why?]

## Methods

### Model development

[Build a flow diagram.]

The biophysical dispersal model—Zooplankton Interconnections and Source-Sink Observation Utility [ZISSOU, v1.1.3; http://github.com/shawes/zissou]—is an individual-based model (IBM) developed in accordance with recommendations from the “Manual of recommended practices for modelling physical-biological interactions during fish early life” [@north2009]. Movement of particles within the model is forced by offline oceanographic current data but can be influenced by larval behavioural traits parameterised using probability distributions capturing known biological variability. The system was designed for high-performance, high customisation, and platform independence; written in the language Scala (v2.12.4; http://www.scala-lang.org) using parallel libraries for scalability.

#### Physical sub-model

ZISSOU accesses ocean circulation or hydrodynamic data as network common data forms (NetCDF); self-describing, machine-independent data formats. The data can be accessed either using locally stored files or using the Open-source Project for a Network Data Access Protocol (OPeNDAP; http://www.opendap.org). This project took advantage of Java NetCDF software libraries developed by UCAR/Unidata (http://doi.org/10.5065/D6H70CW6). The ocean data must be in an Arakawa-A or Arakawa-B grid structure [@arakawa1997]. Currently ZISSOU utilises the 3-dimensional velocity fields of hydrodynamic models only, with environmental variables such as salinity or temperature to be incorporated into future versions.

Runge-Kutta fourth-order integration (RK4) is the ordinary differential equations solver used to move the particle through space and time [@north2009], calculating a weighted average of four increments using the chosen model time-step (@eq:rk4). The velocity at any given position in space is interpolated using a tri-cubic interpolation scheme on the hydrodynamic model grid, such that the velocity for a given particle in the oceanographic space is interpolated from neighbouring grids using 64 points (4 x 4 x 4; @eq:interpolation). If this is not possible, for example due to boundary conditions, trilinear interpolation using 8 points (2 x 2 x 2) is substituted.

$$f(x,y,z)=\sum _{{i=0}}^{3}\sum _{{j=0}}^{3}\sum _{{k=0}}^{3}v_{{ijk}}x^{i}y^{j}z^{k}$${#eq:interpolation}

The velocity *v* at the point *(x,y,z)*, where *x* is the longitude, *y* is the latitude, and *z* is the depth is interpolated using the 64 nearest neighbours.

$$\overrightarrow{v_{t+h}} = \overrightarrow{v_{t}} + \frac{1}{6} (k_{1} + 2k_{2} + 2k_{3} + k_{4})h$${#eq:rk4}
$$k_{1} = f(x_{0(t)},y_{0(t)},z_{0(t)})$$
$$k_{2} = f(x_{1(t + \frac{1}{2}h)}, y_{1(t + \frac{1}{2}h)}, z_{1(t + \frac{1}{2}h)})$$
$$k_{3} = f(x_{2(t + \frac{1}{2}h)}, y_{2(t + \frac{1}{2}h)}, z_{2(t + \frac{1}{2}h)})$$
$$k_{4} = f(x_{3(t + h)}, y_{3(t + h)}, z_{3(t + h)})$$

The integrated velocity vector (*v~t+h~*), at time *t* and time step *h* is calculated using the weighted average of the four seperate interpolations (*k~1~, k~2~, k~3~, k~4~*), which interpolate the velocities at the beginning of the time step, two midpoint approximations and the end of the time step. The tri-cubic interpolation function *f(x,y,z)* calculates the velocities as described above (@eq:interpolation).

To model the natural turbulent effect of ocean systems in a 3D stochastic model, ZISSOU uses a random displacement mechanism [@eq:turb; @brickman2002; @north2009].

$$D_{(h+1)} = D_{(h)} + \overrightarrow{v} +\Delta{h} + \sqrt{\frac{2K}{\Delta{h}}Z}$${#eq:turb}

The displacement *D* is added to the velocity vector *v* from the hydrodynamic model, the time step *Δh*, the eddy diffusivity *K* and a random number *Z* from a Gaussian distribution with a mean of zero.

Psuedo-random numbers are generated in the model using a Mersenne Twister algorithm, WELL44497b [@panneton2006]. The seed for the random number generator is an optional parameter of the model to allow for reproducibility of results if needed.

#### Biological sub-model

Biological traits are specified using a configurable XML file as input to the model. The biological model implements many biological processes that are considered to be important for marine larval dispersal, e.g. the spawning period, pelagic larval duration (PLD), and vertical migration (@tbl:bio-params). The pelagic larval duration is specified by the length of the larval period in days. Larvae can be assigned a non-settlement competency period, whereby they cannot settle before a specified number of days, otherwise they attempt to settle upon reaching their PLD. Spawning sites are given as GPS locations (latitude and longitude in decimal degrees), with spawning time and frequency, the spawning depth in the water column, and the number of larvae to spawn, are being options which can be tailored to the modelled marine species. The particles seeded in the model are referred to as larvae, but can also simulate pelagic eggs through the inclusion of a specific age stage. The ichthyoplankton developmental stages (hatching, preflexion, flexion, postflexion) are based on a description of the mean (± standard deviation) age (in days) of larvae of each stage. From this input, stage transition ages (day at which the larvae transitions from one developmental stage to another) are assigned to individual larvae at birth using a Gaussian distribution (if no standard deviation is specified, the mean is the value).

: Summary of the biological and behavioural traits that can be specified in the biological sub-model. {#tbl:bio-params}

| Trait  | Options  |  Description | Units |
| --|---|--- | ----|
| Pelagic larval duration  | - | Larvae assigned a PLD using a given mean and standard deviation with a Gaussian distribution) | Days (Gaussian)
| Non-settlement competency period  | - | Larvae are allowed to settle at a suitable habitat if they are older than a specified non-settlement period  |  Days (Gaussian)
| Development age   | Preflexion  | Age of preflexion development (hatching from eggs). If this value is greater than 0, the first period the larvae are considered to be pelagic eggs. | Days (Gaussian)
|  | Flexion  | Age of flexion development  | Days (Gaussian)
|  | Postflexion  | Age of postflexion development | Days (Gaussian)
| Spawning sites  | Location  | The latitude and longitude of larval release location  | GPS Coordinates
|  | Depth  | The depth the larvae are spawned  |  Metres
|  | Number | The number of larvae to spawn  |  Positive integer
|  | Period  | The period to release the larvae over  | Date range
|  | Interval  | The number of days between releases  | Days (e.g. 1 = daily, 7 = weekly)
| Settlement sites  | - | The sites of settlement for the larvae given as GIS polygons  | GIS Shapefile
| Mortality  | Linear  | The percentage of larvae to be randomly killed each day  | Rate (% per day~-1~)
| Vertical migration  | Diel  | Vertically migrates the particles twice daily at sunset and sunrise  | Probabilities of the larvae being found at user specified depths during the day or at night
|  | Ontogenetic  | Vertically migrates the fish based to another depth on their ontogenetic stage  | Probabilities
| Settlement sensory distance  | - |  The distance at which a larva can sense a reef to settle  | Kilometres
| Olfactory distance  | - | The distance at which a larva can sense a reef and orientate towards it | Kilometres
| Horizontal swimming  | Critical swimming speed (*U~crit~*)  | The speed at which a fish can swim before it fatigues as measured in a laboratory setting | ms~-1~
|  | In situ swimming speed  | The swimming speed of the fish larvae recorded by divers *in situ* as a proportion of the *U~crit~* |  Proportion
|  | Swimming endurance  | The proportion of time the fish can spend swimming  | Proportion

Settlement sites are represented as GIS polygons within the model, using point in polygon algorithms to determine if larvae are over settlement sites. The polygons are supplied as input in the Shapefile format, a common geospatial vector data format specified by the Environmental Systems Research Institute (Esri; https://www.esri.com/library/whitepapers/pdfs/shapefile.pdf). Larval mortality can be included in the model, specified as a percentage daily rate of mortality applied randomly across the population, a common approach amongst connectivity studies [@butler2011; @kool2011; @treml2015]. Note however for the simulations described in this chapter, no mortality was applied due to the aim of comparing patterns of potential connectivity.

Several behavioural traits for larvae are able to be included in the model including orientated horizontal swimming, vertical migration, and the ability to sense suitable settlement sites (@tbl:bio-params). Vertical migration can be implemented as either diel or ontogenetic vertical migration. Both are based on the probability of being in a specific depth range based on either the time of day (i.e. night or day), or their ontogenetic stage (@fig:ovm-example). The vertical position of a larvae was changed by applying a probability distribution function to determine to which depth the larvae moved. For diel vertical migration this probability distribution function was applied one hour before sunset or sunrise using an approximation calculated using the current latitude / longitude of the larvae.

For ontogenetic vertical migration, there are three choices for the timing of migration; vertically migrating when the next developmental stage is reached [@garcia-garcia2016], daily migration [@puckett2014], or at each time step [within chosen constraints of movement; @paris2007]. Moving larvae vertically with the onset of ontogenetic stage is the simplest, but creates a stratified larval distribution, assuming a gradual migration strategy with ontogeny. Vertically migrating them every day or time-step creates more random process with a centre of mass at specific depths, and the migration is restricted to distributions based on their ontogeny. These strategies allow for modelling vertical behaviour whereby different species of ichthyoplankton change vertical position restricted or unrestricted by depth.

![Example of ontogenetic vertical migration input for a fish than migrates downwards with ontogeny, where the proportions of larval occurrence at different depths are specified for each stage (preflexion, flexion, and postflexion), and must add up to one for each developmental stage](chapters/theoretical/figs/ovm-example.png){#fig:ovm-example}

The fish larvae can be given a settlement sensory distance which allows them to discover a settlement habitat if that pass within the distance, acting as pseudo-behaviour for cues such as vision, hearing or olfaction [@leis2006; @kingsford2002]. The nearest point on the reef polygon is identified and then the distance is compared to the larva's current position. If there is no settlement site within the distance, then the larvae keeps moving. Olfactory distance works similar to settlement sensory, allowing the larvae to orientate towards the nearest settlement habitat if it is within the specified distance. Reef fish larvae have been shown to smell reefs from distances of several kilometres [@paris2013b]. Larvae can be given a horizontal swimming speed, which if the larvae are within an olfactory distance of a reef, the speed is added to the velocities *u* and *v* with the direction of the reef (@eq:u; @eq:v). The horizontal swimming speed is calculated using the known critical swimming speeds, the *in situ* swimming potential and the swimming endurance of the larvae at postflexion (@eq:swim). Critical swimming speed, *U~crit~*, is a measure of the swimming capacity of the larvae and useful as is not difficult to obtain [@hogan2007], the *in situ* swimming speed which is a measure of larval fish swimming in the ocean by divers and correlated with *U~crit~* [@leis2006a], and endurance is a measure of how long they can keep swimming before tiring. ZISSOU constrains the *U~crit~* speed by known *in situ* speeds for the species, generating a swimming speed between the *U~crit~* as the maximum speed and *in situ* as the minimum speed. Endurance is applied as the proportion of time the larvae can continue swimming per time step.

$$u^{\prime} = u + s \times \cos(\theta)$${#eq:u}

$$v^{\prime} = v + s \times \sin(\theta)$${#eq:v}

$$s = U_{crit} \times X_{[S_{p},1]} \times E_{p}$${#eq:swim}

*U~crit~* is the critical swimming speed (ms^-1^), *X* is a random number with a distribution contrained by a minimum *S~p~*, which is is the *in situ* swimming potential (expressed as a proportion of *U~crit~*) and the maximum of 1, and *E~p~* is the endurance potential (proportion of time step it is expected to swim) of the fish larvae. \theta is the orientated angle towards a sensed settlement habitat.

### Model configuration

#### Study location

The New South Wales (NSW) coastline (2,137 km) was divided into approximately 17 equally sized regions (approximately 125 km each). Rocky reef patches were identified using freely available benthic data obtained from NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). Within each sub-region, four rocky reef patches (approximately X m^2^ each) from across the sub-region were chosen as spawning sites. Larvae were released weekly from the centre of each spawning site in batches of 1000 over the period July 2007 to June 2008. In total 3.5 million larvae were released. Larvae were allowed to settle to the identified rocky reef patches or benthic habitat patches marked as unknown, as unmapped patches could be potential rocky reef settlement sites.

![The 17 regions (each containing four rock reef patches) used to spawn the reef fish larvae along the coastline of New South Wales, Australia](chapters/theoretical/figs/release-sites.png){#fig:release-sites.png}

#### Physical sub-model

The oceanographic circulation model used was BRAN3 [Bluelink renalysis, version 3p5; @oke2013], a hindcast model based on the Ocean Forecasting Australia Model (OFAM). BRAN is a data-assimilating model that aims to resolve mesoscale eddies in 3-dimensions, at the scale of 10 km in the horizontal (0.1° latitude and longitude) and 5-10 m vertically (15 depth bins between 0 and 105 m). The model consists of mean daily current velocities, sea-level anomaly, sea-surface temperature, and salinity over the period January 1993 to September 2012. An eddy diffusivity value *K* of 300 ms^-1^ was used, as per similar studies in the region [@condie2016, @chiswell2011]. The time-step of the model was two hours.

#### Biological sub-model

Model parameters are based on characteristics of a temperate rock reef fish from the family Pomacentridae (Damselfishes). We chose this group as it is relatively well studied, thus providing reasonable estimates of the various parameters required for modelling. The literature on early-life fish histories is biased towards tropical and sub-tropical species, therefore where values for temperate Pomacentridae were not found, information of tropical larvae was utilised (@tbl:bio-params). An individual larvae only settled at the end of their pelagic larval duration if it was within the settlement sensory distance of suitable settlement habitat. The larvae were spawned in the preflexion stage, assuming a species with benthic eggs which is common for Pomacentridae. The lack of velocity data near the coast is an inherent property of the grid structure of the flow model but one that limiting the ability of fish to settle on some reef patches. In order to compensate for this as well as the coarse 10 km resolution of the oceanographic model, larvae were given a settlement sensory zone of 10 km with which to sense settlement reef habitat, which was slightly larger (but within one standard deviation) than the mean settlement sensory zone of 8.3 km (± 5.2) identified in the review of existing studies presented in Chapter 2 (@tbl:bio-base).

: Biological features of the Pomacentridae larvae that were used in every model run of the experiment {#tbl:bio-base}

| Biological feature          | Value                    |
|-----------------------------|--------------------------|
| PLD                         | 18.3 (± 1.5) days [^well] |
| Preflexion age              | 0 days [^murph]          |
| Flexion age                 | 5 (± 0.5) days [^murph]   |
| Postflexion age             | 8 (± 0.5) days [^murph]   |
| Settlement sensory distance | 10 km [^chap2]           |

[^well]: [@wellington1989]
[^murph]: [@murphy2007]
[^chap2]: Based on review in Chapter 2
[^leis]: [@leis2006a]
[^gray]: [@gray1998]


[I think its worth defining a term here to describe these things…here’s my stab at it.  You should use the term in chapter 3 as well.  Then use it above when describing OVM and, if you make the figure I suggested, use it there as well.  This will allow you have a term which essentially describes this multi-dimensional parameter which is fundamental to the OVM behavior in the model.]

In order to address the first aim of evaluating the influence of different behaviours on connectivity patterns I ran a series of models to compare patterns resulting from the implementation of 1) restricted or unrestricted vertical movement by currents, 2) diel vertical migration (DVM), 2) ontogenetic vertical migration (OVM), and 3) orientated horizontal swimming (OHS) implemented. Each behaviour (and combination of congruent behaviours) was compared to a base case of passive restricted transport where the larvae are only allowed to change their horizontal position (scenario 1; @tbl:scenarios-behaviour).

: Ten models with combinations of the four different behavioural scenarios were used to test the effects of the four behaviours; No behaviour or orientated horizontal swimming and restricted to moving horizontally or allowed to be advected by the vertical velocity component (models 1,2,5,6), diel vertical migration (DVM; models 3,7,8,10), ontogenetic vertical migration (OVM; models 4,7,9,10), and orientated horizontal swimming (OHS, models 5,6,8,9,10). {#tbl:scenarios-behaviour}

| Model | Restricted | DVM | OVM | OHS |
|:--------:|:----------:|:---:|:---:|:---:|
|    1     |    Yes     |  —  |  —  |  —  |
|    2     |     No     |  -  |  -  |  -  |
|    3     |            | Yes |  —  |  —  |
|    4     |            |  —  | Yes |  —  |
|    5     |    Yes     |  —  |  —  | Yes |
|    6     |     No     |  -  |  -  | Yes |
|    7     |            | Yes | Yes |  —  |
|    8     |            | Yes |  —  | Yes |
|    9     |            |  —  | Yes | Yes |
|    10    |            | Yes | Yes | Yes |

The first behavioural scenario compares the difference between larvae that are advected with (unrestricted) our without (restricted) the vertical or *w* component of the current velocities. This scenario only applies to models with no other vertical migration component, as DMV and OVM change the vertical position after it has been advected by the *w* vector (@tbl:scenarios-behaviour). For the second scenario, the larvae were given the DVM probabilities for Pomacentridae derived from an ichthyoplankton study in the same oceanic region [@gray1998]. Larvae were migrated using probability distribution function between 25 m bins within the top 100 m of the water column (@tbl:dvm). The OVM strategy used the values for OVM distribution values for Pomacentridae larvae observed in the empirical study described in Chapter 3 (see Supplementary Table @tbl:scenarios-ovm). The larvae centre of mass moves downwards from the surface during preflexion, to commonly the top 50 m during postflexion. For the OHS scenario, to orientate and swim towards a reef, the larval fish were given an reef sensory range of 10 km, which was the maximum extent used in other studies [@wolanski2014a, @staaterman2012], but we assumed the same sensory cues for the larvae as the settlement sensory extent (@tbl:orientate). The *U~crit~* speed for the larvae was 0.463 ms^-1^, but they were given an *in situ* potential of 25%, therefore the actually swimming speed ranged between (0.463 and 0.116 ms^-1^) and the larvae were able to swim for 50% of the model time step.

: Diel vertical migration (DVM) values used, providing more stratified depth positions during the day and more even distribution at night as seen in temperate fish off NSW [^gray] {#tbl:dvm}

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

: Orientated horizontal swimming (OHS) parameterisation, used in the swimming equation described above {#tbl:orientate}

| OHS feature                  | Value                |
|------------------------------|----------------------|
| Sensory distance             | 10 km [^chap2]       |
| *U~crit~*                    | 0.463 ms^-1^ [^leis] |
| *In situ* swimming potential | 25% [^leis]          |
| Endurance                    | 50% [^leis]          |

The second aim, to assess the impact on connectivity of using different ontogenetic vertical migration parameters was addressed by conducting model runs using proportional depth stage abundance profiles which represented the seven fish families studied in Chapter 3 (@fig:scenarios-ovm; for the actual values see Supplementary Table @tbl:scenarios-ovm). Ontogenetic vertical migration was implemented such that the larvae moved when they reached their next ontogenetic stage (based on developmental time). Lastly, in order to explore the impact of the OVM implementation strategy on connectivity patterns I compared three different methods of ontogenetic vertical migration (@tbl:scenarios-impl).

![Proportional depth stage abundance profiles for each of the seven fish families evaluated in Chapter 3. Values represent the proportional (within a stage) abundance of each ontogenetic stage (preflexion, flexion, postflexion) within each of three depth ranges (surface: 0-5 m; middle: 6-50 m; deep layer: 51-100 m) and are used to parameterise models run to address Aim 2 of this study.](chapters/theoretical/figs/ovm-strategies.png){#fig:scenarios-ovm}

: The three different scenarios for implementing ichthyoplankton ontogenetic vertical migration (OVM) in the biophysical dispersal model {#tbl:scenarios-impl}

| Model | OVM migration timing |
|-------|----------------------|
| 1     | Time step migration  |
| 2     | Daily migration      |
| 3     | Stage migration      |

### Data analysis

[Is that correct, as the way you’ve written it could mean something else.  So I would think if you relased 10,000 larvae from i and 200 settled at j, then the number would be 200/10,000.  But as you wrote it it could mean the proportion (out of all spawned larvae) that were spawned at i and settled at j.  That would be 200/Total larvae spawned]

[These are not clear enough.  I’ve had a go at clarifying but I’m not sure I actually got it right, so check that.  Ideally you want to probably have a section where you talk about univariate metrics and one where you look at multivariate.]

Each individual model run produced as output a connectivity matrix, which represents the connectivity between larval source (row~*i*~) and settlement (column~*j*~) regions where each element~*i,j*~ is the proportion of all larvae spawned at *i* which settled at *j* over the release period. Several univariate measures were extracted from each matrix: settlement site richness (the number of reefs receiving settlers), Shannon-Weiner diversity of settlement (using number of reefs and total larvae settled per reef), self-recruitment, local retention, settlement success, dispersal distance (see Definitions), and connectance (the proportion of the edges connecting natal and settlement sites in a graph compared to the theoretical maximum number of edges). Differences between model scenarios were assessed by comparing each metric amongst different sets of matrices (depending on the aim) with regions (n = 17) as replicates in one-way repeated measure ANOVAs, to account for the regional oceanographic variation in each model. Tukey's HSD post-hoc pairwise tests were used to assess differences amongst regions where ANOVAs were significant (\&alpha = 0.05).

Multivariate comparisons of connectivity matrices were made using non-metric multidimensional scaling (NMDS) which allowed for the assessment of the relative similarity of regional patterns (replicates) across different model scenarios (variables). I used the Bray-Curtis dissimilarity measures to get distance matrices and applied a square root transform to down-weight the influence of highly abundant areas of settlement. There were strong differences in settlement patterns for the different regions due to variations in regional oceanography. These differences are interesting but can serve to swamp the more pertinent comparisons between models. In order to capture these differences between models more explicitly raw settlement proportions were standardised by settlement proportion values from the passive restricted (no behaviour or vertical migration) connectivity matrix. PERMANOVA was used to test for differences between the multivariate settlement patterns of models in each scenario. Constrained Analysis of Principal Coordinates (CAP)—constrained coordinates analysis allowing non-Euclidean distances—was used to compare the dissimilarity between models within each scenario [@anderson2003]. Cluster analysis (using an average-link clustering method with a Bray-Curtis dissimilarity measure) and constrained coordinates analysis (CCA; using Euclidean distance metrics) were used to compare models using the total settlement.

All data analysis was performed using the R statistical programming environment [v3.4.3; @rcoreteam2017]. Some additional packages were used for analysis; *ConnMattTools* [@connmattools-paper] to obtain connectivity metrics, *igraph* [@csardi2006] and *NetIndices* [@kones2009] to construct the graphs and obtaining measures of connectance, and *vegan* to calculate dissimilarity matrices, NMDS, PERMANOVA (using the *adonis* function), and CAP analysis [@oksanen2018].

## Results

Figures should be cited in the order in which they appear in the text.

You have an issue here in that youi have these specific aims which seem separate but then the first thing you do is compare across them. This comparison is good but you need to rethink how you’ve laid out your analysis then.

Maybe the way to go here is to restate the aim a bit more integrated.  So you are looking to evaluate the impact on connectivity patterns of 1) different behaviours and 2) specifically the implementation strategies and parameters of OVM.

Then when you describe your analysis, after you give a general overview of your approach to comparing these complex data sets from each model run you can say that your structure your analysis to:

1.	 Compare overall effects on connectivity of all models to understand how patterns are affected by different behaviours and the nuainces of OVM integration.  How do those nuances compare to the more general question of which behaviours to inclue.
2.	Evaluate behaviour diffs more specifically
3.	Evaluate OVM diffs more specifically.

Note you could perhaps go the other way around…look at specific diffs first and then pull it all together to put it in context.


### Comparison of behavioural scenarios

#### Connectivity patterns from source to settle regions

Considering the patterns from each source region to each settlement region (standardised by the restricted passive model), the variation between settlement patterns appeared to be principally driven by regional differences in hydrodynamics (@fig:behaviour-nmds). There was no significant difference between behavioural models (F~model(9,169)~ = 1.19, p > 0.05, r^2^ = 0.06), and it explained only a small amount of variation. Again, the models with OHS clustered together for each source region and were more similar than the other models. The model with only DVM showed the most dissimilarity to all other behavioural models (@fig:behaviour-nmds). The effect of behaviour on settlement patterns also varied between regions; region 5 had large dissimilarities between all the behaviours, contrasting with region 6, where the settlement patterns were more similar. Regions also varied the dissimilarity between models, regions 1 and 2 had similar groupings of settlement patterns for models including OHS, yet the differences between DVM+OVM+OHS and DVM+OHS was greater for region 2 (@fig:behaviour-nmds).

![NMDS ordination plot (2D stress = 0.06) using Bray-Curtis dissimilarities between the different source-settlement patterns for each of the 17 source regions for the models within the behaviour scenario (Passive = no behaviour, Surface = restricted to horizontal movement only, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming).](chapters/theoretical/figs/phase1-all-nmds.png){#fig:behaviour-nmds}

[Insert writing about the CAP]




![Constrained analysis of principal coordinates (CAP) for the models within the behaviour scenario using Bray-Curtis dissimilarities between the different source-settlement patterns for each of the 17 source regions. (Passive = no behaviour, Surface = restricted to horizontal movement only, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming)](chapters/theoretical/figs/phase1-cap.png){#fig:behaviour-cap}

#### Total settlement at each region

Comparing the behaviours using similar patterns of total settlement, cluster analysis of the settlement regions by behavioural models produced two distinct clusters: models with and without orientated horizontal swimming (OHS; @fig:cluster A). Within the OHS cluster, models without vertical migration behaviour, but restricted or unrestricted were highly similar. The models with ontogenetic vertical migration (OVM) and OHS were more similar than models with diel vertical migration (DVM) and OHS.  In the non-OHS cluster, the most dissimilar model was DVM. The models with no behaviour grouped together and the models with OVM (@fig:cluster A). Restricting larvae to the surface or not (passive or passive-surface), was as dissimilar to each other as using OVM or including OVM and DVM. However, if OHS was added to the OVM model—as seen in the OHS cluster—then the dissimilarity of settlement patterns with including DVM or not was reduced.

![Cluster analysis using the total settlement at each region of the behaviour (A; Passive = no behaviour, Surface = restricted to horizontal movement only, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming) and ontogenetic vertical migration (OVM) strategies (B), and OVM methods (C) using a Bray-Curtis dissimilarity measure and clustered using the average-link method.](chapters/theoretical/figs/cluster.png){#fig:cluster}

Dissimilarities between behaviour scenario models was explained by many different settlement regions (@fig:behaviour-cca). Strong settlement to the Tweed region explained the dissimilarities for DVM models (excluding DVM+OVM) and OHS models. OHS also caused stronger larval settlement at Victoria, Merimbula, and Ballina, and weaker larval settlement at the regions Solitary Islands and Nambucca. Complementary to this, Nambucca and Solitary Islands were strong settlements regions for models with vertical migration or no behaviour (@fig:behaviour-cca).

![Constrained correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the behaviour scenarios](chapters/theoretical/figs/phase1-cca.png){#fig:behaviour-cca}

#### Connectivity metrics

Including behaviour in models increased the self-recruitment compared to no behaviour (F~9,144~ = 12.31, p \< 0.05), except for the behaviour OVM unless it was combined with another behaviour (@fig:conn-metrics A). DVM and DVM-OHS produced the highest mean self-recruitment values for each region. Similarly local retention increased when including all behaviours except OVM (unless coupled with OHS; F~9,144~ = 79.24, p \< 0.05; @fig:conn-metrics B). Larvae that were passive with no vertical restriction or exhibited OVM behaviour produced the least variable local retention between regions, while changes in local retention attributed to DVM behaviour appeared to be highly region specific. Settlement success was significantly increased, approximately 20%, when OHS was included with either DVM, OVM or a combination of both compared to a model with no behaviour (F~9,144~ = 95.02, p \< 0.05; @fig:conn-metrics C). Including either OVM or DVM+OVM did not change the settlement success significantly compared to passive larvae. Larvae with no behaviour dispersed the longest (F~9,144~ = 66.33, p \< 0.05), suggesting behaviour constrains the dispersal kernel of larvae. Models with OHS behaviour included had the lowest dispersal distances, approximately 40% the distance that passive larvae dispersed until settlement (@fig:conn-metrics D).

![The connectivity metrics of mean self-recruitment (%; A), local-retention (%; B), settlement success (%; C) and dispersal distance (km; B) for each region, as measured for each modelling scenario grouped by the three aims; behaviour (Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming), OVM strategy, and OVM method. The whisker plots denote the mean, one standard deviation either side of the mean and min/max values.](chapters/theoretical/figs/conn-metrics.png){#fig:conn-metrics}

Settlement richness, i.e. the number of sites settled to, was changed when behaviour was added to a model (F~7,112~ = 17.94, p \< 0.05; @fig:settle-metrics A). The settlement diversity similarly changed with behaviour (F~7,112~ = 52.99, p \< 0.05). The pattern was the same as with richness, but more pronounced, with OHS reducing the number of settlement sites and abundance of settlers across sites (@fig:settle-metrics B). DVM+OHS produced the greatest differences in settlement diversity, while DVM+OHS had the least variation between regions. Maximum connectance was achieved by including OVM behaviour, but all over behaviour combinations reduced the connectance of the models compared to no behaviour (@fig:settle-metrics C). Models with OHS had the lowest connectance values for models including behaviour.

![The metrics of mean settlement richness (A), settlement diversity (measured using Shannon-Weiner; B), and connectance (a measure of describing the proportion of all links between the natal and settlement sites that are realised; C) for each region, as measured for each modelling scenario grouped by the three aims; behaviour (Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming), OVM strategy, and OVM method. The whisker plots denote the mean, one standard deviation either side of the mean and min/max values.](chapters/theoretical/figs/settle-metrics.png){#fig:settle-metrics}

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

![Constrained analysis of principal coordinates (CAP) for the models within the ontogenetic vertical migration strategies (of seven reef fish families) scenario using Bray-Curtis dissimilarities between the different source-settlement patterns for each of the 17 source regions.](chapters/theoretical/figs/phase2-cap.png){#fig:ovm-cap}

![Constrained correspondence analysis of the total settlement patterns to each region along NSW for each of the different models for the ontogenetic vertical migration strategies](chapters/theoretical/figs/phase2-cca.png){#fig:ovm-ca}

Considering different methods of OVM, there were significant differences between self-recruitment (F~(2,32)~ = 5.68, p < 0.05), the daily method having lower self-recruitment than stage based migration (@fig:conn-metrics A). Time-step migration had the lowest mean local retention (F~(2,32)~ = 9.83, p < 0.05; @fig:conn-metrics B) and settlement success (F~(2,32)~ = 32.48, p < 0.05; @fig:conn-metrics C) between the OVM methods. The daily and time step methods both significantly dispersed further than the stage OVM method (F~(2,32)~ = 11.00, p < 0.05; @fig:conn-metrics D). The variation of dispersal distance for the daily OVM method had a standard deviation estimated to be 30% greater than the other methods. OVM methods did not have an effect on settlement site richness (F~(2,32)~ = 1.04, p \> 0.05; @fig:settle-metrics A), there was an effect on diversity (F~(2,32)~ = 11.02, p < 0.05; @fig:settle-metrics B). This effect was caused by the OVM method of daily migration, which had lower settlement site diversity than the other OVM methods. However, the daily method of migration had the highest value of connectance (@fig:settle-metrics C).

The method of migrating daily produced significantly different settlement patterns from all regions compared to the time-step or staged based methods (F~model(2,48)~ = 2.96, p < 0.05, r^2^ = 0.11; @fig:impl-nmds). Ontogenetically migrating larvae daily produced distinctly different patterns to stage and time step migration at the southern latitude source regions of Wollongong, Ulladulla, Jervis Bay, and Batemans Bay. Crowdy Bay and Nambucca, central latitudinal sites produced large variation between all three methods, while only Pt Macquarie and Pt Stephens produced similar settlement patterns for each OVM method. The strongest settlement variation occurs at the Tweed, where settlement is increased when the stage OVM migration method is used (@fig:impl-ca). Daily migration produces stronger settlement at Sydney, Pt Macquarie, and Yamba, whereas time-step migration has the most pronounced settlement at Eden and Solitary Islands. Each method has dissimilar settlement patterns, and clustered into three groups (@fig:cluster C).

![nMDS ordination plot using Bray-Curtis dissimilarities between the different source-settlement patterns of each NSW region for each model within the different ontogenetic vertical migration methods (2D stress = 0.08)](chapters/theoretical/figs/phase3-all-nmds.png){#fig:impl-nmds}

![Constrained analysis of principal coordinates (CAP) for the models within the ontogenetic vertical migration methods (stage-based, daily, and time-step) scenario using Bray-Curtis dissimilarities between the different source-settlement patterns for each of the 17 source regions.](chapters/theoretical/figs/phase3-cap.png){#fig:impl-cap}

![Constrained correspondence analysis of the total settlement patterns to each region along NSW for each of the different implementation methods (stage-based, daily, and time-step) of ontogenetic vertical migration in the biophysical dispersal model](chapters/theoretical/figs/phase3-cca.png){#fig:impl-ca}


TAKE HOME POINTS FOR DISCUSSION

- Migrating downwards increased self-recruitment and local retention
- Staying high in the water column spreads the dispersal distance (trade off)
- Implementation does make a difference, more so than strategy (and more unpredictable)

### Overall context

The settlement patterns of behaviour were more dissimilar to each other than the OVM methods or strategies (@fig:nmds). The behaviours with OHS and DVM were different to the behaviours including OVM or no behaviour. The variation between settlement patterns for OVM strategies and OVM methods were considerably smaller than those exhibited between the different behavioural choices. Although the dissimilarities between OVM methods were twice the dissimilarities measures seen between OVM strategies (@fig:cluster), they were at most 30% of the differences observed. The OVM method of migrating every time-step appeared to produce the same total settlement patterns as having no behaviour (@fig:nmds). The model including DVM+OVM produced similar total settlement patterns to the Serranidae OVM strategy. The OVM strategies stretch across an axis from Mullidae (most in the surface) to Serranidae and Scorpaenidae (most in the 50-100 m waters).

Differences in behaviour were more influential in determining the settlement richness, diversity, and connectance between regions (@fig:settle-metrics). Diversity was impacted more by changes in OVM method than the strategy choice (@fig:settle-metrics B). Similar trends were seen in amongst the connectivity metrics, where different behaviours effected the metrics more than changes within OVM strategy or OVM methodology (@fig:conn-metrics). The one exception is dispersal distance, which also exhibited variation with both different OVM strategies and methodologies (@fig:conn-metrics D).

![Constrained correspondence analysis of the total settlement patterns for each scenario within each of the treatments; behaviour (Passive = no behaviour, DVM = diel vertical migration, OVM = ontogenetic vertical migration; OHS = orientated horizontal swimming), ontogenetic vertical migration (OVM) strategy (strategies based on seven reef fish families), and OVM method (the larvae migrate at the time step (2 hours), daily, or stage based migration such that the larvae migrate vertically when the next ontogenetic stage is reached). The first two axis explain 97.0% of the inertia.](chapters/theoretical/figs/all-nmds.png){#fig:nmds}


## Discussion

### Behaviour

- metrics OVM (this strategy) did not increase retention?
### OVM strategy


### OVM method


### Comparison


### Furture direcitions (i.e. what to model)



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
