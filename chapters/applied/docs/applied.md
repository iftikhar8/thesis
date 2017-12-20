
# CHAPTER: Larval connectivity of Black Cod *Epinephelus daemelii* along the south-eastern coast of Australia and implications for conservation

# Introduction


AIMS:

1. To investigate the realised connectivity patterns from all spawning regions
2. To investigate the realised connectivity patterns from known spawning regions
3. Does the current marine park network protect areas of strong demographic connectivity?

# Methods

## Study location

[Info about study species - i'll put more in the introduction though]

The black cod, *Epinephelus daemelii* (Gunther, 1876), is also known commonly as the black rockcod, the saddled rockcod, and the saddletail grouper, is a large temperate marine reef fish of the family Serranidae. It occurs along the eastern Australian coast, with reported sightings from southern Queensland down to the Bass Strait, but primarily along the NSW coastline [CITE Fish base, Atlas of living australia]. Black cod have been seen to grow up to 200 cm TL, and weigh up to 68 kg. Black cod live in caves and rocky reef holes at depths of up to 50 m. Its known distribution ranges from southern Queensland down to Bass Strait, and to the offshore reefs of Lord Howe Island, Elizabeth and Middleton Reefs, and Norfolk Island. There are also populations in New Zealand and the Kermadec Islands. The highest abundances of Black cod occur along the NSW coast (CITE Harasti).

I used a biophysical dispersal model (BDM) to measure the connectivity of black cod (ZISSOU, v1.1.3 [github.com/shawes/zissou]), see Chapter 3 methods for a complete description. The oceanogeaphic model used to couple with ZISSOU was BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], a data-asismilating hindcast model which resolves mesoscale eddies with mean daily velocities. BRAN3 has a resolution of 0.1° latitude and longitude, and resolves depth velocities at bins of 5-10 m. Citing similar studies, an eddy diffusivity value (K) of 300 ms^-1^ was implemented in the model [CITE condie, chiswell]. The larvae in the BDM were forced using a time step of two hours.

Black cod larvae were spawned between the known aggregating months April-May every year over the period 2004-2011. The spawning region split NSW into 17 approximately equally sized regions down the coastline (~125 km each), and included two off-shore spawning sites, Lord Howe Island and the Elizabeth and Middleton reefs (19 spawning regions in total; @fig:release-sites). For each reef patch, 4000 pelagic eggs were spawned daily (16,000 per region) over the 61 day period; 18.5 million eggs were released each breeding season and in total 148 million over the course of the experiment were released. Black cod were allowed to settle to reef patches, which were identified using benthic data obtained from the NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au). Patches of benthic data of unknown type were considered to be reef patches and black cod larvae were therefore allowed to settle. In addition, reefs for Norfolk Island and New Zealand were included as potential settlement sites, as per their known distribution (CITE Harasti). Biological parameters were obtained from the literature, and if no data on was found *E.daemelii*, either similar species, genus averages, or general data was used to parameterise the model (@tbl:bio-params).

![The 19 regions (each containing four rocky reef patches) used to spawn the black cod *Epinephelus daemelii* larvae along the coastline of New South Wales, Australia](chapters/applied/figs/release-sites.png){#fig:release-sites}


: Biological parametrisation for the larvae of the Black Cod (*Epinephelus daemelii*) in the biophysical dispersal model. For species, generic indicates that a general value that could apply to all reef fish species was used to determine the value as no specific data could be found {#tbl:bio-params}

| Parameter               | Value            | Reference         | Species |
|-------------------------|------------------|-------------------|---------|
| Spawning time   | April-May  | Harasti  | Epinephelus daemelii  |
| Pelagic larval duration | 60 (± 15) days   | CITE Francis 2016 | Epinephelus daemelii |
| Hatching                | 0-3 (± 1) days   | CITE Cuhna 2013   | Epinephelus marginatus |
| Preflexion              | 4-12 (± 1) days  | Cuhna 2013        | Epinephelus marginatus |
| Flexion                 | 12-16 (± 1) days | Cuhna 2013        | Epinephelus marginatus |
| Postflexion             | 16-60 (± 1) days | Cuhna 2013        | Epinephelus marginatus |
| Settlement sensory      | 7 km             |                  | Generic
| Olfactory sensory       | 10 km            |                   | Generic
| U~crit~                 | 0.3 ms^-1^       | CITE Leis 2009    | Epinephelus spp.
| In situ potential       | 0.16             | Leis 2009         | Epinephelus spp.
| Endurance               | 0.5              | Leis 2009         | Epinephelus spp.
| Mortality   | 0.1 day~-1~  |   | Generic |


## Data analysis
To assess the settlement patterns between regions, I looked at total settlement (as each region had the same number of larvae spawned) from each source region to all settlement regions, and the variation that occurred between the years 2004-2011. Connectivity matrices and dispersal kernels were determined for each year the model was run. For each connectivity matrix, the metrics of self-recruitment, local retention, and settlement success were calculated using the r package *ConnMattTools* [CITE]. Mean dispersal distance for each region was obtained from the dispersal kernel. To test for annual variation
on each of these metrics, analysis was done using one-way ANOVAs with source region and year as factors. Student-Newman-Keuls (SNK) post-hoc tests were used to make comparisons between groups if the ANOVA was significant using the r package *agricolae* [CITE]. Non-metric multidimensional scaling (NMDS) ordination was used to assess how similar were settlement patterns from each region in each year (the ‘samples’ in the analysis) to all other regions in the domain (the multivariate response). Analysis used a Bray-Curtis dissimilarity measure with a square root transformation. NMDS was conducted using the r package vegan [CITE]. PERMANOVA, using the adonis function within the r package vegan, was used to test for annual variation between settlement patterns. To identify strongly connected regions, sub-communities, graphs were constructed using the r packages *igraph* and greedy optimisation of modularity was conducted using edges between regions weighted by the mean annual settlement. To asses marine park connectivity, regions containing marine parks (either NSW or Commonwealth) were considered to be protected areas. The marine parks falling into regions at the time of writing are NSW marine parks (Cape Byron, Solitary Islands, Port Stephens, Jervis Bay, Batemans Bay, and Lord Howe Island), NSW aquatic reserves (Tweed, Sydney), and Commonwealth marine parks (Pt Macquarie, Elizabeth and Middleton reefs).

# Results

## Overall picture of univariate metrics

Four release regions had levels of self-recruitment consistently above 75% (Nambucca, Crowdy Bay, Port Stephens, and Eden), and another seven regions had self-recruitment on average above 50% (@fig:region-metrics A). The regions Crowdy Bay and Sydney had the least variation between years, while Lord Howe Island had the largest yearly variation, followed by Elizabeth and Middleton Reefs (E\&M Reefs), Newcastle, Port Macquarie, and the Tweed. Some regions had single years where self-recruitment was lower than normal (15-25%), e.g. Solitary Islands, Port Stephens, Jervis Bay, and Eden. There was significant differences to the mean annual self-recruitment (F~(7,126)~ = 3.025, p < 0.05; @fig:year-metrics A). Post-hoc tests indicated the two highest years (2011 and 2008) were significantly 10% higher than 2010, which recorded the lowest annual self-recruitment values. The mean self-recruitment values averaged across the regions for each year was always above 50%.

Local retention followed similar patterns to self-recruitment (@fig:region-metrics B). Local retention was highest in Crowdy Bay, Yamba, and the Solitary Islands, although Crowdy Bay was more consistent between years. The lowest local retention occurred at Lord Howe Island and Elizabeth and Middleton reefs, and it was consistently low for each year of the model. Eden, which had high self-recruitment, had only mid-range local retention values compared to the other regions, but had minimal annual variation. Yamba, Solitary Islands and Ulladulla had the largest annual variation in the larvae that were locally retained. Mean annual local retention varied annually (F~(7,126)~ = 22.214, p < 0.05). 2007 and 2004 both had significantly lower local retention than all of the other years, the mean of 2007 was half the mean local retention in 2008, even the maximum value in 2007 was equivalent to the mean of 2008 (@fig:year-metrics B).

Settlement success exhibited latitudinal patterns, strongly increasing with latitude from the Tweed until Yamba and then reversing and strongly decreasing with latitude until Port Macquarie (@fig:region-metrics C). Settlement success increased again until the Newcastle and Sydney regions, after which it decreased gradually with latitude. Settlement success was lowest at Lord Howe Island, and the Elizabeth and Middleton reefs. Eleven of the regions had a single year that was an outlier, nine of which resulted in reduced settlement. The annual variation of settlement success was fairly consistent across regions, with the Tweed, Byron and Port Macquarie regions producing the largest variation values. Settlement success was consistent with 2011, 2008, 2010, 2006, and 2005 and reporting the similar annual mean settlement success (@fig:year-metrics C). The years 2009, 2004, and 2007 had significantly lower settlement success (F~(7,126)~ = 27.068, p < 0.05). The black cod larvae in the year 2011 (with the highest chance of settlement success), were 1.8 times more likely to successfully find settlement habitat.

Dispersal distance showed an inverse latitudinal pattern to settlement success, e.g. where settlement success is high, dispersal distance is low (@fig:region-metrics D). Lord Howe Island, and Elizabeth and Middleton reefs larvae dispersed the longest, with mean distances over 1000km. Of the coastal regions, Eden, Merimbula, and Port Macquarie dispersed the longest. There were annual differences between the yearly mean dispersal differences (F~(7,126)~ = 2.70, p < 0.05), however post-hoc tests could not identify different significant groupings. The highest mean dispersal distances occurred in 2004 and 2007, the lowest 2005 and 2011 (@fig:year-metrics D).

![The connectivity metrics of self-recruitment (A), local retention (B), settlement success (C), and dispersal distance (D; km) for each of the 19 regions Black Cod (*Epinephelus daemelii*) larvae were released in the dispersal model.](chapters/applied/figs/region-metrics.png){#fig:region-metrics}

![The mean connectivity metrics of self-recruitment (A), local retention (B), settlement success (C), and dispersal distance (D; km) for the years 2004-2011 (*Epinephelus daemelii*) larvae were released in the dispersal model.](chapters/applied/figs/region-metrics.png){#fig:year-metrics}

Patterns of settlement across the 19 regions was significantly different (F~model(7,151)~ = 82.67, p < 0.05, r^2^= 0.92; @fig:nmds-regions). Each region shared overlapping settlement patterns with the regions directly above or below latitudinal. The only region that did not was Newcastle, which was similar to Sydney more than Pt Stephens. Newcastle tends to be the bottom of the separations zone, which could describe these results. The regions where the separation zone usually occurs -30 to -32, is where the most differences occurred between regions. The yearly variation was largest for the offshore reefs (Lord Howe, Elizabeth, and Middleton). The northern NSW regions of Tweed, Byron, Ballina, Yamba, and Solitary Islands had similar settlement patterns, driven by a strong EAC. The regions in southern NSW from Jervis Bay to Merimbula also had similar settlement patterns. There was no clear effect of year on the settlement patterns, as annual variation was region specific (F~model(7,151)~ = 0.18, p > 0.05, r^2^ = 0.01; @fig:nmds-years), although 2007 stands out as the most different amongst the years.

![nMDS comparing the yearly (2004-2011) settlement patterns from each region to all the other regions of NSW and each point is related to the total settlement per year and regions are coloured and grouped by ellipses. Bray-curtis dissimilarities were used with a square-root transformation (2D stress = 0.12)](chapters/applied/figs/nmds-regions.png){#fig:nmds-regions}

![nMDS comparing the yearly (2004-2011) settlement patterns from each region to all the other regions of NSW and each point is related to the total settlement per year in a region and different years are coloured. Bray-curtis dissimilarities were used with a square-root transformation (2D stress = 0.12)](chapters/applied/figs/nmds-years.png){#fig:nmds-years}


Discussion points
- Strong latitude patterns - why? How do the coastal dynamics match? Seperation zone?
- e.g. Port macquarie is always low, crowdy bay, solitary and yamba is always high
- High self-seeding for many regions (oceanographic related , e.g. strong downwards currents and eddies)
- Some regions showed more yearly variation than others, not consistent. 2007 dispersed more and less local recruitment and settlement success. Not a special climatic year (Strong La nina (2010-11), moderate El-nino (2009-2010).


## Known spawning sites

The three highest settlement regions were all the known aggregating regions of Solitary Islands, Nambucca, and Port Stephens (@fig:known-settle-region). Yamba and Newcastle were the other sites receiving the highest numbers of new recruits, and the south coast had seemingly negligible connectivity. Solitary Islands produced the most successful number of larvae that find suitable habitat, mostly to itself (self-recruitment values of 72.9 ± 7.7%; @fig:region-metrics A), but also to Nambucca, and Yamba (@fig:known-source-region). This high self-recruitment was reflected by the low dispersal distance for larvae from the Solitary Islands (@fig:region-metrics D). Port Stephens and Nambucca both had similar numbers of larvae successful settle (@fig:known-source-region), and also approximately the same high proportions of self-recruitment at about 80% (@fig:region-metrics A). The settlement at Port Stephens showed less annual variability than either the Solitary Islands and Nambucca (@fig:known-settle-region). Pt Stephens showed strong settlement to the Newcastle region, and were able to reach the southern regions of NSW, with a mean dispersal distance of 112.2 km (± 19.5) ()@fig:region-metrics D). Even though Lord Howe Island, Elizabeth and Middleton reefs all support populations of black cod, the connectivity from the models was seemingly minimal with low successful settlement. Even though Lord Howe island is an off-shore island, annual self-recruitment is not as high as many other NSW regions (43.9% ± 14.0; @fig:region-metrics A). Most other larvae settle at both Middleton or Elizabeth reefs, but Lord Howe is connected to all regions of NSW coast, and some years the highest settlement Newcastle, Sydney or Wollongong, reflected by a mean dispersal distance of 1036.2 km ± 136.1; @fig:region-metrics D). Self-recruitment for Elizabeth and Middleton reefs was lower than the other offshore region of Lord Howe island (31.8% ± 8.1), and a mean dispersal distance more than 6 times lower (153.2 km ± 77.2). The next highest region of settlement (and less variable) was to Lord Howe Island. Larvae spawned from these reefs also made it to all the regions along the NSW coast, but settlement was higher in the Northern half of the state. Despite being included in the model, no larvae settled at either New Zealand or Norfolk Island, suggesting these populations are not connected to the ones within NSW regions.

![The yearly settlement (2004-2011) for black cod larvae to all 19 regions along the NSW coast and offshore that were spawned only from the known aggregation regions; Solitary Islands, Nambucca (Fish Rock), Port Stephens (Pinnacle Rock), Lord Howe Islands, and Elizabeth and Middleton reefs.](chapters/applied/figs/known-settle-region.png){#fig:known-settle-region}

![The yearly settlement (2004-2011) for black cod larvae spawned from the known aggregation regions; Solitary Islands, Nambucca (Fish Rock), Port Stephens (Pinnacle Rock), Lord Howe Islands, and Elizabeth and Middleton reefs.](chapters/applied/figs/known-source-region.png){#fig:known-source-region}

Discussion Pts
- Surprising (if weak) connectivity to all regions of NSW.
- Spawning regions are key self-seeding areas
- Shows elizabeth, middleton, & lord howe are linked (and linked with the coast)


## Marine Park Connectivity

Due to the life cycle of the black cod, marine protected areas are important in protecting the adult fish to both grow to a sufficient age with which to spawn, and to be allowed to spawn in sufficient numbers. The three highest areas of settlement from known spawning sites, and the three spawning areas with highest settlement all occur in NSW marine protected areas, Solitary Islands, Nambucca and Port Stephens (@fig:known-settle-region, @fig:known-source-region). The black cod larvae at all three have high levels of self-recruitment and local retention, allowing for strong potential population sustainability within these marine parks. When considering each region as a release region, only one out of the four highest areas of settlement contains a marine park, Solitary Islands (@fig:known-settle-region). Considering the top five source areas for successful settlement, two of them contain marine parks; Solitary Islands, and Sydney (Aquatic Reserve; @fig:known-source-region). When considering the sub-communities that form the network of demographically connected regions from all possible spawning sites, there is at least one marine protected area in each sub-community (@fig:dendro-regions).

![Dendrogram of communities detected through greedy optimisation of modularity using the mean yearly settlement between regions](chapters/applied/figs/dendo-all-regions.png){#fig:dendro-regions}

Discussion
 - Marine protected areas seem to be in many of the right places? Ballina and Yamba the big exclusions with the highest source settlement
 - Although this is looking at regional connections, MPAs don't span the entire region
 - Also different usages, if adults can be fished by rec fishers for example are the protections there
 - Really don't care so much about locations of larvae settlement, but ability to breed (we know they spawn after many years and can migrate long distances). Seems to do well protecting known spawning areas - probably helps its been vunerable for so long and planning went into it (need to find info about this - is population increasing, seems no one knows)
 - Good to see lots of genetic drift also (interesting none to NZ or Norfolk)


# Discussion
