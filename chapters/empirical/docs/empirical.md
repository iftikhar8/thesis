<!-- lint disable no-undefined-references -->
<!-- lint disable no-shortcut-reference-link -->
<!-- lint disable maximum-line-length -->
<!-- lint disable maximum-heading-length -->

# Is length or ontogeny a predictor of the vertical position of temperate reef ichthyoplankton in NSW?

## Summary
- Ontogeny was only a predictor of depth for one family
- Length was a predictor of depth for 5 families
- Perhaps length is a better predictor of depth position (and also easier to get information and use in modelling?)
- Different from previous results (but combination of experimental design, and differences amongst families – and presumably within). Even environmental drivers weren’t common amongst fish – lots of variation!


## Introduction

### Why are we doing it? Was is it? Background

### Give the context of early-life history behaviour (e.g. vertical migration) in fish and what has been found before

### Aims / Hypothesis
- To see if in temperate species, ontogeny or length are also a driver of vertical position as shown in tropical species
- Why did you choose the experimental design, e.g. utilised other design based on competitive ship time

## Methods

Sixteen stations were sampled along the eastern coast of Australia on Australian Marine National Facility RV _Investigator_ (<http://www.csiro.au/en/Research/Facilities/Marine-National-Facility>) RV _Investigator_ (2-18 June 2015, voyage IN2013_V03). We sampled stations within two coastal regions and two frontal eddies in the Eastern Australian Current (EAC) [CITE study figure]. The location of the frontal eddies were calculated onboard using real time data and novel techniques [CITE Moninya's paper].

- Create graphic of study area with station locations

At each station we sampled for larval fish using two different net types, a multiple opening/closing net and environmental sensing system (MOCNESS) and Neuston net. Both nets consisted of 1 m^2 mouth areas with 500 &mu;m mesh sizes. The MOCNESS system sampled at two different depths 5-50 m and 50-100 m, conducting two 10 minute tows over each depth range (four tows per station). The Neuston net captured larval fish at the near surface level and was deployed for two 10 minute tows per station. Neuston and MOCNESS nets were deployed at the same time and all tows were conducted between sunset and sunrise. Conductivity, temperature, and depth (CTD) measurements, including dissolved oxygen, were taken on the MOCNESS net at each station. Each net had a flow sensor, enabling concentrations of larval fish per cubic metre to be calculated. Plankton samples per station were split 50:50 between preserved in 90% ethanol or a 10% buffered formalin solution. Ethanol was used in case genetic or otolith analysis was required later on some of the larval fish.

### Data processing

Each sample was initially sorted to seperate the ichthyoplankton from the general plankton samples. The larval fish were then sorted by morphological features and identified to family taxonomic level where possible, referring to reference guides and expert help where appropriate (CITE: books CalCOFI, Leis & Calvert, Miskiwiez et al.). The most common (greater than 100) reef associated fish families were identified from the samples and their ontogenetic stage was identified (i.e. preflexion, flexion, or postflexion). Each fish was photographed using a calibrated stero microscope and measured to \mum accuracy using the software Image-Pro Insight (<http://www.mediacy.com/imageproinsight>). No accounting for shrinkage was conducted.

- Photographs of the three ontogenetic stages examples?

### Data analysis

The ontogeny count data was standardised by the flow to a concentration (per m^3^). Due to the excessive zero count for the ontogeny data, we conducted two analyses using generalised linear models (GLM), one GLM on the presence/absence of ontogenetic stages using a binomial distribution and another GLM with a log-normal distribution on the data excluding the zero observations. The larval fish length data was analysed using multiple regression models with log transformation. Where possible ANOVAs were performed using type III sums of squares to account for the unbalanced sample sizes between depths. Post-hoc analysis was performed using least squares means with a Tukey adjustment. As there was there was not enough replication to use a mixed-model GLM with stations as a random factor, instead the stations were described using the measured environmental data at each station; temperature, salinity, and dissolved oxygen.
All analysis was conducted using R [@RAlanguageanden:wf] with the packages tidyverse [@Wickham:2016te], lme4 [CITE], car [CITE], and lsmeans [CITE] for analysis.

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

### Ontogeny results

#### Patterns

The general pattern was that the highest larval concentrations were found in the 5-50 m, with the lowest concentrations found in the bottom 50-100m layer (@fig:ontogeny-all). At the surface most larvae were preflexion, 30% more abundant than postflexion larvae, and twice as abundant as flexion larvae. In the 5-50 m depth bin, the concentration on preflexion was at its highest, flexion larvae became twice as abundant as the surface, and postflexion larvae also increased in abundance although now found in lower concentrations than preflexion larvae. In the lowest depth range, 50-100 m, pre-flexion larvae were found in small concentrations, 7.6 times lower than in the 5-50 m bin. Postflexion larvae were the most common ontogenetic stage in this depth bin, and along with flexion, were found at concentrations lower than the other depths. Each family displayed varying patterns of ontogeny by depth (@fig:ontogeny-family). The most consistent pattern of preflexion was that higher concentrations were found at the surface and in the 5-50 m bin and low numbers in the 50-100 m depth bin, seen in every family except Scaridae where concentration of preflexion larvae did not change much between depths. Most flexion larvae were caught in the 5-50 m bin, except for Mullidae which were found in the surface. For post-flexion larvae, generally they were found at the highest concentration in the 5-50 m depth bin, except for the families Mullidae (surface), Labridae (surface and 5-50 m), and Scorpaenidae (5-50 m and 50-100 m) and Serranidae (equal between depths).

![The mean concentration (per m^3^) of the abundant temperate reef fish larvae at three depth ranges (0, 5-50 m, 50-100 m) by ontogenetic stage (preflexion, flexion, postflexion; ± S.E.)](../figs/ontogeny-all.png){#fig:ontogeny-all}


![The mean concentration (per m^3^) of the reef fish larvae, by family, at three depth ranges (0, 5-50 m, 50-100 m) by ontogenetic stage (preflexion, flexion, postflexion; ± S.E.)](../figs/ontogeny-family.png){#fig:ontogeny-family}


When comparing across features (between coastal and eddy waters), there are different patterns exhibited. The coastal water has higher concentrations of preflexion larvae at the surface than as seen in the eddies (@fig:ontogeny-feature-all). Flexion larvae were found in similar concentrations in the surface and 50-100 m bin, but the 5-50 m range had a 1.6 times increase in concentration. Postflexion larvae was found in concentrations about twice that as the coastal waters for all ontogenetic stages. It was the most common ontogenetic stage found in both the surface and 50-100m waters depths in the eddy. This trend was consistent across all families, only the postflexion larvae of Labridae, Scaridae, and Scorpaenidae were see in greater concentrations in the eddies (@fig:ontogeny-feature-family). Mullidae preflexion larvae were found at greater concentrations at the surface and 5-50 m depth in the eddy than the coast waters. Scaridae (surface and 5-50 m) and Scorpaenidae (5-50 m) had greater than 2 times increases of flexion larvae in eddies. the only difference between oceanic features for Serranidae was that in the eddy not as many preflexion larvae were found in the surface waters.

![The mean concentration (per m^3^) of the abundant temperate reef fish larvae at three depth ranges (0, 5-50 m, 50-100 m) by ontogenetic stage (preflexion, flexion, postflexion) at different water features (coastal and frontal eddy; ± S.E.)](../figs/ontogeny-feature-all.png){#fig:ontogeny-feature-all}

![The mean concentration (per m^3^) of the reef fish larvae, by taxonomic family, at three depth ranges (0, 5-50 m, 50-100 m) by ontogenetic stage (preflexion, flexion, postflexion) at different water features (coastal and frontal eddy; ± S.E.)](../figs/ontogeny-feature-all.png){#fig:ontogeny-feature-family}


#### Drivers

- Will use the sub-headings (presence/absence, non-zero data) and combine the data more effectively than family headings

#### Presence / absence data

#### Concentration (non-zero data)

#### Labridae ontogeny

The presence of Labridae was driven by depth, with odds of Labridae being present at the 50-100 m depth range (p = 0.040) higher than the upper 50 m or surface. Temperature was also an indicator of presence, with more present as the temperature increased (p = 0.018). For the non-zero data, the concentration was also driven by the temperature, increasing as temperature increased (p = 0.031).

#### Mullidae ontogeny

The presence of Mullidae was driven by the dissolved oxygen (p = 0.049). Although when looking at the non-zero data, no significant predictors of concentration were found.

#### Pomacentridae ontogeny

Pomacentridae presence was negatively predicted by an increase in temperature (p = 0.041). There were no significant predictors of concentration when only looking at the non-zero data.

#### Scaridae ontogeny

The presence of Scaridae was strongly predicted by the temperature (p < 0.001), but also the salinity (p = 0.039). Depth was also a predictor, with increasing odds of presence in the 5-50 m range (p = 0.033) and more again in 50-100 m range (p = 0.018). When looking at the non-zero data, only the environmental salinity was a predictor of concentration (p = 0.023).

#### Scorpaenidae ontogeny

Temperature was again a strong predictor of the presence of scorpionfish (p < 0.001). There was an increase of presence at the depth 5-50 m inside an eddy (p = 0.045). The was also a decrease in presence of preflexion larval fish at the 50-100 m depth range (p = 0.029). There were no significant predictors for the concentration of Scorpaenidae.

#### Serranidae ontogeny

The presence of Serranidae was predicted by dissolved oxygen (p = 0.008). There were no predictors of concentration.

#### Synodontidae

The presence of preflexion Synodontidae at 50-100 m was lower (p = 0.033). The environmental variable of temperature increase the presence (p < 0.001) and was decreased by dissolved oxygen (p = 0.040).

### Length

#### Patterns

The mean lengths of the fish were different at the depths (F~2,2824~ = 41.89, p < 0.001; @fig:length-all). The length of the surface (5.81 ± 0.005 mm) was longer than the mean length at 5-50 m range (5.14 ± 0.002; p = 0.001) and shorter to the 50-100 m depth (6.28 ± 0.007 mm; p < 0.001). Fish in the deepest depth were longer than the fish in the 5-50 m depth (p < 0.001). Between taxonomic families, there were different patterns of length exhibited by depth (F~8,2818~ = 205.05, p < 0.001; @fig:length-family), although the trend was for the longest larvae to be in 50-100 m depth bin.

![The length (mm) of the reef fish larvae at three depth ranges (0, 5-50 m, 50-100 m)](../figs/length-family.png){#fig:length-all}

![The length (mm) of the reef fish larvae, by taxonomic grouping, at three depth ranges (0, 5-50 m, 50-100 m)](../figs/length-family.png){#fig:length-family}


Comparing across features the larval fish in the eddy were longer when comparing each of the depths (@fig:length-feature-all), although there was a significant interaction between feature and depth (F~2,2821~ = 15.956, p < 0.001). Post-hoc analysis showed the length of the fish at the surface and the 50-100 m of the eddy were the same (p < 0.001), the coastal water at the surface and 5-50 m bin were the same, and the 5-50 m bin of the eddy were the same length as the coastal 50-100 m bin fish. In general, the mean length, and the variation, in the eddies appeared to be larger than the coastal waters (@fig:length-feature-family).

![The length (mm) of the reef fish larvae at three depth ranges (0, 5-50 m, 50-100 m) and by oceanic feature (coastal waters or eddy)](../figs/length-feature-all.png){#fig:length-feature-all}

![The length (mm) of the reef fish larvae, by taxonomic family, at three depth ranges (0, 5-50 m, 50-100 m) and by oceanic feature (coastal waters or eddy)](../figs/length-feature-family.png){#fig:length-feature-family}

#### Labridae length

A significant regression equation was found for Labridae (F~8,1243~ = 46.06, p < 0.001, r^2^ = 0.22). There was a significant interaction between feature and depth (p < 0.001; @fig:labrid-length-interaction). Post-hoc tests showed the length of the larval Labridae in the coastal 50-100 m depth was the same as the Labridae in the 5-50 m and 50-100 m depths of the eddy. From the environmental data, there were negative effects of salinity (p < 0.001) and positive effects of temperature (p = 0.027) on the length of Labridae.

![Labrid interaction plot](../figs/labrid-length-interaction.png){#fig:labrid-length-interaction)

#### Mullidae length

Mullidae had a significant regression equation (F~8,235~ = 27.18, p < 0.001, r^2^ = 0.46), with a significant interaction between feature and the depth 5-50 m, with the coastal length less than the surface length, but the eddy length at this depth greater than the surface waters (@fig:mullid-length-interaction). The environmental variables of temperature (length increased with temperature; p < 0.001), and salinity (length decreased with salinity; p = 0.016).

![Mullid interaction plot](../figs/mullid-length-interaction.png){#fig:mullid-length-interaction)

#### Pomacentridae length

The Pomacentridae were analysed using a general linear model with a gaussian log-link distribution, and showed the Pomacentridae larval fish in the 50-100 m depth were longer than the other two depths (p < 0.001). Pomacentridae were also longer in the eddies that the coastal waters (p < 0.001). There were also significant predicators of length by temperature (0.31 degrees per mm; p < 0.001), salinity (3.74 PSU per mm, p = 0.002), and dissolved oxygen (-1.05 g/L per mm; p < 0.001).

#### Scaridae length

Scaridae had a significant regression equation (F~8,219~ = 3.867, p < 0.001, r^2^ = 0.09), with no significant predictor variables.

#### Scorpaenidae length

Scorpaenidae had a significant regression equation (F~8,167~ = 8.129, p < 0.001, r^2^ = 0.25), with a significant interaction between feature and the depth 5-50 m, with the length at this depth in the eddy higher than in the coastal waters (p = 0.047; @fig:scorpaenid-length-interaction). Salinity was a significant predictor, with a negative relationship with the length of the Scorpaenidae (p = 0.008).

![Scorpaenidae interaction plot](../figs/scorpaenid-length-interaction.png){#fig:scorpaenid-length-interaction)

#### Serranidae length

Serranidae had a significant regression equation (F~8,584~ = 31.74, p < 0.001, r^2^ = 0.29), with a significant interaction between feature and the depth 5-50 m, as the mean length increase (1.6 times) in the 5-50m depth was more than the increase (approx. 1.3 times) in the other depths for the eddy than the coastal waters (p = 0.049;  @fig:serranid-length-interaction). Temperature was also a significant positive predictor of Serranidae length (p < 0.001).


![Serranid interaction plot](../figs/serranid-length-interaction.png){#fig:serranid-length-interaction)


#### Synodontidae length

Synodontidae had a significant regression equation (F~8,131~ = 31.74, p < 0.001, r^2^ = 0.29), although there were no significant predictor variables for length in the model.

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

Scorpaenidae and Synodontidae were the only reef fish associated families within the chosen ichthyoplankton to exhibit an interaction between ontogenetic stage and the three experimental depths. The result was surprising, as we thought the relationship between stage and depth would be clearer as per the literature. For these families, the pattern supported our hypothesis that more developed larvae (in this case flexion and onwards) were more likely to be present at lower depths (50-100 m). For the other species, while we believe ontogenetic vertical migration patterns to exist, our experimental design appeared was perhaps too coarse to tease these relationships out. We can see there are patterns of difference, but the low catch rate of the different ontogenetic stages across all sites meant the analysis made it difficult to get significant predictors.

Environmental factors were also driving the differences in concentration of larvae at depth. Increasing temperature predicted the increased concentration of Labridae, Scaridae, Scorpaenidae, and lowered the odds of presence of Pomacentridae. Salinity was a positive predictor of both presence and concentration of Scaridae. Dissolved oxygen, which was also highly correlated with chlorophyll, has positive presence predictors for Mullidae and Serranidae, suggesting that ichthyoplankton also migrate to where the rest of the plankton are. Although Synodontidae were negatively associated with dissolved oxygen, possibly avoiding predators.


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

### Limitations

- Only 3 depths, perhaps too coarse to capture the initial
  - What about that middle 50m range, can be evenly split?
- Issues with sampling
  - Mortality means catch more preflexion
  - Larger fish are better at evading the nets (through swimming and detection)
  - Is 16 stations enough over such a huge area? Could be large environmental variation, shown that there are environmental drivers. Some low r^2 even with all the variables in - other things driving this behaviour = complicated story.
  - Perhaps sampling design was too low - too many zeros in the dataset to get a good distribution.

### Future directions

- Costly exercise - are there better ways?
- Difficult data collection means how do we ensure better results?
- Use the data to parametise models that require early-life history data.

### Conclusion

## References
