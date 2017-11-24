<!-- lint disable no-undefined-references -->
<!-- lint disable no-shortcut-reference-link -->
<!-- lint disable maximum-line-length -->
<!-- lint disable maximum-heading-length -->

CHAPTER 2: Is length or ontogeny a predictor of the vertical position of temperate reef ichthyoplankton in NSW?


Comments attached.  Yes, you probably can get away with just the two figures.  But might be good to have one figure that focuses on showing relationships between your response variables and any physical variables.  But you need a bit more exploration/generalisation of the patterns.  Most importantly for starters though is to more specifically articulate how the various analyses help you address your aims/hypotheses.  And why look at stage abundance as well as length? Do these tell you the same thing about OVM…or not.  Then on the analysis methods, start general and get specific.

On  your results, you don’t say much about the physical variables and stage abundance data..why is that?


## Summary
- Ontogeny was only a predictor of depth for one family
- Length was a predictor of depth for 5 families
- Perhaps length is a better predictor of depth position (and also easier to get information and use in modelling?)
- Different from previous results (but combination of experimental design, and differences amongst families – and presumably within). Even environmental drivers weren’t common amongst fish – lots of variation!


## Introduction

### Why are we doing it? Was is it? Background

Wanted to test on temperate reef fish

Vertical migration of fish
  e.g. ontogenetic, diel, movement through swimming behaviours.


Ontogenetic vertical migration in fish - what is it? does it exist?

### Give the context of early-life history behaviour (e.g. vertical migration) in fish and what has been found before.

- seen in zooplankton, e.g. copepods [Hays 2003]

This experiment is not measureing the behaviour...
[Pearre 1979] - not actually behaviour, but measuring population distribution.


Eddys

We know eddies retain larval fish (reference Mullany and Suthers), restricting dispersal.

We have to be careful as spawning times are unknown and predation rates.

From Mullaney and Suthers: Sardine larvae were not growing significantly faster in the eddy compared to the shelf—they were only older and larger on average. However, growth rates can be a function of the slower growing larvae being removed by differential mortality (Tian et al. 2007). Perhaps predation on larval fish was less in the eddy compared to the shelf waters.

Do we see ontogenetic or length differences in anticyclonic eddies different from those in cyclonic eddies??

Theoretical studies (on plankton) predicated that warm-core eddies retained larvae, but also that there were differences with depth.
 - discussion time-scales (17 days above, 24 days below)
 -

Significance
- To be used in modelling
- Address concerns that while behaviour cannot be used to, input for predictive modelling.


### Aims / Hypothesis
- Is ontogeny a predictor of depth for temperate reef fish?
- Is length a predictor of depth for temperate reef fish?
- Do these relationships change depending on the oceanographic feature?

temperate species, ontogeny or length are also a driver of vertical position as shown in tropical species
- Why did you choose the experimental design, e.g. utilised other design based on competitive ship time

Hypothesis:
- Rentention of both longer and older larvae in the eddies (there should be longer larvae in the top 50m)

- Trends downwards in ontogenetic movement





## Methods

Sixteen stations were sampled along the eastern coast of Australia on Australian Marine National Facility RV _Investigator_ (<http://www.csiro.au/en/Research/Facilities/Marine-National-Facility>) RV _Investigator_ (2-18 June 2015, voyage IN2013_V03). We sampled stations within two coastal regions and two frontal eddies in the Eastern Australian Current (EAC) [CITE study figure]. The location of the frontal eddies were calculated onboard using real time data and novel techniques [CITE Moninya's paper].


- Create graphic of study area with station locations


At each station we sampled for larval fish using two different net types, a multiple opening/closing net and environmental sensing system (MOCNESS) and Neuston net. Both nets consisted of 1 m^2^ mouth areas with 500 &mu;m mesh sizes. The MOCNESS system sampled at two different depths 5-50 m and 50-100 m, conducting two 10 minute tows over each depth range (four tows per station). The Neuston net captured larval fish at the near surface level (0-5 m) and was deployed for two 10 minute tows per station. Neuston and MOCNESS nets were deployed at the same time and all tows were conducted between sunset and sunrise. Conductivity, temperature, and depth (CTD) measurements, including dissolved oxygen and chlorophyll fluorescence were taken on the MOCNESS net at each station. Each net had a flow sensor, enabling concentrations of larval fish per cubic metre to be calculated. Plankton samples per station were split 50:50 between preserved in 90% ethanol or a 10% buffered formalin solution. Ethanol was used in case genetic or otolith analysis was required later on some of the larval fish. Both samples were used in the analyses and shrinkage differences between the two solutions were ignored.

### Data processing

In the lab each sample was sorted to seperate the ichthyoplankton from the general plankton samples. The larval fish were then sorted by morphological features and identified to family taxonomic level where possible, referring to reference guides and expert help where appropriate (CITE: books CalCOFI, Leis & Calvert, Miskiwiez et al.). For our analysis the most abundant (greater than 100 captured) reef associated fish families were identified from the samples, which were the family groups Labridae, Mullidae, Pomacentridae, Scaridae, Scorpaenidae, Serranidae, and Synodontidae. Each fish was identified to ontogenetic stage, e.g. preflexion, flexion, or postflexion. Each fish was photographed using a calibrated stereo microscope and measured to &mu;m accuracy using the image acquisition software Image-Pro Insight 8 (<http://www.mediacy.com/imageproinsight>).

- Photographs of the three ontogenetic stages examples?

### Data analysis

Ontogenetic stage analysis

The ontogeny count data was standardised by the flow to a concentration (per m^3^). The ontogeny data was analysed using negative binomial generalised linear models (GLM), to account for over-dispersion in the Poisson distribution. Models were constructed using a bottom-up approach, building simple models of single factors and including predicators that were significant until a complete model was constructed which represented the data. The model was then reduced where possible to exclude non-significant interaction predictors. Instead of modelling station as a random factor, each station was described using four measured environmental variables from CTDs, temperature, salinity, dissolved oxygen and chlorophyll fluorescence. Dissolved oxygen and chlorophyll fluorescence were correlated with each other (r^2^ = 0.73), and therefore only one was included in a model. An offset was used to model the concentration within the negative binomial distribution. Even though the data contained a large number of zero observations, none of the models appeared to be zero-inflated after comparing the expected zeros of the negative binomial distribution and AIC comparisons with zero-inflated negative binomial models. The larval fish length data were analysed using GLMs with a Gamma distribution and log link function, with model construction using the same bottom up approach. Post-hoc analysis was performed using pairwise tests on the least squares means with a Tukey adjustment. All analysis was conducted using the R programming language [@RAlanguageanden:wf]. The package MASS was used for negative binomial GLMs [CITE], the packages car [CITE] and DHARMa were used for model checking, and the packages lsmeans [CITE] and multcomp [CITE] were used for GLM post-hoc analysis. Figures and tables were made using the package tidyverse [CITE] and stargazer [CITE] respectively.

## Results

The seven reef associated families comprised of 2827 fish in total, of which 44.3% came from the family Labridae (@tbl:catch-summary). One surface tow at station 8 was not included in the analysis because there were no flowmeter readings to get concentration, and at station 16 the surface nets were not deployed due to rough conditions. There were differences in catches of ontogenetic stages, with some families such as Serranidae and Mullidae dominated by small preflexion larvae and  Labridae was dominated by postflexion larvae (@tbl:catch-summary). Pomacentridae and Scaridae had low samples of postflexion and preflexion respectively.

: The total catch numbers for the seven most abundant reef fish associated families caught during the cruise. The total number identified and the number at each ontogenetic stage (preflexion, flexion and postflexion) is listed, as well as the mean length in mm (± standard deviation) {#tbl:catch-summary}

Family        | Preflexion | Flexion | Postflexion | Total | Mean length (mm)
------------- | ---------- | ------- | ----------- | ----- | :--------------:
Labridae      | 273        | 383     | 596         | 1252  |   5.91 (±2.79)
Mullidae      | 123        | 61      | 60          | 244   |   7.44 (±6.31)
Pomacentridae | 102        | 84      | 8           | 194   |   3.88 (±1.50)
Scaridae      | 9          | 126     | 93          | 228   |   5.90 (±1.75)
Scorpaenidae  | 50         | 56      | 70          | 176   |   5.15 (±2.16)
Serranidae    | 469        | 107     | 17          | 593   |   3.32 (±1.47)
Synodontidae  | 63         | 39      | 38          | 140   |  10.35 (±6.53)

[Include graph on the environmental variation for each variable by site (Y axis is depth, X is variable]



### Stage-abundance results

I’d put depth on y axis…more intuitive. And maybe express these as percents.

![Mean concentration (1000 m^3^) of ontogenetic larval stages (PRE = preflexion, FLE = flexion, POS = postflexion) for seven temperate reef families (Labridae, Mullidae, Pomacentridae, Scaridae, Scorpaenidae, Serranidae, and Synodontidae) at three depths (0 = surface, 25 = 5-50 metres, 75 = 50-100 metres), sampled from 16 different stations along the NSW coast. 95% confidence intervals are shown.](../figs/depth-stage-all.png){#fig:ovm}

[Depth patterns]
Pomacentridae, Scaridae and Serranidae occurred equally in surface waters and the top 50m, while Labridae, Scorpaenidae, and Synodontidae preferred the 5-50m depth. Mullidae larvae preferred the surface waters. Only Scorpaenidae, Scaridae, and Scorpaenidae occurred in any notable numbers at the deepest depth.

[OVM]
Five of the reef fish families (Labridae, Mullidae, Scorpaenidae, Serranidae, and Synodontidae) exhibited patterns of ontogenetic vertical migration across the three depths (surface = 0 m, mid = 5-50 m, deep = 50-100 m), whereby significant differences were found between concentrations of ontogenetic stages at depth. (@fig:ovm). Scorpaenidae showed the strongest downward trends of ontogenetic vertical migration over the 100 m. Labridae and Synodontidae trended downwards from the surface waters to the mid-depth, and Serranidae trended downwards at the deep depth. Mullidae showed a slight upwards pattern of vertical migration, with postflexion preferring the surface waters. Scaridae and Pomacentridae were found to occur in equal numbers.

[Between Depths]

[0-25]
Mullidae and Serranidae larvae did not differ in abundance by stage between the surface and 25 m depths. Labridae preflexion and flexion larvae were predicted to be in the surface 41% and 40% less respectively than at 25 m (p~preflexion~ = 0.020, p~flexion~ = 0.017), with no difference between the surface and 25 m for postflexion. Both flexion and post-flexion Scorpaenidae larvae increased in the 25 m depth compared to the surface, 5.8 times (p = 0.029) and 6.5 times (p = 0.025) respectively.

[0-75]
For each ontogenetic stage, Mullidae abundance was significantly lower at the 75 m depth than the surface (p~preflexion~ < 0.001, p~flexion~ < 0.001, p~postflexion~ < 0.001). Between the surface and 75m, only Labridae preflexion was found in lower abundance (p = 0.011). Scorpaenidae flexion and postflexion larvae were more abundant at 75 m than the surface (p~flexion~ = 0.011; p~postflexion~ < 0.001). Postflexion Serranidae larvae were found to occur more at 75 m than the surface (p = 0.042).

[25-75]
Labridae preflexion larvae was less abundant at 75 m than 25 m (p < 0.001). All ontogenetic stages for Mullidae were less abundant at 75 m (p~preflexion~ < 0.001, p~flexion~ < 0.001, p~postflexion~ = 0.023). Scorpaenidae and Serranidae larvae did not change in stage abundance between 25 m and 75 m.

[Summary]
Synodontidae larvae did not differ in abundance by stage between any of the three depths.

[Within Depths]

[0m]
For three families (Scorpaenidae, Serranidae, and Synodontidae) the concentration of preflexion larvae at the surface significantly greater than the concentration of another ontogenetic stage (@fig:ovm). Scorpaenidae preflexion larvae was 6 times more abundant that postflexion larvae (p = 0.044), For Serranidae, the surface waters contained each stage was found to occur in different abundances, with preflexion being the highest at 8.5 times flexion larvae (p < 0.001) and 170 times postflexion larvae (p < 0.001). Synodontidae preflexion larvae at the surface occurred in greater numbers than the postflexion larvae (p = 0.018). Both Labridae and Mullidae larvae were found to occur in equal concentrations per stage in the surface, although there was large variation in concentration of postflexion Labridae larvae (@fig:ovm).

[25m]
At the 5-50 m depth, all stages of Labridae, Scorpaenidae and Synodontidae occurred in equal abundances. Mullidae preflexion larvae were 5.3 times more abundant than postflexion (p = 0.003). Similar pattern occurred at 25 m, with pre-flexion larvae occurring 6.2 times more than flexion (p < 0.001) and 52 times more than post-flexion (p < 0.001).

[75m]
Labridae preflexion larvae were in significantly lower numbers than both flexion (p < 0.001) and post-flexion (p < 0.001) at 75 m. Mullidae and Scorpaenidae both both had significant increases in the abundances of postflexion larvae then preflexion larvae; 7.6 times more for Mullidae (p = 0.003) and 5.8 times for Scorpaenidae (p = 0.030). Serranidae followed an different trend, with equal abundances of preflexion and flexion larvae, which were both more than 4 times greater in abundance that postflexion larvae (p = 0.021 and p = 0.034 respectively). Synodontidae occurred in equal abundances at the 75 m depth.

Both Pomacentridae and Scaridae were found in similar proportions at each depth (@fig-ovm). Pomacentridae larvae were found in equal abundances of preflexion and flexion and postflexion combined. There was an effect of depth at 75 m, significantly reducing the overall abundance (p < 0.001; @tbl:pom). For Scaridae larvae, the concentration in the 25 m layer was 3.1 times greater than the surface (p = 0.004). The large variation of larvae concentrations at 75 m meant it was found to not be different to either 25 m or the surface, even though the mean was higher overall. At each depth, flexion and postflexion were found in higher abundance than preflexion.

[Environmental data]
The abundance of Labridae, Scaridae, Scorpaenidae, and Synodontidae were all strongly positively predicted with temperature (@tbl:ontogeny-glm-output), whereas Pomacentridae were negatively predicted by temperature (@tbl:ontogeny-glm-pom-output). Chlorophyll fluorescence was negatively associated with abundance for both Pomacentridae and Mullidae. Dissolved oxygen was a positive predictor for Labridae, but a negative predictor for Synodontidae. Salinity was a negative predictor of Scaridae abundance.

## Length vertical migration

Length Depth Patterns
- Larger in 75m = labridae, mullidae, scorpaneidae, serranidae
- Same = Poms, scarids, synodontids.

![Length (mm) of larval fish of nine temperate reef families (Labridae, Mullidae, Pomacentridae, Scaridae, Scorpaenidae, Serranidae, and Synodontidae) at three depths (0 = surface, 25 = 5-50 metres, 75 = 50-100 metres), sampled from 16 different stations along the NSW coast.](../figs/length-depth-all.png){#fig:length-depth}

Put depth on y axis.
Indicate stats on figure.

For each of the seven fish families, depth was a significant predictor of length. The length of the Labridae larvae at the surface and 25 m were not significantly different. The Labridae larvae at 75 were predicted to be twice as long compared to the surface (p < 0.001) and at 25 m (p < 0.001). Similar to the Labridae, Mullidae larvae were longer at 75 m, compared to the surface (p < 0.001) and 25 m (p < 0.001), although this difference was even greater, approximately three times longer. The Pomacentridae larvae are predicted to be on average 0.58 mm longer at 25 m than the surface (p = 0.026). Scaridae larvae were predicted in the model to be longer in the surface than 25 m (p = 0.027), although post-hoc analysis found no difference between the least-squares means at each depth. Scorpaenidae larvae were significantly longer 75 m, on average 2.72 mm longer than the surface (p < 0.001) and 1.44 mm longer than the larvae at 25 m (p < 0.001). The surface and 25 m larvae were found to not significantly differ in size in the post-hoc analysis, even though the model did predict the length at depth 25 m to be longer than the surface larvae. Serranidae larvae were significantly different at each depth, only 0.36 mm larger at 25 m than the surface (p = 0.001), but 3.91 mm longer at 75 m than the surface (p < 0.001). Synodontidae larvae were predicted from the model to be longer at 75 m than the surface, however post-hoc analysis did not find any differences between the predicted means at each depth.



### Environmental variables - length
The length of Labridae (p < 0.001), Mullidae (p < 0.001), Pomacentridae (p < 0.001) and Serranidae (p < 0.001 all were positively predicted by the water temperature (@tbl:length-glm-output). Labridae larval length was positively predicted by chlorophyll fluorescence (p < 0.001). Salinity was a positive predictor of Pomacentridae (p = 0.030) and Scaridae length (p = 0.001), but a negative predictor of the length of Scorpaenidae larvae (p = 0.039). Dissolved oxygen negatively predicted the length of Pomacentridae larvae (p < 0.001).


[Features]

Overall positive effect of Eddy (Mullidae, Scaridae).
No effect : Serranidae

## Effect of stage abundance
Labridae [a,a,a][a,b,c]
Scorp [a,a,a][b,a,a]
Syndod [a,ab,b][a,a,a]


Labridae occurred in equal abundances in the coastal waters, but in the eddy preflexion was the least abundant followed by flexion (p~pre-fle~ = 0.016) and postflexion (p~pre-pos~ < 0.001; p~fle-pos~ < 0. 001) was the most abundant. Scorpaenidae flexion larvae abundance increased 5.7 times (p < 0.001) and postflexion larvae 9.5 times (p < 0.001) in the eddy compared to the coastal waters, while preflexion abundance did not vary. Flexion larvae of Synodontidae were more common in the eddy (p = 0.003).


## Effect of depth abundance
Labridae [a,b,ab][b,b,a]
Pomacentridae [a,a,b][a,b,c]**

In the coastal waters, Labridae was more abundant in at 25 m than the surface, but in the Eddy both the surface and 25 m was more abundant than 75 m (p~0m~ = 0.010; p~25m~ < 0.001). In the eddy, Synodontidae abundance increased 4.9 times at 25 m, when compared to the coastal waters.


## Feature on Length

Six of the families were significantly longer in an eddy than the coastal waters, Scaridae being the exception where the eddy had no effect on length (@tbl:length-glm-output). The greatest effect of eddy was on Mullidae, which were on average predicted to be 3.7 times longer than the larvae in the coastal waters (p < 0.001) and the smallest effect was on Labridae which were only 1.2 times longer (p < 0.001). There was no interaction between depth and feature for any of the seven temperature fish families.

## Take home messages for stage based vertical migration

No significant interactions between feature x stage x depth
  - Therefore pattern of behaviour doesnt seem to be dependent on feature

Five families show distinct patterns of OVM
  - The two that didn't had low sample sizes for one stage (Poms at post-flexion, Scarids at pre-flexion)

## Take home messages for length vertical migration

Larger larvae were found deeper
  - Predator avoidance? Changes in prey?
  - Should we be modelling length instead of ontogeny?
Larger larvae were found in the eddy
  - There was no interaction, larvae grow larger in eddies
  - Expected behaviour as larvae age in eddies
Temperature was a strong predictor of larvae length
  - Grow faster in warmer temperatures?
  - Slopes were gradual. Predator avoidance? (Less nutrient rich water = less predators?!)
  - Or higher temperatures allow them to use more of the water column?
  - Labridae length was predicted positively by both temperature and chlorophyll - seems contradictory


: The predictors of larvae abundance for the fish families Labridae, Mullidae, Scorpaenidae, Serranidae, and Synodontidae using generalised linear models with negative binomial. The estimate and standard error is given. {#tbl:ontogeny-glm-output}

| Dependent variable:      |                                        |                   |                   |                   |                   |                  |   |   |
|--------------------------|----------------------------------------|-------------------|-------------------|-------------------|-------------------|------------------|---|---|
|                          | Count                                  |                   |                   |                   |                   |                  |   |   |
|                          | Labridae                               | Mullidae          | Scaridae          | Scorpaenidae      | Serranidae        | Synodontidae     |   |   |
| Feature(Eddy)            | 0.864\*                                | 2.768\***         | 1.531\***         | 0.362             |                   | -0.012           |   |   |
|                          | (0.401)                                | (0.530)           | (0.300)           | (0.440)           |                   | (0.558)          |   |   |
| Depth(25)                | 1.316\***                              | 0.048             | 1.125\**          | 0.338             | 0.045             | -0.356           |   |   |
|                          | (0.389)                                | (0.454)           | (0.355)           | (0.449)           | (0.466)           | (0.461)          |   |   |
| Depth(75)                | -0.511                                 | -5.750\***        | 1.363             | -0.546            | -0.641            | -1.571           |   |   |
| (0.503)                  | (0.998)                                | (0.766)           | (0.774)           | (0.687)           | (0.906)           |                  |   |   |
| Stage(FLE)               | -0.245                                 | -0.022            | 2.952\***         | -2.296\**         | -2.147\***        | -1.895\**        |   |   |
| (0.426)                  | (0.620)                                | (0.796)           | (0.452)           | (0.528)           | (0.626)           |                  |   |   |
| Stage(POS)               | -0.551                                 | 0.192             | 2.457\***         | -2.745\***        | -5.143\***        | -2.219\**        |   |   |
| | (0.431)                  | (0.614)                                | (0.834)           | (0.457)           | (1.103)           | (0.706)           |                  |   |
| Temperature              | 0.380\**                               |                   | 1.586\***         | 1.029\***         |                   | 0.932\***        |   |   |
|                          | (0.127)                                |                   | (0.256)           | (0.201)           |                   | (0.200)          |   |   |
| Chlorophyll              |                                        | -0.911\***        |                   |                   |                   |                  |   |   |
|                          |                                        | (0.222)           |                   |                   |                   |                  |   |   |
| Dissolved Oxygen         | 0.635\*                                |               | -0.511\*          |                   |                   |    -0.570               |   |   |
| (0.266)                  | (0.323)                                |              |                   |                   |                   |  (0.256)              |   |   |
| Salinity                 |                                        |                   | -0.376\**         |                   |                   |                  |   |   |
|                          |                                        |                   | (0.126)           |                   |                   |                  |   |   |
| Feature(Eddy):Depth(25)  | -0.854\*                               |                   |                   |                   |                   | 0.885            |   |   |
|                          | (0.388)                                |                   |                   |                   |                   | (0.588)          |   |   |
| Feature(Eddy):Depth(75)  | -1.633\***                             |                   |                   |                   |                   | -0.645           |   |   |
|                          | (0.425)                                |                   |                   |                   |                   | (0.806)          |   |   |
| Feature(Eddy):Stage(FLE) | 0.506                                  | -1.803\**         |                   | 1.379\*           | 1.332\*           |                  |   |   |
|                          | (0.403)                                | (0.642)           |                   | (0.611)           | (0.590)           |                  |   |   |
| Feature(Eddy):Stage(POS) | 1.887\***                              | -1.471\*          |                   | 1.884\**          | 0.811             |                  |   |   |
|                          | (0.403)                                | (0.659)           |                   | (0.609)           | (0.596)           |                  |   |   |
| Depth(25):Stage(FLE)     | 0.024                                  | 0.239             |                   | 1.430             | 0.329             | 0.466            |   |   |
|                          | (0.469)                                | (0.676)           |                   | (0.824)           | (0.706)           | (0.691)          |   |   |
| Depth(25):Stage(POS)     | 1.632\**                               | -1.121            |                   | 1.545             | 2.050\**          | 2.138\*          |   |   |
|                          | (0.551)                                | (0.699)           |                   | (0.848)           | (0.724)           | (0.870)          |   |   |
| Depth(75):Stage(FLE)     | -0.469                                 | 2.951\**          |                   | 2.828\**          | 1.199             | 1.237            |   |   |
|                          | (0.470)                                | (1.061)           |                   | (1.020)           | (1.267)           | (0.771)          |   |   |
| Depth(75):Stage(POS)     | 1.846\***                              | 2.751\**          |                   | 3.577\***         | 3.624\**          | 2.536\**         |   |   |
|                          | (0.546)                                | (1.039)           |                   | (1.017)           | (1.241)           | (0.946)          |   |   |
| Constant                 | -6.221\***                             | -6.845\***        | -5.206\***        | -7.829\***        | -4.897\***        | -6.855\***       |   |   |
|                          | (0.354)                                | (0.436)           | (0.655)           | (0.453)           | (0.386)           | (0.463)          |   |   |
| Observations             | 276                                    | 276               | 276               | 276               | 276               | 276              |   |   |
| theta                    | 0.785\*** (0.092)                      | 0.434\*** (0.083) | 0.995\*** (0.278) | 0.826\*** (0.243) | 0.325\*** (0.051) | 1.070\** (0.361) |   |   |
| Note:                    | \*p < 0.05; \**p < 0.01; \***p < 0.001 |                   |                   |                   |                   |                  |   |   |


: The predictors of larvae length for the fish families Labridae, Mullidae, Pomacentridae, Scaridae, Scorpaenidae, Serranidae, and Synodontidae using generalised linear models with Gamma distributions. The estimate and standard error is given. {#tbl:length-glm-output}


|                  |                 | Length (mm)    |               |          |              |            |              |   |
|------------------|-----------------|----------------|---------------|----------|--------------|------------|--------------|---|
|                  | Labridae        | Mullidae       | Pomacentridae | Scaridae | Scorpaenidae | Serranidae | Synodontidae |   |
| Feature (Eddy)   | 0.154\***       | 1.302\***      | 0.886\***     | -0.039   | 0.259\***    | 0.437\***  | 0.403\***    |   |
|                  | (0.036)         | (0.171)        | (0.177)       | (0.051)  | (0.073)      | (0.085)    | (0.110)      |   |
| Depth (25 m)     | -0.090\**       | -0.216\*       | 0.144\*       | -0.156   | 0.257\*      | 0.123\***  | 0.201        |   |
|                  | (0.030)         | (0.094)        | (0.058)       | (0.086)  | (0.118)      | (0.036)    | (0.132)      |   |
| Depth (75 m)     | 0.574\***       | 1.110\***      | 0.358\*       | -0.127   | 0.529\***    | 0.811***   | 0.789\*      |   |
|                  | (0.080)         | (0.200)        | (0.157)       | (0.134)  | (0.127)      | (0.066)    | (0.357)      |   |
| Temperature      | 0.108\***       | 0.613\***      | 0.208***      | -0.084   |              | 0.192\***  |              |   |
|                  | (0.024)         | (0.074)        | (0.055)       | (0.044)  |              | (0.036)    |              |   |
| Chlorophyll      | 0.061\***       |                |               |          |              |            |              |   |
|                  | (0.008)         |                |               |          |              |            |              |   |
| Salinity         |                 |                | 2.265\*       | 0.168\** | -0.211\*     | -0.197     |              |   |
|                  |                 |                | (1.033)       | (0.063)  | (0.102)      | (0.199)    |              |   |
| Dissolved Oxygen |                 |                | -0.888\***    |          |              |            | 0.846        |   |
|                  |                 |                | (0.248)       |          |              |            | (0.454)      |   |
| Constant         | -2.324\***      | -12.186\***    | -79.789\*     | -2.179   | 8.654*       | 3.632      | -2.398       |   |
|                  | (0.695)         | (1.707)        | (36.695)      | (2.094)  | (3.551)      | (7.429)    | (2.324)      |   |
| Observations     | 1,252           | 244            | 194           | 228      | 176          | 593        | 140          |   |
| Note:            | \*p < 0.05; \** | p < 0.01; \*** | p < 0.001     |          |              |            |              |   |



## Discussion

- Interpretation (in light of what is already known)
- What new understandings have we got?
- What would be the next steps

### Ontogeny Discussion

- For the hypothesis to be true - stage x depth interaction needs to be significant. To interpret it feature x stage x depth needs to be significant.
- Is the stage a good indication of depth for these species? No, at least for these coarse depths (surface, 5-50, 50-100). Only Scorps and Synods really showed pattern
- Obviously a lot of other factors influencing position in the water column
- Weakness of experimental design perhaps and also difficulty of fish collection at all stages across sites.
- Do I combine all environmental drivers (concentration & length)





and Synodontidae were the only families to exhibit an interaction between ontogenetic stages at each of the three experimental depths.



The result was surprising, as we thought the relationship between stage and depth would be clearer as per the literature. For these families, the pattern supported our hypothesis that more developed larvae (in this case flexion and onwards) were more likely to be present at lower depths (50-100 m). For the other species, while we believe ontogenetic vertical migration patterns to exist, our experimental design appeared was perhaps too coarse to tease these relationships out. We can see there are patterns of difference, but the low catch rate of the different ontogenetic stages across all sites meant the analysis made it difficult to get significant predictors.

Environmental factors were also driving the differences in concentration of larvae at depth. Increasing temperature predicted the increased concentration of Labridae, Scaridae, Scorpaenidae, and lowered the odds of presence of Pomacentridae. Salinity was a positive predictor of both presence and concentration of Scaridae. Dissolved oxygen, which was also highly correlated with chlorophyll, has positive presence predictors for Mullidae and Serranidae, suggesting that ichthyoplankton also migrate to where the rest of the plankton are. Although Synodontidae were negatively associated with dissolved oxygen, possibly avoiding predators.


Low concentrations at 75m. Should models be constraining to the top 50?

[What did others find?]

[Gray 1998 - off NSW]
Labridae pre and post- were found mainly in 25m bin.
Pomacentidae found mainly in 25m (at 10m)

[Gray 1993] Where deep = 20-30m and surface = 0-2m.
Deep > Surface (Scorpaenidae, Labridae)
Deep = Surface (Pomacentirdae)
Surface > Deep (Mullidae)

[Gray 1996] - Patchy larval distributions? (see Cowen 1993).

[Irrison 2010]
Labridae, Serranidae trended downwards
Pomcentirdae trended upwards
Found that preflexion was more localised while post-flexion was more spread out.
In general (when signifiance was found), shift was from surface to deep water

### Length

- Length often had a significant interaction with feature and depth (longer in eddies except for scarids and synodontids), suggesting entrainment in eddy with food resources, i.e. plankton

#### Environmental drivers

Temperature was a positive predictor of length in Labridae, Mullidae, Pomacentridae and Serranidae.
- Tropical rather than temperate species perhaps?

Salinity had a positive relationship on the length of Pomacentridae larvae, but negative relationships with Scorpaenidae, Mullidae, Labridae.
- Some species are more saline tolerant

Dissolve oxygen had a negative relationship with the length of the Pomacentridae.
- Plankton relationship to DO?

### Better predictor of depth? Length or Ontogeny?
- Length is a better predictor than ontogeny for these depth ranges
- Longer larvae were found in the 50-100 m depth for 5 families
- Longer found deeper


### Comparison of length vs ontogeny? Why are we seeing differences?



### Limitations

- Only 3 depths, perhaps too coarse to capture the initial
  - What about that middle 50m range, can be evenly split?
- Issues with sampling (specifically undersampling)
  - Mortality means catch more preflexion
  - Larger fish are better at evading the nets (through swimming and detection)
  - Is 16 stations enough over such a huge area? Could be large environmental variation, shown that there are environmental drivers. Some low r^2 even with all the variables in - other things driving this behaviour = complicated story.
  - Perhaps sampling design was too low - too many zeros in the dataset to get a good distribution.

Leis 2010 : OVM is interpreted as such because larval fish do not seem to have sufficient to have the snesory perception and swimming ability t actively regulate their behaviour.

Huebert 2011 argue that perhaps ontogenetic vertical migration is gradual shift and not strict dichomoties. He also argues against strafitied nets for samplign behaviour.
  .e.g Irrison (2010) argues that increases with mean depth with ontoegny mayebe because the range of the fish is shown to increase.

[Leis 2006] - towed studies capture less post-flexion etc as they have the ability to avoid catprue more than little ones - gear avoidance.

Ignored eggs of these species. 



### Future directions

- Costly exercise - are there better ways?
- Difficult data collection means how do we ensure better results?
- Use the data to parametise models that require early-life history data.

### Conclusion

## References
