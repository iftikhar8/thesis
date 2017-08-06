<!-- lint disable no-undefined-references -->
<!-- lint disable no-shortcut-reference-link -->
<!-- lint disable maximum-line-length -->
<!-- lint disable maximum-heading-length -->

# Is length or ontogeny a predictor of the vertical position of temperate reef ichthyoplankton in NSW?

## Introduction

### Why are we doing it? Was is it? Background

### Give the context of discovering early-life history behaviour, what has been done before?

### Aims / Hypothesis

Clearly state the hypothesis / problem being addressed (topic being addressed)

- We investigated.....
- Add in the rationale
- Why did you choose the experimental design, e.g. utilised other design based on competitive ship time

## Methods
Sixteen stations were sampled along the eastern coast of Australia on Australian Marine National Facility RV _Investigator_ (<http://www.csiro.au/en/Research/Facilities/Marine-National-Facility>) RV _Investigator_ (2-18 June 2015, voyage IN2013_V03). We sampled stations within two coastal regions and two frontal eddies in the Eastern Australian Current (EAC) [CITE study figure]. The location of the frontal eddies were calculated onboard using real time data and novel techniques [CITE Moninya's paper].

- Create graphic of study area with station locations

At each station we sampled for larval fish using two different net types, a multiple opening/closing net and environmental sensing system (MOCNESS) and Neuston net. Both nets consisted of 1 m^2 mouth areas with 500 \mu m mesh sizes. The MOCNESS system sampled at two different depths 5-50 m and 50-100 m, conducting two 10 minute tows over each depth range (four tows per station). The Neuston net captured larval fish at the near surface level and was deployed for two 10 minute tows per station. Neuston and MOCNESS nets were deployed at the same time and all tows were conducted between sunset and sunrise. Conductivity, temperature, and depth (CTD) measurements, including dissolved oxygen, were taken on the MOCNESS net at each station. Each net had a flow sensor, enabling concentrations of larval fish per cubic metre to be calculated. Plankton samples per station were split 50:50 between preserved in 90% ethanol or a 10% buffered formalin solution. Ethanol was used in case genetic or otolith analysis was required later on some of the larval fish.

### Data processing
Each sample was initially sorted to seperate the ichthyoplankton from the general plankton samples. The larval fish were then sorted by morphological features and identified to family taxonomic level where possible, referring to reference guides and expert help where appropriate (CITE: books CalCOFI, Leis & Calvert, Miskiwiez et al.). The most common (greater than 100) reef associated fish families were identified from the samples and their ontogenetic stage was identified (i.e. preflexion, flexion, or postflexion). Each fish was photographed using a calibrated stero microscope and measured to \mum accuracy using the software Image-Pro Insight (<http://www.mediacy.com/imageproinsight>). No accounting for shrinkage was conducted.

- Photographs of the three ontogenetic stages examples?

### Data analysis
The ontogeny count data was standardised by the flow to a concentration (m^3). Due to the excessive zero count for the ontogeny data, we conducted two analyses using generalised linear models (GLM), one GLM on the presence/absence of ontogenetic stages using a binomial distribution and another GLM with a log-normal distribution on the data excluding the zero observations. The larval fish length data was analysed using GLMs with log-normal distributions. As there was there was not enough replication to use a mixed-model GLM, instead the stations were described using the measured environmental data at each station; temperature, salinity, and dissolved oxygen.
All analysis was conducted using R [@RAlanguageanden:wf] with the packages tidyverse [@Wickham:2016te], lme4 [CITE], and lsmeans [CITE] for analysis.

## Results

### General Fish results

For our analysis we chose the seven most abundant reef associated families (chosen with > 100 fish). These seven families comprised of 2827 fish in total, of which 44.3% came from the family Labridae (@tbl:definitions). Two surface tows, at site 16 and 5

: The total catch numbers for the seven most abundant reef fish associated families caught during the cruise. The total number identified and the number at each ontogenetic stage (preflexion, flexion and postflextion) is listed, as well as the mean length in mm (± standard deviation) {#tbl:summary}

Family        | Preflexion | Flexion | Postflexion | Total | Mean length (mm)
------------- | ---------- | ------- | ----------- | ----- | :--------------:
Labridae      | 273        | 383     | 596         | 1252  |   5.91 (±2.79)
Mullidae      | 123        | 61      | 60          | 244   |   7.44 (±6.31)
Pomacentridae | 102        | 84      | 8           | 194   |   3.88 (±1.50)
Scaridae      | 9          | 126     | 93          | 228   |   5.90 (±1.75)
Scorpaenidae  | 50         | 56      | 70          | 176   |   5.15 (±2.16)
Serranidae    | 469        | 107     | 17          | 593   |   3.32 (±1.47)
Synodontidae  | 63         | 39      | 38          | 140   |  10.35 (±6.53)

### Site variation

- Include graph on the variation for each variable by site (Y axis is depth, X is variable)

### Ontogeny results

#### Patterns


#### Presence / absence data


#### Concentration (non-zero data)

#### Labridae

The presence of Labridae was driven by depth, with odds of Labridae being present at the 50-100 m depth range (p = 0.040) higher than the upper 50 m or surface. Temperature was also an indicator of presence, with more present as the temperature increased (p = 0.018). For the non-zero data, the concentration was also driven by the temperature, increasing as temperature increased (p = 0.031).

#### Mullidae

The presence of Mullidae was driven by the dissolved oxygen (p = 0.049). Although when looking at the non-zero data, no significant predictors of concentration were found.

#### Pomacentridae

Pomacentrid presence was negatively predicted by an increase in temperature (p = 0.041). There were no significant predictors of concentration when only looking at the non-zero data.

#### Scaridae

The presence of scarids was strongly predicted by the temperature (p < 0.001), but also the salinity (p = 0.039). Depth was also a predictor, with increasing odds of presence in the 5-50 m range (p = 0.033) and more again in 50-100 m range (p = 0.018). When looking at the non-zero data, only the environmental salinity was a predictor of concentration (p = 0.023).

#### Scorpaenidae

Temperature was again a strong predictor of the presence of scorpionfish (p < 0.001). There was an increase of presence at the depth 5-50 m inside an eddy (p = 0.045). The was also a decrease in presence of preflexion larval fish at the 50-100 m depth range (p = 0.029). There were no significant predictors for concentration.

#### Serranidae

The presence of serranid was predicted by dissolved oxygen (p = 0.008). There were no predictors of concentration.

#### Synodontidae

The presence of preflexion synodontidae at 50-100 m was lower (p = 0.033). The envronmental variable of temperature increase the presence (p < 0.001) and was decreased by dissolved oxygen (p = 0.040).








### Length results

- Objectively display, without interpretation
- Logical order
- Start with text and refer to figures and tables

## Discussion

- Interpretation (in light of what is already known)
- How do we move forward from the introduction
- What new understandings have we got?
- What would be the next steps

- ## Use the same structure as the results

  #### Ontogeny

### Length

### Limitations

### Future directions

### Conclusion

## References
