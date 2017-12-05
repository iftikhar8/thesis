# CHAPTER 3: Comparison of how parameter choice of behaviours, behaviour strategies and behaviour implementation effect dispersal patterns of biophysical dispersal models

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
1. To investigate how connectivity patterns are affected by diel vertical migration (DVM), ontogenetic vertical migration (OVM), and horizontal orientated swimming
2. To investigate how different strategies of ontogenetic vertical migration patterns of reef fish effect connectivity dispersal patterns
3. To investigate how different implementation methods of ontogenetic vertical migration affect connectivity dispersal patterns.

Hypothesis:
1. Compared to passive practice, should reduce SR, increase LR, reduce DD
2. The patterns should differ as places within the water column change the currents the larvae are moved by
3. There should be an effect, but is predicted to be minimal.

# Methods

## Model development

[Worth building a flow diagram?]

The biophysical dispersal model—a Zooplankton Interconnections and Source-Sink Observation Utility (ZISSOU, v1.1.3 [github.com/shawes/zissou])—is an individual-based model (IBM), whereby each larva moves independently to each other in the model system. Each particle in ZISSOU has biological traits and behaviours using populations level distributions capturing the biological variability. The system was designed for high-performance, high customisation, and platform independence; written in the Scala programming (v2.12.4) language using parallel libraries. ZISSOU was developed using the "Manual of recommended practices for modelling physical-biological interactions during fish early life" [@North:2009tx].

ZISSOU accesses ocean circulation data as network common data forms (NetCDF); self-describing, machine-independent data formats. The data can be accessed either using locally stored files or using the open-source project for a network data access protocol (OPeNDAP; http://www.opendap.org).   This project took advantage of Java NetCDF software libraries developed by UCAR/Unidata [http://doi.org/10.5065/D6H70CW6]. The ocean data must be in a Arakawa-A or Arakawa-B grid structure [CITE arakawa 97]. This version of ZISSOU utilises only the 3-dimensional velocity fields, and not other environmental variables such as salinity or temperature.

Runge-Kutta fourth-order integration (RK4) is used to move the particle through space and time, calculating a weighted average of four increments using the chosen model time-step (@eq:rk4). The velocity at any given position in space is interpolated using a tri-cubic interpolation scheme on the hydrodynamic model, such that the velocity for a given particle in the oceanographic space is interpolated from neighbouring grids using 64 points (4 x 4 x 4). If this is not possible, for example due to boundary conditions, trilinear interpolation using 8 points (2 x 2 x 2) is substituted.

$$y_{i+1} = y_{i} + \frac{1}{6} (k_{1} + 2k_{2})h$${#eq:rk4}

To model the natural turbulent effect of ocean systems in a 3D stochastic model, ZISSOU uses a random displacement mechanism []@eq:turb; CITE Brickman & Smith 2002]

$$D_{(t+1)} = D_{(t)} + \overrightarrow{v} +\Delta{t} + \sqrt{\frac{2K}{\Delta{t}}Q}$${#eq:turb}

The displacement (D) is calculated using the velocity vector (v) from the hydrodynamic model, the time step (Δt), the eddy diffusivity (K) and a random number with a Gaussian distribution with a mean of zero (Q).

Psuedo-random numbers are generated in the model using a Mersenne Twister algorithm, WELL44497b [CITE Paennon]. The seed for the random number generator is an optional parameter of the model to allow for reproducibility of results.

Sites used for both spawning and settlement are represented as polygons within the model. The polygons are supplied as input in the shapefile format, a common geospatial vector data format specified by the Environmental Systems Research Institute [Esri; CITE ESRI].

## Biological traits

Vertical migration can be implemented as either diel or ontogenetic vertical migration. Both use probabilities of being in depth ranges either at a certain time, i.e. night or day, or in depth ranges defined by their ontogenetic stage (e.g. for ichthyoplankton these would be preflexion, flexion, or postflexion). Ontogenetic stages are specific by lengths of time in seconds, which are given gaussian distributions over the population. The vertical position was changed by applying a probability distribution function to determine which depth the larvae moved too. For diel vertical migration this probability distribution function was applied one hour before sunset or sunrise using an approximation calculated using the current latitude / longitude of the larvae.

The horizontal swimming speed is calculated using known critical swimming speeds, the *in situ* swimming potential and the swimming endurance of the larvae at postflexion (@eq:swim). The speed is added to both the *u* and *v* velocities after applying stochasticity (@eq:u; @eq:v). Fish can swim, orientated to the nearest habitat, if they find themselves within a user configured olfactory range.

$$s = U_{crit}S_{p}E_{p}$${#eq:swim}

$$u^{\prime} = u + X_{[0,1]} \times s \times \cos(\theta)$${#eq:u}
$$v^{\prime} = v + X_{[0,1]} \times s \times \sin(\theta)$${#eq:v}

## Model configuration

### Study location

Larvae were spawned from 68 coastal reefs along the New South Wales coast, Australia (Add geospatial data?), using freely available benthic data obtained from NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). The natal reefs were divided into 17 sub-regions, each containing four approximately equally spaced reefs. For each reef 1000 larvae were spawned every 7 days over the period of one year from 1st July 2007 to 31st June 2008. In total 3.5 million larvae were released over the year. No mortality was applied, providing only potential dispersal. Larvae were allowed to settle to reefs or benthic habitat marked as other, as unmapped reefs could be potential settlement sites.

Create diagram using sites and regions. (colour coordinated).

### Physical parameterisation

The hindcast model used was BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], an oceanographic circulation model based on the Ocean Forecasting Australia Model (OFAM). BRAN is a data-assimilating model that aims to resolve mesoscale eddies in 3-dimensions, at the scale of 10 km in the horizontal (0.1° latitude and longitude) and 5-10 m vertically (15 depth bins between 0-105 m). The model consists of mean daily current velocities, sea-level anomaly, sea-surface temperature, and salinity over the period January 1993 to September 2012. An eddy diffusivity value (K) of 300 ms^-1^ was used, as per similar studies in the region [CITE condie, chiswell]. The time-step of the model was 2 hours.

### Biological parameterisation

To populate the parameters of the model, we used characteristics of the small tropical fish, the Indo-Pacific sergeant damselfish *Abudefduf vaigiensis*. It is a common species found all along the coast of  NSW, and one that relatively a lot is known about its early-life history. The larvae were spawned in the preflexion stage (assumed a species with benthic eggs), flexion occurred at 5 (±0.5) days, and postflexion 8 (±0.5) days [CITE Murphy 2007]. The pelagic larval duration (PLD) was 18.3 (±1.5) days [CITE Wellington & Victor], and the duration was fixed, meaning that the simulation ran until the larvae reached their PLD (assigned using a gaussian distribution) and settled if there was an available reef. The larvae were given a sensory zone of 10 km with which to sense settlement reef habitat. This is a generous example of sensory abilities, helped overcome the coarseness of the oceanographic model resolution near the coast, limiting the ability of fish to settle on some reefs. The sensory zone was implemented within the model by finding the distance to the nearest point on a reef polygon to the larvas position. To orientate and swim towards a reef, *A. vaigiensis* were given a olfactory range of 15 km, combined with a critical swimming speed (U~crit~) of 0.463 ms~-1~, *in situ* potential of 0.25, and an endurance rate of 50% [CITE Leis and Fisher 2006 ].

The base model for the behaviour scenario contained no behaviour, with the larvae passively moved by the ocean currents. The three behaviours (OVM, DVM and orientated swimming) were then combined for 7 other test models (@tbl:scenarios-ovm). The Pomacentridae ontogenetic vertical migration strategy was used in the models that contained OVM. Comparisons of ontogenetic migration strategies were made using the different proportions found amongst the seven families in Chapter 3 (@tbl:scenarios-ovm). The ontogenetic vertical migration was implemented such that the larvae moved when they reached their next ontogenetic stage (based on time). To determine the influence of different behaviour implementations on the dispersal patterns, we compared three different methods of ontogenetic vertical migration (@tbl:scenarios-impl). The first method migrated the larvae using the given probabilities after each time-step. Due to the short time-period larvae were restricted from moving upwards or downwards 25 m. The second method the larvae performed vertical migration every 24 hours in the system, and the last method migrated a larva when it moved to the next ontogenetic stage.

: The combination of the three larval behaviours, diel vertical migration, ontogenetic vertical migration, and orientated swimming, used in the modelling scenarios {#tbl:scenarios-behaviour}

| Scenario | Diel | OVM | Orientation |
|:--------:|:----:|:---:|:-----------:|
|    1     |  —   |  —  |      —      |
|    2     | Yes  |  —  |      —      |
|    3     |  —   | Yes |      —      |
|    4     |  —   |  —  |     Yes     |
|    5     | Yes  | Yes |      —      |
|    6     | Yes  |  —  |     Yes     |
|    7     |  —   | Yes |     Yes     |
|    8     | Yes  | Yes |     Yes     |


: The ontogenetic vertical migration probabilities for each of the seven fish families used in each scenario, at three depth ranges (surface: 0-5 m; mixed layer: 5-50 m; deep layer: 51-100 m) {#tbl:scenarios-ovm}

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
| 1        | time-step migration |
| 2        | daily migration                                 |
| 3        | ontogenetic stage migration           |

## Data analysis

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
