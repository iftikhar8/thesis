
# CHAPTER: Larval connectivity of Black Cod *Epinephelus daemelii* along the south-eastern coast of Australia and implications for conservation

# Introduction

AIMS:

1. To investigate the realised connectivity patterns from known spawning locations
2. To investigate the realised connectivity patterns from their known distribution?
3. How do the current marine parks fit in with these patterns of connectivity?

# Methods

## Study location

For detailed methods of the biophysical dispersal model used, see Chapter 3.

Black cod larvae were spawned between April-May 2004-2011 from 76 coastal reefs (grouped into 19 regions; MAKE FIGURE) along the breadth of New South Wales, matching the known distribution and spawning times (CITE Harasti). The spawning regions ranged from the Tweed down to Eden, and included Lord Howe Island and the offshore reefs Elizabeth and Middleton. For each reef, 1000 larvae were spawned daily over the 61 day period, 18.5 million larvae were released breeding season (148 million over the course of the simulation period).  Black cod were allowed to settle to reefs defined by benthic data obtained from the NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). In addition, reefs for Norfolk Island and New Zealand were included as potential settlement sites, as per their known distribution. The oceanographic current data was obtained from BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], see Chapter 3 methods for a complete description. The biological parameterisation was obtained from the literature where possible or using average values obtained in the review from Chapter 2 (@tbl:bio-params)


: Biological parametrisation for the larvae of the Black Cod (*Epinephelus daemelii*) in the biophysical dispersal model. {#tbl:bio-params}

| Parameter               | Value            | Reference         |
|-------------------------|------------------|-------------------|
| Pelagic larval duration | 60 (± 15) days   | CITE Francis 2016 |
| Hatching                | 0-3 (± 1) days   | CITE Cuhna 2013   |
| Preflexion              | 4-12 (± 1) days  | Cuhna 2013        |
| Flexion                 | 12-16 (± 1) days | Cuhna 2013        |
| Postflexion             | 16-60 (± 1) days | Cuhna 2013        |
| Settlement sensory      | 7 km             |                  |
| Olfactory sensory       | 10 km            |                   |
| U~crit~                 | 0.3 ms^-1^       | CITE Leis 2009    |
| In situ potential       | 0.16             | Leis 2009         |
| Endurance               | 0.5              | Leis 2009         |
| Mortality   | 0.1 day~-1~  |   |


## Data analysis

To assess the settlement patterns between regions, we looked at total settlement (each region had the same amount of larvae spawned and total settlement is given as a proportion) from each source region to all settlement regions, and the variation that occurred between the years 2004-2011. Non-metric multidimensional scaling (NMDS) ordination was used to assess settlement patterns for each region to all other regions, using Bray-Curtis dissimilarity measure with a square root transformation. NMDS was conducted using the r package *vegan* [CITE], with rows as sources sites and columns as settlement sites. To tests for differences between yearly settlement patterns, PERMANOVA using the adonis function within the r package *vegan* was used. Connectivity metrics of self-recruitment, local retention, settlement success and dispersal distance were calculated using the the R package *ConnMattTools* [CITE]. One-way ANOVAs were used to test for differences between total settlement between regions, and Student-Newman-Keuls (SNK) post-hoc tests were used to make comparisons between groups if the ANOVA was significant using the r package *agricolae* [CITE]. Graph analyses were conducted to compare the settlement patterns with current marine protected area networks using the r package *igraph*.

# Results

## Known spawning sites

### Solitary Islands

Most larvae spawned from the Solitary Islands self-recruit back to the region [72.9 ± 7.7%; @fig:solitary-settle], which was reflected by the lowest dispersal distance for any of the regions (62.0 ± 14.6 km). The next highest region of settlement was Nambucca, and then to Yamba with more yearly variation, which post-hoc tests found to be statistically different to each other. Outside of these three areas, settlement was weak, although larvae did disperse as far south as Batemans Bay region and in some years reaching Lord Howe Island and Elizabeth & Middleton Reefs.

Discussion points
- high number of SR
- important spawning region that self-recruits

![The yearly settlement (2004-2011) for black cod larvae spawned from the Solitary Islands region](chapters/applied/figs/solitary-settle.png){#fig:solitary-settle}

### Fish rock (Nambucca)

The highest successful settlement from Fish Rock was to the Port Macquarie region (@fig:fish-rock-settle). Self-recruiting larvae to Nambucca and settlement further south to the Crowdy Bay region, post-hoc analysis showed had similar settlement patterns. Fish rock had lower overall settlement compared to other region such as Solitary Islands, but with more variations, with some years settlement to Pt Stephens, Newcastle and Sydney was strong.

Discussion points
- Fish rock has more variable settlement downwards.
- Less self-recruitment, with more going south
- Some do get to solitary islands - connection between breeding populations

![The yearly settlement (2004-2011) for black cod larvae spawned from Nambucca (specifically the reef Fish Rock)](chapters/applied/figs/fish-rock-settle.png){#fig:fish-rock-settle}

### Pt Stephens

Pt Stephens showed high levels of self-recruitment (76.6% ± 9.0), and strong settlement to the Newcastle region (@fig:pt-stephens-settle). All other regions were considered similar by post-hoc analysis. Larvae did reach the southern regions of NSW, with a mean dispersal distance of 112.2 km (± 19.5).

Discussion Points
- Highly self-recruiting population
- Feeds Newcastle. Connects down the south coast

![The yearly settlement (2004-2011) for black cod larvae spawned from Port Stephens ](chapters/applied/figs/port-stephens-settle.png){#fig:pt-stephens-settle}


### Lord howe settlement

Even though Lord Howe island is an off-shore island, annual self-recruitment is not as high as many other NSW regions (43.9% ± 14.0). Most other larvae settle at both Middleton or Elizabeth reefs, but Lord Howe is connected to all regions of NSW coast, and some years the highest settlement Newcastle, Sydney or Wollongong (@fig:lord-howe-settle), reflected by a mean dispersal distance of 1036.2 km (± 136.1).

![The yearly settlement (2004-2011) for black cod larvae spawned from Lord Howe Island ](chapters/applied/figs/lord-howe-settle.png){#fig:lord-howe-settle}

### Elizabeth and middleton reefs

Self-recruitment for Elizabeth and Middleton reefs was lower than the other offshore region of Lord Howe island (31.8% ± 8.1), and a mean dispersal distance more than 6 times lower (153.2 km ± 77.2). The next highest region of settlement (and less variable) was to Lord Howe Island (@fig:e-m-settle). Larvae spawned from these reefs also made it to all the regions along the NSW coast, but settlement was higher in the Northern half of the state.

![The yearly settlement (2004-2011) for black cod larvae spawned from the offshore reefs of Elizabeth and Middleton](chapters/applied/figs/e-and-m-reef-settle.png){#fig:e-m-settle}


Discussion Pts
- Surprising (if weak) connectivity to all regions of NSW.
- Shows elizabeth, middleton, & lord howe are a network.


## Overall Settlement regions

The upper Northern coast, Byron, Yamba and Solitary islands had the highest settlement per year to the region (@fig:total-settle-region). Lord Howe, Elizabeth and Middleton reefs had the lowest number of settlers (off shore islands mean more lost larvae to the currents), but they had the highest settlement to different regions. Settlement at Pt Macquarie was lower compared to similar regions of latitude. The northern coast also had the highest number of successful settlers, settlement at Byron being considerably higher than the rest (@fig:total-source-region). Successful settlement from region decreased with latitude and the  offshore islands had the lowest successful settlers.

![The total yearly settlement (2004-2011) for black cod larvae to regions along the eastern Australian coast](chapters/applied/figs/total-settle-region.png){#fig:total-settle-region}

![The total yearly successful settlement (2004-2011) for black cod larvae born at regions along the eastern Australian coast](chapters/applied/figs/total-source-region.png){#fig:total-source-region}

Self-recruitment was highly variable between regions, mean self-recruitment was highest in the regions Crowdy Bay (89.6%), Batemans Bay (83.8%), Nambucca (82.9%), Jervis Bay (80.3%), and below 30% in the regions Port Macquarie (29.4%) and the Tweed (15.7%). Self-recruitment averaged across all regions also varied between years, highest in 2008 (62.5%), 2011 (61.3%) and lowest in 2010 (52.2%). Local retention was significantly the highest in the regions of the Batemans Bay, Port Stephens, The Tweed and Lord Howe Island, and the lowest region was Eden (12.9%). The mean local retention for all regions per year varied, highest in 2008 (70.5%) and lowest in 2010 (58.3%). Dispersal distance was longest in the southern regions of Eden (1325 km), Batemans Bay (483 km), and Lord Howe Island (1036 km).

Each region shared overlapping settlement patterns with the regions directly above or below latitudinal (@fig:nmds). the only region that did not was Newcastle, which was similar to Sydney more than Pt Stephens. Newcastle tends to be the bottom of the separations zone, which could describe these results. In fact the areas where the separation zone usually occurs -30 to -32 are where the most differences occurred between regions. The yearly variation was largest for the offshore reefs (Lord Howe, Elizabeth, and Middleton). The northern NSW regions of Tweed, Byron, Ballina, Yamba, and Solitary Islands had similar settlement patterns, driven by a strong EAC. The regions in southern NSW also had similar settlement patterns.

![nMDS comparing the yearly (2004-2011) settlement patterns from each region to all the other regions of NSW and each point is a year and regions are coloured and grouped by ellipses. Bray-curtis dissimilarities were used with a square-root transformation (2D stress = 0.12)](chapters/applied/figs/nmds-regions.png){#fig:nmds}

## Marine parks


# Discussion
