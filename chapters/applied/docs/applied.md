
# Larval connectivity of Black Cod *Epinephelus daemelii* along the south-eastern coast of Australia and implications for its conservation management

## Introduction

### Black cod intoruction


### Connectivity introduction


## Connectiivty and marine parks



## Black cod threats.



- while illegal to fish for black cod either recreational or commercial
- there is bycatch threat



AIMS:

1. To investigate the potential connectivity patterns of black cod larvae along the NSW coastline.
2. To investigate the if the current NSW and Commonwealth marine park network protect areas of strong demographic connectivity of black cod larvae.

# Methods

## Study location

[Info about study species - i'll put more in the introduction though]

The black cod, *Epinephelus daemelii* (Gunther, 1876), also known commonly as the black rockcod, the saddled rockcod, and the saddletail grouper, is a large temperate marine reef fish of the family Serranidae. It occurs along the eastern Australian coast, with reported sightings from southern Queensland down to the Bass Strait, but primarily along the NSW coastline [CITE Fish base, Atlas of living australia]. Black cod have been seen to grow up to 200 cm TL, and weigh up to 68 kg. Black cod live in caves and rocky reef holes at depths of up to 50 m. Its known distribution ranges from southern Queensland down to Bass Strait, and to the offshore reefs of Lord Howe Island, Elizabeth and Middleton Reefs, and Norfolk Island. There are also populations in New Zealand and the Kermadec Islands. The highest abundances of Black cod occur along the NSW coast (CITE Harasti).

I used a biophysical dispersal model (BDM) to measure the connectivity of black cod (ZISSOU, v1.1.3; http://www.github.com/shawes/zissou), see Chapter 3 methods for a complete description. The model allows for the implementation of many biological behaviours e.g. ontogenetic vertical migration (OVM), diel vertical migration (DVM), and orientated horizontal swimming (OHS). The model was forced with oceanographic data from BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], a data-assimilating hindcast model which resolves mesoscale eddies with mean daily velocities. BRAN3 has a resolution of 0.1° latitude and longitude, and resolves depth velocities at bins of 5-10 m. As with similar studies  [CITE condie, chiswell], an eddy diffusivity value (K) of 300 ms^-1^ was implemented in the model. Larvae positions in the BDM were updated based on a time step of two hours.

Patterns of annual settlement were assessed for the period 2004-2011 by spawning and tracking the settlement of larvae along the coast of NSW and offshore islands. Nineteen spawning regions were chosen, 17 along the NSW coast (approximately equally sized spawning regions at ~125 km each), and with two off-shore areas, Lord Howe Island and Elizabeth and Middleton (EM) reefs (considered as a single region; Figure 1). Reef patches within each region was identified (as per Chapter 3), using benthic data obtained from the NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au) with areas of roughly equally sized sections of contiguous reef demarked as specific reef patches’ (total of 560 in the model domain). Larvae were spawned from four reef patches per region (chosen using either the known distribution or randomly if there was no specific data), daily between the known aggregating months, April-May, every year over the period 2004-2011. For each reef patch, 4000 pelagic eggs were spawned per day (16,000 per region) over the 61 day period. In total, 18.5 million eggs were released each breeding season and 148 million over the course of the experiment. Black cod were allowed to settle to reef & rock intertidal patches if they came within the settlement sensory distance, after the settlement competency window and before the pelagic larval duration. Black cod were allowed to settle to reefs in Queensland, Victoria, Norfolk Island, and New Zealand as per the known distribution, although none of which have known breeding populations [CITE Harasti]. Biological parameters were obtained from the literature, and if no data was found for *E.daemelii* specifically, either similar species, genus averages, or general data was used to parameterise the model (@tbl:bio-params).

![The 19 regions (each containing four rocky reef patches) used to spawn the black cod *Epinephelus daemelii* larvae along the coastline of New South Wales, Australia and the offshore areas of Lord Howe Island, Elizabeth reef, and Middleton reef (E&M reefs)](chapters/applied/figs/release-sites.png){#fig:release-sites}

: Biological parametrisation for the larvae of the Black Cod (*Epinephelus daemelii*) in the biophysical dispersal model. For species, generic indicates that a general value that could apply to all reef fish species was used to determine the value as no specific data could be found and instead values seen in chapter 2 were used. {#tbl:bio-params}

| Parameter                    | Value (± s.d.)   | Reference         | Species                |
|------------------------------|------------------|-------------------|------------------------|
| Spawning time                | April-May        | Harasti           | *Epinephelus daemelii*   |
| Pelagic larval duration      | 60 (± 15) days   | CITE Francis 2016 | *E. daemelii*   |
| Settlement competency window | 40 days          | Chapter 2         | Generic                |
| Hatching                     | 0-3 (± 1) days   | CITE Cuhna 2013   | *Epinephelus marginatus* |
| Preflexion                   | 4-12 (± 1) days  | Cuhna 2013        | *E. marginatus* |
| Flexion                      | 12-16 (± 1) days | Cuhna 2013        | *E. marginatus* |
| Postflexion                  | 16-60 (± 1) days | Cuhna 2013        | *E. marginatus* |
| Settlement sensory           | 7 km             |                   | Generic                |
| Olfactory sensory            | 10 km            |                   | Generic                |
| U~crit~                      | 0.3 ms^-1^       | CITE Leis 2009    | *Epinephelus spp.*       |
| In situ potential            | 0.16             | Leis 2009         | *Epinephelus spp.*      |
| Endurance                    | 0.5              | Leis 2009         | *Epinephelus spp.*       |
| Mortality                    | 0.1 day^-1^      | Chapter 2          | Generic                |


1.	To investigate the realised connectivity patterns from all spawning regions
2.	To investigate the realised connectivity patterns from known spawning regions
3.	Does the current marine park network protect areas of strong demographic connectivity?

First provide some overall structure to the analysis…say broadly how you approched the analysis to address your aims.  Yo unever mention your aims in here at all.

There’s no mention in here of known spawning sites versus the others.

## Data analysis

The BDM generates as output (per calendar year) a connectivity matrix (connectivity between larval source region (row~*i*~) and settlement region (column~*j*~), where each element~*i,j*~ proportion of all larvae spawned at *i* which settled at *j* over the release year) is the proportion settled, a dispersal kernel (dispersal path of the settled larvae) and a GIS Shapefile displaying the trajectories of a random subset (5%) of larvae. To investigate the first two aims, comparing connectivity patterns from source to settlement regions, multivariate non-metric multidimensional scaling (NMDS) ordination was utilised, using settlement from a source region in each year as the sampling unit. Analysis used a Bray-Curtis dissimilarity measure with a square root transformation. NMDS was conducted using the R package *vegan* [CITE]. To quantitatively compare the settlement patterns between regions and across years, the multivariate analysis technique PERMANOVA was used via the *adonis* function within the R package *vegan*. Constrained correspondence analysis (CCA) using the r package *vegan* [CITE] was used to see which regions were contributing the most to differences between the annual total settlement.

To further understand the connectivity, univariate metrics of self-recruitment, local retention, settlement success, and dispersal distance for each region were calculated from both the connectivity matrices and dispersal kernels, comparing between regions and years using one-way ANOVAs with the factors source region and year. Student-Newman-Keuls (SNK) post-hoc tests were used to make comparisons between groups if the ANOVA was significant using the R package *agricolae* [CITE]. Strong demographically connected regions were identified, i.e. sub-communities, using modularity optimisation (Walktrap method) on a connected graph, with source regions are nodes and the edges between weighted by the mean annual settlement, using the R package *igraph* [CITE package]. Communities are defined by vertexes (regions) having strongly weighted bi-directional edges (settlement) with each other. The Walktrap method uses random walks along the network to identify communities (CITE Pons) and is considered accurate for graphs with a small number of vertices (CITE Yang). To specifically address the second aim, I compared the total settlement across regions for each year sourced from all regions to the settlement patterns seen using only the known aggregation regions of Solitary Islands, Nambucca, Port Stephens, Lord Howe Island, and Elizabeth and Middleton reefs (CITE Harasti).

To assess the effectiveness of the current marine network (my third aim) with the modelled connectivity patterns, the NSW marine parks were considered (Cape Byron Marine Park, Solitary Islands Marine Park, Lord Howe Island Marine Park, Port Stephens-Great Lakes Marine Park, Jervis Bay Marine Park, and Batemans Marine Park). In addition, the Commonwealth marine reserves which are located within the dispersal area were considered, Lord Howe Commonwealth Marine Reserve (which contains Elizabeth and Middleton reefs), and Cod Grounds Commonwealth Marine Reserve. Due to the life-history of Black Cod (larvae mature in rock pools, juveniles and young adults age in estuaries and adults migrate to suitable habitat [CITE harasti]), I considered the spawning grounds (areas of aggregation) to be the areas that are of greater need of protection due to threat of by-catch fishing pressure from both commercial and recreational fishers. the only aquatic reserve considered to have suitable black cod habitat were considered (Cook Island and Cabbage Tree Bay Aquatic Reserve).

# Results

## Assessing the realised connectivity patterns from all regions

The strongest demographic connectivity for all source regions occurred to geographically close settlement regions, although each source region along the NSW coast showed long tails of connectivity with down the coast of NSW (@fig:heatmap-all). Larvae, in general, settled in highest numbers to their natal region, the exceptions being the regions Tweed, Port Macquarie, and Jervis Bay. Strong demographic connectivity occurred with the regions directly to the north or south of the source region. Below Newcastle (Sydney to Eden), source regions had more northward settlement, Ulladulla and Merimbula have limited connectivity to Tweed and/or Queensland in 2007, but this connectivity was weak and variable. The offshore areas of Lord Howe Island, and Elizabeth and Middleton (EM) reefs also mostly recruited to the natal sites and to each other, but also both connected to all sites along the NSW coastline and to Queensland, with the strongest connectivity to sites above Jervis Bay. The connectivity between Lord Howe, EM reefs, and the NSW coastline, while weak, was bi-directional (@fig:heatmap-all). No connectivity was seen to occur to either Norfolk Island or New Zealand from any of the chosen source regions. These patterns can be seen in the dispersal trajectories of black cod larvae that settled (@fig:trajectories). Larvae were generally dispersed along the coast, but some got entrained by large mesoscale eddies, most notably off the southern coast of NSW. Larvae that settled between the NSW coast and the offshore islands often dispersed long distances before reaching an appropriate settlement habitat.

![The connectivity matrix of the mean proportion of total settlement (log~-10~) from all source regions to settlement regions for the years (2004-2011), using a log scale on the settlement proportions.](chapters/applied/figs//heatmap-all.png){#fig:heatmap-all}

![Comparison of a subset (5% of the larvae were randomly selected) of the trajectories for the settled black cod *Epinephelus daemelii* larvae from all source regions for each release year (colours are random and unique to each sub-figure and give indication of different source regions.)](chapters/applied/figs/trajectories-years.png){#fig:trajectories}

Comparing the mean annual settlement patterns by source regions, strong latitudinal patterns were also expressed. The source regions with the most similar settlement patterns occurred in close geographical proximity (@fig:nmds-settlement A). Although, settlement patterns were more similar in the most northern and most southern regions, with the regions Nambucca to Sydney showing more dissimilarity. Comparing the connectivity from each source region to each settlement region for each year between 2004-2011 using PERMANOVA, the settlement patterns between source regions were significantly different (F~model(18,151)~ = 82.67, p < 0.05, r^2^= 0.92; @fig:nmds-regions). The variation between regions was more significant than the annual variation (F~model(7,151)~ = 0.18, p > 0.05, r^2^ = 0.01). Annual variation in connectivity patterns was not consistent between sources regions, the offshore areas of Lord Howe Island and EM reefs showed the largest variations, but also the southern regions along the NSW coast were more variable annually than the northern areas. A few source regions, e.g. Nambucca, Newcastle, and Sydney, had minimal annual variation.

Comparing the total settlement to each region between years, connectivity patterns were only similar to one other year or none (@fig:nmds-settlement B). Although it was not only one or two regions driving the differences, annual variation in settlement occurred at nearly all the regions (@fig:years-ca). The year 2008 and 2011 had similar connectivity patterns to each other, likewise 2006 and 2009 (@fig:nmds-settlement B). The years of connectivity that were most different to all other years were 2004 and 2007. Settlement to the northern regions of Tweed and Queensland was highest in the years 2006, 2009, and 2010 (@fig:years-ca). 2007 had low settlement to most northern regions, high settlement to the southern regions Eden, Merimbula, Victoria, and the offshore EM reefs. It was also the year where most black cod larvae appeared to be entrained in mesoscale eddies (@fig:trajectories), potentially increasing dispersal but lowering successful settlement. Ballina and Port Macquarie had above average settlement in the years 2008 and 2005 (@fig:years-ca).

![NMDS comparison of the mean total settlement from each of the 19 source regions across NSW and the offshore areas (A; 2D Stress = 0.07), and the total settlement to all regions by year (B; 2D stress = 0.05). Bray-Curtis dissimilarities were used with a square-root transformation.](chapters/applied/figs/ndms-settlement.png){#fig:nmds-settlement}

![NMDS of the connectivity patterns from each source region (colour coded and grouped by ellipses) in each year (2004-2011) to all possible settlement regions. Bray-Curtis dissimilarities were used with a square-root transformation (2D stress = 0.12)](chapters/applied/figs/nmds-regions.png){#fig:nmds-regions}

![Constrained correspondence analysis of the total settlement patterns for black cod larvae from all source regions to the settlement regions for each year of the model (2004-2011).](chapters/applied/figs/cca-years.png){#fig:years-ca}

The strongest region of settlement were Yamba and Solitary Islands, which were also consistently settlement in high proportions (@fig:cv A). Black cod settlement was highest in the northern-central region of NSW, when considering all source sites. The offshore islands of Lord Howe and EM reefs, along with settlement regions in Queensland and Victoria had the lowest settlement numbers. Queensland, and the the most northern site of the Tweed had the highest variation, but for the rest of the regions the annual variation was consistent. There are four identified sub-communities that form the network of demographically connected regions from all possible spawning sites when considering the mean annual settlement (@fig:graph A). The communities are grouped together by latitude, splitting at Pt Macquarie/Crowdy Bay (EM reef is a sub-community of the most northern latitudes), Jervis Bay/Ulladulla, and Merimbula/Eden. The southern-most community consists of Eden and Lord Howe Island. The community with the strongest network is from Crowdy Bay to Jervis Bay (@fig:graph B), followed by the southern most community (Ulladulla to Merimbula), and then the northern community (Tweed to Port Macquarie and EM reefs).

![The coefficient of variation against the mean annual settlement from all source regions (A) and from the known aggregation sites (B).](chapters/applied/figs/settlement-cv.png){#fig:cv}

![Dendrogram of communities detected using the Walktrap modularity method with edges weighted by the the mean yearly settlement between the 19 source regions in NSW (A) and the graph of the community highlighting the communities and showing edges within communities (black) and edges between communities (red), edge thickness is proportional to number of settlers. ](chapters/applied/figs/graph.png){#fig:graph}

### Connectivity metrics

There were significant differences in the self-recruitment between source regions (F~(18,126)~ = 52.60, p < 0.05). Post-hoc tests determined there were seven source regions with the highest values of self-recruitment, with means above 75% (Nambucca, Crowdy Bay, Port Stephens, Wollongong, Ulladulla, Batemans Bay, and Eden; @fig:region-metrics A). The lowest self-recruitment occurred in the Tweed region with 21%. Self-recruitment tended to either be above 65% or below 40%, with one or two exceptions. Crowdy Bay and Sydney had the least variation in self-recruitment between the years 2004-2011, while the source regions of Lord Howe Island, Elizabeth and Middleton Reefs (EM Reefs), and Newcastle produced the greatest annual variation. There were also significant differences to the self-recruitment between years, averaged across all source regions (F~(7,126)~ = 3.03, p < 0.05; @fig:year-metrics A). Post-hoc tests indicated that in 2011 and 2008 self-recruitment were 10% higher than in 2010. The mean annual self-recruitment values were always above 50%.

Local retention was more variable than self-recruitment across most source regions (@fig:region-metrics B), and was different between regions (F~(18,126)~ = 77.96, p < 0.05). Local retention was highest in Yamba, Solitary Islands, and Crowdy Bay, and lowest at Lord Howe Island and EM reefs. These two source regions, along with Eden, had the least annual variation in local retention. Yamba, Solitary Islands, and Newcastle had the largest annual variation in the larvae that were locally retained. The mean annual local retention across all regions varied significantly (F~(7,126)~ = 22.214, p < 0.05). The lowest annual local retention values occurred in 2007, which was 53% lower than 2008, the year when the highest local retention transpired (@fig:year-metrics B). In 2007 there was also the least variation of local retention between source regions, while 2008 had the largest variation.

The settlement success of larvae also varied significantly between source regions (F~(18,126)~ = 77.97, p < 0.05). Settlement success exhibited latitudinal patterns, strongly increasing with latitude from the Tweed until Yamba and then reversing and strongly decreasing with latitude until Port Macquarie (@fig:region-metrics C). Settlement success increased again until the Newcastle and Sydney regions, after which it decreased gradually with latitude. Similar patterns, albeit not as strong, can be seen with local retention (@fig:region-metrics B). Settlement success was lowest at Lord Howe Island and EM reefs (@fig:region-metrics C). The Tweed, Byron and Port Macquarie regions producing the largest variation of settlement success. There were annual differences in settlement success (F~(7,126)~ = 27.068, p < 0.05), which followed a similar pattern to local retention (@fig:year-metrics B, C). The lowest annual settlement success again occurred in 2007, and the years with most successful settlement were 2006, 2008, 2010, and 2011 (approximately 1.6 times more likely to settle than 2007 @fig:year-metrics C).

Most regions had similar dispersal distances, yet several had significantly longer dispersal distances (F~(18,126)~ = 175.71, p < 0.05). Dispersal distance showed an inverse latitudinal pattern to settlement success, e.g. where settlement success is high, dispersal distance is low (@fig:region-metrics D). Lord Howe Island EM reefs larvae dispersed the longest, with mean distances over 1000km. Of the coastal regions, Eden, Merimbula, and Port Macquarie dispersed the longest. There were annual differences between the yearly mean dispersal differences (F~(7,126)~ = 2.70, p < 0.05), however post-hoc tests were unable to identify years that were significantly different to each other (@fig:year-metrics D). The mean dispersal distance per year was about 250 km (@fig:year-metrics D), but the majority of regions had larvae dispersing less than 150km before settlement (@fig:region-metrics D).

![The connectivity metrics of self-recruitment (A), local retention (B), settlement success (C), and dispersal distance (D; km) for each of the 19 source regions where Black Cod (*Epinephelus daemelii*) larvae were released in the dispersal model. The whisker plots represent the mean, standard deviation. and min/max values of the distribution. Letters denote groupings from post-hoc SNK tests, performed if the ANOVA between regions was significant. ](chapters/applied/figs/region-metrics.png){#fig:region-metrics}

![The mean annual connectivity metrics across all regions of self-recruitment (A), local retention (B), settlement success (C), and dispersal distance (D; km) for the years 2004-2011, when Black Cod (*Epinephelus daemelii*) larvae were released in the dispersal model. The whisker plots represent the mean, standard deviation, and min/max values of the distribution. Letters denote groupings from post-hoc SNK tests, performed if the ANOVA between years was significant.](chapters/applied/figs/year-metrics.png){#fig:year-metrics}


Discussion points
- Strong latitude patterns - why? How do the coastal dynamics match? Seperation zone?
- e.g. Port macquarie is always low, crowdy bay, solitary and yamba is always high
- High self-seeding for many regions (oceanographic related , e.g. strong downwards currents and eddies)
- Some regions showed more yearly variation than others, not consistent. 2007 dispersed more and less local recruitment and settlement success. Not a special climatic year (Strong La nina (2010-11), moderate El-nino (2009-2010).


## Assessing the realised connectivity patterns from all regions

The settlement from the known aggregation sites (Nambucca, Solitary Islands, Pt Stephens, Lord Howe Island, and EM reefs) was more restricted, with black cod larvae not making it up in Queensland or down into Victoria (@fig:heatmap-known). Three of the source regions, Nambucca, Solitary Islands, and Pt Stephens were the areas of highest settlement and with strong consistency, significantly different from the rest with settlement at Port Stephens was 4.8 times higher than the fourth highest area of settlement (F~(19,133)~ = 140.51, p \< 0.05; @fig:cv B). Yamba and Newcastle were the other sites receiving the highest numbers of new recruits (connectivity was more variable to Yamba), and the south coast had seemingly negligible connectivity (high annual variation).

Solitary Islands produced the most successful number of larvae that successfully settle, mostly to itself (high local retention @fig:region-metrics B), but also to Nambucca, the region below (@fig:heatmap-known). This high local-retention was reflected by the low dispersal distance for larvae from the Solitary Islands (@fig:region-metrics D). However, it is also the most important source region for itself, with annual self-recruitment values of 72.9 ± 7.7 (@fig:region-metrics A). The other known aggregation regions on the NSW coast of Port Stephens and Nambucca also both have high self-recruitment at about 80% (@fig:region-metrics A). The settlement at Nambucca showed slightly less annual variability than either the Solitary Islands and Pt Stephens (@fig:cv B), but the differences were small. Pt Stephens showed strongest connectivity to the Sydney and Wollongong regions, but had some of the lowest overall settlement success (and highly variable) for the NSW regions (@fig:region-metrics C). Compared to Solitary Islands and Nambucca, larvae spawned from Port Stephens showed the strongest connections to the southern regions of NSW, dispersing with a mean distance of 112.2 km before settlement (@fig:region-metrics D).

Even though Lord Howe Island and EM reefs both support populations of black cod, these regions had the lowest settlement success in the model. Both had low local retention and low and highly variable self-recruitment, with means below 50%. Larvae spawned at Lord Howe Island larvae settled consistently to all regions in NSW, apart from Yamba to Nambucca. EM reefs showed similar settlement patterns to Lord Howe, except the larvae spawned at EM reefs had limited connectivity to the most northern sites Tweed, Byron, and Ballina. The larvae from these sites were also the most dispersed, travelling on average more than 1000 km before successfully settling.

![The connectivity matrix of the mean proportion of total settlement (4th root) from all source regions to settlement regions for the years (2004-2011), using a log scale on the settlement proportions.](chapters/applied/figs/heatmap-known.png){#fig:heatmap-known}

Discussion Points
- Surprising (if weak) connectivity to all regions of NSW.
- Spawning regions are key self-seeding areas
- Shows elizabeth, middleton, & lord howe are linked (and linked with the coast)


## Marine Park Connectivity

Eleven of the 19 source regions have some marine protected area within the region, ranging from 0.78 km^2^ within the Tweed region, entire coverage of the region (EM Reefs; @tbl:mpas). There is a mix of both state and federal management, depending on the location of the protected area to the coastline of NSW. All contained some level of sanctuary zones (ban on recreational and commercial fishing), although many of these areas were not within suitable habitat for black cod, i.e. sandy beaches.

Of the four sub-communities identified, each community had at least one source region that contained a marine protected area (@fig:graph A). Community A (northern) had the highest percentage of regions with marine protected areas (62.5%; 2565 km^2^), although 73% of that area is covering the EM reefs. Community B had 50% protection (only two regions), with MPA coverage of 980 km^2^, which is all in the Lord Howe Island region. Community C (southern) was the least protected across regions (only 33% covering an area of 850 km^2^), but all the protection is in the Batemans Bay region. The central NSW community (D), had 80% coverage, 1198 km^2^, although 98.7% of this protected area occurs in the Jervis Bay and Port Stephens regions (@tbl:mpas). From the five known areas of aggregation, four have MPAs within the region, of which three have a substantial amount of area set aside for marine protected areas (Solitary Islands, Lord Howe, and EM Reefs).

Considering the five source regions with the highest successful settlement, only two have some marine park protection within the region, Solitary Islands and Sydney (@fig:region-metrics C). For the areas of high self-recruitment (>75%), only 37.5% have marine reserves within the region (Solitary Islands, Pt Stephens, and Batemans Bay; @fig:region-metrics A). From all regions, of the areas with the highest settlement, and most consistent settlement Solitary Islands, Sydney, and Wollongong were the regions with marine protected areas (@fig:cv A). Considering only known areas of aggregation, two of the top three settled areas had marine protected areas (Solitary Islands and Pt Stephens; @fig:cv B).

: The source regions containing marine parks (NSW and Commonwealth), indicating if they have sanctuary zones (management areas where fishing, either recreational or commercial, is not allowed) and the size of the marine park. All information sourced from the New South Wales Government (http://www.marine.nsw.gov.au) and the Australian Government  (http://www.environment.gov.au/topics/marine/marine-reserves). {#tbl:mpas}

| Source region | Marine reserve |   Management | Sanctuary zones | Size (km^2^) | Notes
|-----------|----------------|-----------------|------------------|--------------
| Tweed | Cook Island Aquatic Reserve |  NSW | Yes | 0.78 | |
| Byron   | Cape Byron Marine Park  | NSW  | Yes | 220  | |
| Solitary Islands |  Solitary Islands Marine Park | NSW  | Yes | 460  |  |
| Port Macquarie   | Cod Grounds Commonwealth Marine Reserve  | Commonwealth  | Yes | 4  | |
| Port Stephens   | Port-Stephens-Great Lakes Marine Park  | NSW  | Yes | 980 | |
| Sydney   | Various Aquatic Reserves  | NSW  | 10 | 2.42 |  Yes | Black cod only seen at Cabbage Tree Bay |
| Wollongong   | Bushrangers Bay Aquatic Reserve  | NSW  | Yes | 0.4  |   |
| Jervis Bay  | Jervis Bay Marine Park  | NSW  | Yes  | 215  |   |
| Batemans Bay   | Batemans Marine Park  | NSW  | Yes  | 850  |   |
| Lord Howe   | Lord Howe Island Marine Park  | NSW | Yes  | 460  |   |
| Elizabeth & Middleton Reefs  | Lord Howe Commonwealth Marine Reserve  | Commonwealth  | Yes | 1880 | Middleton Reef (Sanctuary zone), Elizabeth Reef (Recreational fishing with permit) |

Discussion

Aim 1: All regions

- Explain the variation between regions and years

The connectivity patterns of the black cod *E. daemelii* larvae strongly differ between the 19 regions and between the years of release. The reason for the variation seen is that the ocean circulation off the NSW coast is heterogenous. The shallow continental shelf means that larvae are subjected to the East Australia from northern NSW to the separation zone around 31 - 32 degrees S, where it splits off from the coast of NSW. The water that does not split off here is further carried down the coast.

How did El Nino / La Nina conditions affect the dispersal ?

- implications

- Explain the patterns seen
Which regions have communities
Genetic dispersal
Surprising they don't settle further away

open (from far away sources) or closed (from local sources).

So coastline populations tend to be closed, but the offshore islands are more open.

- implications

- What are the implications for the black cod population

  - long life before spawning, and potential movement


Similar regional and annual variation seen elsewhere [Watson 2010].


Aim 2: Known regions

- What do we know about where larvae are seen? Does it fit the high areas of settement ?
-

Aim 3: Marine reserves


Is the current network effective ?
 - compare with known and all



What about annual variation?

Are there areas we should be protecting?
- areas of strong connectivity (less variation)


Size of coastline for black cod, because of limited movement can be small (CITE Green 2014).

Population persistence is key.
Local retention is important - shows how many stay there depending on hatch amount [CITE Botsford 2009]
Fraction of coastline required is related to fishing pressure [CITE botsford 2009].

We know that a non-contiguous marine reserve is less effective, especially with a high dispersal distance, therefore length of coastline (more coastline for habitat zone is preferable - CITE Bostford 2001), .e.g. recommended reserves are twice the dispersal distance.

Spillover is not a dirver (total ban on fishing black cod)

How to get back to anecdotal levels ?

Are there enough sancutary zones (threat to spawning)


Are there enough habitat zones (threat to settlement)

Simulation studies show proecting quality habitat areas for rockcod is key CITE Cabral 2016. Need to preserve the adult population, i.e. carrying capacity is more important than network topology.

Need to protect the Juvenile habitats - Eustarine protection?


Limitations
- Did we use the correct larvae values (assumptions)
- We considered constant larval production, so not yearly variation (therefore vairation is through oceans currents)

future validation
- Can we match with areas of high settlement ?
- need to ground-truth models
- also understand the complete life-cycle of black cod, where do they go before they settle as adults in rocks? what are the local-recruitment values for these black-cod?
-

Conclusion


Newcastle tends to be the bottom of the separations zone, which could describe these results. The regions where the separation zone usually occurs -30 to -32, is where the most differences occurred between regions. The yearly variation was largest for the offshore reefs (Lord Howe, Elizabeth, and Middleton). The northern NSW regions of Tweed, Byron, Ballina, Yamba, and Solitary Islands had similar settlement patterns, driven by a strong EAC. The regions in southern NSW from Jervis Bay to Merimbula also had similar settlement patterns.



 - Marine protected areas seem to be in many of the right places? Ballina and Yamba the big exclusions with the highest source settlement
 - Although this is looking at regional connections, MPAs don't span the entire region
 - Also different usages, if adults can be fished by rec fishers for example are the protections there
 - Really don't care so much about locations of larvae settlement, but ability to breed (we know they spawn after many years and can migrate long distances). Seems to do well protecting known spawning areas - probably helps its been vunerable for so long and planning went into it (need to find info about this - is population increasing, seems no one knows)
 - Good to see lots of genetic drift also (interesting none to NZ or Norfolk)


 Solitary Islands
 - Jones Beach and Jones Point Sanctuary Zone (1.3 km)
 - Central Section Sanctuary Zone (3.0 km)
 - Flat Top Point Sanctuary Zone (1.3 km)
 - Southern Section Sanctuary Zone (4.3 km)
 -

 Pt Stephens
 -  The Pinnacle Sanctuary Zone (2.5km)
 -  Fingal Island Sanctuary Zone (4.0km)

 Sydney
 - Cabbage Tree Bay Aquatic Reserve (20 hectares)

 Batemans Bay
 - North Head Sanctuary Zone (4.8 km)
 - Burrewarra (North Section) Sanctuary Zone (4.7 km)
 - Burrewarra (South Section) Sanctuary Zone (2.8)
 - Broulee Island Sanctuary Zone (2.1 km)

 Lord Howe Island 460kms

 Middleton Reef (Sanctury zone), Elizabeth Reef (Rec fishing with permit)
 (Lord Howe Commonwealth Marine Reserve)

 Pt Macquarie
 - Cod Grounds Commonwealth Marine Reserve (4 km^2)



# Discussion
