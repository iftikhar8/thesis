## Methods

Sixteen stations were sampled along the eastern coast of Australia on Australian Marine National Facility RV _Investigator_ (<http://www.csiro.au/en/Research/Facilities/Marine-National-Facility>) RV _Investigator_ (2-18 June 2015, voyage IN2013_V03). We sampled stations within two coastal regions and two frontal eddies in the Eastern Australian Current (EAC) [CITE study figure]. The location of the frontal eddies were calculated onboard using real time data and novel techniques [CITE Moninya's paper].

- Create graphic of study area with station locations

At each station we sampled for larval fish using two different net types, a multiple opening/closing net and environmental sensing system (MOCNESS) and Neuston net. Both nets consisted of 1 m^2 mouth areas with 500 &mu;nm mesh sizes. The MOCNESS system sampled at two different depths 5-50 m and 50-100 m, conducting two 10 minute tows over each depth range (four tows per station). The Neuston net captured larval fish at the near surface level and was deployed for two 10 minute tows per station. Neuston and MOCNESS nets were deployed at the same time and all tows were conducted between sunset and sunrise. Conductivity, temperature, and depth (CTD) measurements, including dissolved oxygen, were taken on the MOCNESS net at each station. Each net had a flow sensor, enabling concentrations of larval fish per cubic metre to be calculated. Plankton samples per station were split 50:50 between preserved in 90% ethanol or a 10% buffered formalin solution. Ethanol was used in case genetic or otolith analysis was required later on some of the larval fish.

### Data processing

Each sample was initially sorted to seperate the ichthyoplankton from the general plankton samples. The larval fish were then sorted by morphological features and identified to family taxonomic level where possible, referring to reference guides and expert help where appropriate (CITE: books CalCOFI, Leis & Calvert, Miskiwiez et al.). The most common (greater than 100) reef associated fish families were identified from the samples and their ontogenetic stage was identified (i.e. preflexion, flexion, or postflexion). Each fish was photographed using a calibrated stereo microscope and measured to \mum accuracy using the software Image-Pro Insight (<http://www.mediacy.com/imageproinsight>). No accounting for shrinkage was conducted.

- Photographs of the three ontogenetic stages examples?

### Data analysis

The ontogeny count data was standardised by the flow to a concentration (per m^3^). The ontogeny data was analysed using negative binomial generalised linear models (GLM), to account for over-dispersion in the Poisson distribution. Models were constructed using a bottom-up approach, building simple models of single factors and including predicators that were significant until a complete model was constructed which represented the data. The model was then reduced where possible to exclude non-significant interaction predictors. Instead of modelling station as a random factor, each station was described using four measured environmental variables from CTDs, temperature, salinity, dissolved oxygen and chlorophyll fluorescence. Dissolved oxygen and chlorophyll fluorescence were correlated with each other (r^2^ = 0.73), and therefore only one was included in a model. An offset was used to model the concentration within the negative binomial distribution. Even though the data contained a large number of zero observations, none of the models appeared to be zero-inflated after comparing the expected zeros of the negative binomial distribution and AIC comparisons with zero-inflated negative binomial models. The larval fish length data were analysed using GLMs with a Gamma distribution and log link function, with model construction using the same bottom up approach. Post-hoc analysis was performed using pairwise tests on the least squares means with a Tukey adjustment. All analysis was conducted using the R programming language [@RAlanguageanden:wf]. The package MASS was used for negative binomial GLMs [CITE], the packages car [CITE] and DHARMa were used for model checking, and the packages lsmeans [CITE] and multcomp [CITE] were used for GLM post-hoc analysis. Figures and tables were made using the package tidyverse [CITE] and stargazer [CITE] respectively.

## Results

### General Fish results

For our analysis we chose the seven most abundant reef associated families (chosen with > 100 fish). These seven families comprised of 2827 fish in total, of which 44.3% came from the family Labridae (@tbl:catch-summary). One surface tow at station 8 could not be included in the analysis because there were no flowmeter readings to get concentration, and at station 16 the surface nets were not deployed due to rough conditions.

: The total catch numbers for the seven most abundant reef fish associated families caught during the cruise. The total number identified and the number at each ontogenetic stage (preflexion, flexion and postflextion) is listed, as well as the mean length in mm (± standard deviation) {#tbl:catch-summary}

Family        | Preflexion | Flexion | Postflexion | Total | Mean length (mm)
------------- | ---------- | ------- | ----------- | ----- | :--------------:
Labridae      | 273        | 383     | 596         | 1252  |   5.91 (±2.79)
Mullidae      | 123        | 61      | 60          | 244   |   7.44 (±6.31)
Pomacentridae | 102        | 84      | 8           | 194   |   3.88 (±1.50)
Scaridae      | 9          | 126     | 93          | 228   |   5.90 (±1.75)
Scorpaenidae  | 50         | 56      | 70          | 176   |   5.15 (±2.16)
Serranidae    | 469        | 107     | 17          | 593   |   3.32 (±1.47)
Synodontidae  | 63         | 39      | 38          | 140   |  10.35 (±6.53)


- Include graph on the environmental variation for each variable by site (Y axis is depth, X is variable)


## Ontogenetic vertical migration

![Mean concentration (m^3^) of ontogenetic larval stages (PRE = preflexion, FLE = flexion, POS = postflexion) for nine temperate reef families (Labridae, Mullidae, Pomacentridae, Scaridae, Scorpaenidae, Serranidae, and Synodontidae) at three depths (0 = surface, 25 = 5-50 metres, 75 = 50-100 metres), sampled from 16 different stations along the NSW coast. 95% confidence intervals are shown.](../figs/depth-stage-all.png){#fig:ovm}

Five of the families exhibited patterns of ontogenetic vertical migration across the 3 depths.

(Labridae)
## OVM - depth x Stage
Labridae pre-flexion larvae were predicted to be in the surface 41% less than at 25 m (p = 0.020), but 3.8 times more in the surface than at 75 m (p = 0.011). Pre-flexion larvae were predicted to be 9.2 times more abundant at 25 m than 75 m (p < 0.001). Flexion larvae were also found 40% less at the surface than 25 m (p = 0.017). Post-flexion larvae trended towards deeper water, but the predicted counts were not significantly different. Between depths, each stage was predicted to be in in similar numbers at the surface and at 25 m, but at 75 m pre-flexion larvae were in significantly lower numbers than both flexion (p < 0.001) and post-flexion (p < 0.001).

For Mullidae, post-hoc tests suggests each stage had similar concentrations at the surface and 25 m and then significantly lower concentrations at 75 m. The predicted means showed that while flexion slightly increased from the surface down to 25 m, post-flexion larvae decreased, although this was non-significant. At the surface there were no differences in the predicted abundance of each stage, but at 25 m pre-flexion larvae were 5.3 times more abundant than post-flexion larvae (p = 0.003) and at 75 m post-flexion larvae occurred about 7.6 times more than pre-flexion larvae (noting the mean counts at 75 m were low compared to the other depths; p = 0.045).

Scorpaenidae pre-flexion larvae were found to exist in equal numbers across the depths. Flexion and post-flexion larvae were found to be higher at both 25 m (p^flexion^ = 0.029; p^post-flexion^ = 0.025) and 75 m (p^flexion^ = 0.011; p^post-flexion^ < 0.001) than the surface waters.
At the surface, pre-flexion larvae was 6 times more abundant that post-flexion larvae (p = 0.044). This pattern was reversed at 75 m, whereby post-flexion larvae were 6 times more abundant than pre-flexion larvae (p = 0.030). At 25 m the each larval stage was found in equal amounts.

Post-flexion Serranidae larvae were found to occur more at 75m than the surface (p = 0.042). All other stages were found to be similar across the depths. At the surface each stage was found to occur in different abundances, with pre-flexion being the highest at 8.5 times flexion larvae (p < 0.001) and 170 times post-flexion larvae (p < 0.001), and flexion larvae occurring 20 times more than post-flexion larvae (p = 0.021). A similar pattern occurred at 25 m, with pre-flexion larvae occurring 6.2 times more than flexion (p < 0.001) and 52 times more than post-flexion (p < 0.001). At the deepest depth of 75 m, pre-flexion and flexion occurred in similar numbers, and both were significantly greater than post-flexion larvae (p^pre-flexion^ = 0.021; p^flexion^ = 0.034). It should be noted this analysis was on only 17 post-flexion larvae, so caution should be applied to the ratios of abundance.

Synodontidae post-hoc analysis showed there were no clear difference between the predicted means of each stage at each depth. Synodontidae pre-flexion larvae at the surface occurred in greater numbers than the post-flexion larvae (p = 0.018). At the other depths, there were no differences found between predicted abundances.

Pomacentridae and Scaridae did not exhibit a significant interaction of depth and stage, even when combining stages to account for low sample sample size.

## Length

![Length (mm) of larval fish of nine temperate reef families (Labridae, Mullidae, Pomacentridae, Scaridae, Scorpaenidae, Serranidae, and Synodontidae) at three depths (0 = surface, 25 = 5-50 metres, 75 = 50-100 metres), sampled from 16 different stations along the NSW coast.](../figs/length-family.png){#fig:length-depth}

### Depth

For each of the seven fish families, depth was a significant predictor of length. The length of the Labridae larvae at the surface and 25 m were not significantly different. The Labridae larvae at 75 m, it was predicted the larvae were twice as long compared to the surface (p < 0.001) and at 25 m (p < 0.001). Similar to the Labridae, Mullidae larvae were longer at 75 m, compared to the surface (p < 0.001) and 25 m (p < 0.001), although this difference was three times with Mullidae larvae. The Pomacentridae larvae are predicted to be on average 0.58 mm longer at 25 m than the surface (p = 0.026). Scaridae larvae were predicted in the model to be longer in the surface than 25 m (p = 0.027), although post-hoc analysis found no difference between the least-squares means at each depth. Scorpaenidae larvae were significantly longer 75 m, on average 2.72 mm longer than the surface (p < 0.001) and 1.44 mm longer than the larvae at 25 m (p < 0.001). The surface and 25 m larvae were found to not significantly differ in size in the post-hoc analysis, even though the model did predict the length at depth 25 m to be longer than the surface larvae. Serranidae larvae were significantly different at each depth, only 0.36 mm larger at 25 m than the surface (p = 0.001), but 3.91 mm longer at 75 m than the surface (p < 0.001). Synodontidae larvae were predicted from the model to be longer at 75 m than the surface, however post-hoc analysis did not find any differences between the predicted means at each depth.

Length Depth Patterns
- Larger in 75m = labridae, mullidae, scorpaneidae, serranidae
- Same = Poms, scarids, synodontids.

### Feature
Six of the families were significantly longer in an eddy than the coastal waters, Scaridae being the exception where the eddy had no effect on length (@tbl:length-glm-output). The greatest effect of eddy was on Mullidae, which were on average predicted to be 3.7 times longer than the larvae in the coastal waters (p < 0.001) and the smallest effect was on Labridae which were only 1.2 times longer (p < 0.001).


### Environmental variables - length
The length of Labridae (p < 0.001), Mullidae (p < 0.001), Pomacentridae (p < 0.001) and Serranidae (p < 0.001 all were positively predicted by the water temperature (@tbl:length-glm-output). Labridae larval length was positively predicted by chlorophyll fluorescence (p < 0.001). Salinity was a positive predictor of Pomacentridae (p = 0.030) and Scaridae length (p = 0.001), but a negative predictor of the length of Scorpaenidae larvae (p = 0.039). Dissolved oxygen negatively predicted the length of Pomacentridae larvae (p < 0.001).

## Take home messages for stage based vertical migration

No significant interactions between feature x stage x depth
  - Therefore pattern of behaviour doesnt seem to be dependent on feature

Five families show distinct patterns of OVM
  - The two that didn't had low sample sizes at one stage (Poms at post-flexion, Scarids at pre-flexion)
  - Shows that its happening - so good to get data to model.

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
| Dissolved Oxygen         | 0.635\*                                | -0.570            | -0.511\*          |                   |                   |                  |   |   |
| (0.266)                  | (0.323)                                | (0.256)           |                   |                   |                   |                  |   |   |
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
