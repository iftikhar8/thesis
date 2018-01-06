
# CHAPTER: Larval connectivity of Black Cod *Epinephelus daemelii* along the south-eastern coast of Australia and implications for conservation

# Introduction


## Black cod threats.

- while illegal to fish for black cod either recreational or commercial
- there is bycatch threat

AIMS:

1. To investigate the realised connectivity patterns from all spawning regions
2. To investigate the realised connectivity patterns from known spawning regions
3. Does the current marine park network protect areas of strong demographic connectivity?

# Methods

## Study location

[Info about study species - i'll put more in the introduction though]

The black cod, *Epinephelus daemelii* (Gunther, 1876), also known commonly as the black rockcod, the saddled rockcod, and the saddletail grouper, is a large temperate marine reef fish of the family Serranidae. It occurs along the eastern Australian coast, with reported sightings from southern Queensland down to the Bass Strait, but primarily along the NSW coastline [CITE Fish base, Atlas of living australia]. Black cod have been seen to grow up to 200 cm TL, and weigh up to 68 kg. Black cod live in caves and rocky reef holes at depths of up to 50 m. Its known distribution ranges from southern Queensland down to Bass Strait, and to the offshore reefs of Lord Howe Island, Elizabeth and Middleton Reefs, and Norfolk Island. There are also populations in New Zealand and the Kermadec Islands. The highest abundances of Black cod occur along the NSW coast (CITE Harasti).

I used a biophysical dispersal model (BDM) to measure the connectivity of black cod (ZISSOU, v1.1.3 [github.com/shawes/zissou]), see Chapter 3 methods for a complete description. The model allows for the implementation of many biological behaviours e.g. ontogenetic vertical migration (OVM), diel vertical migration (DVM), and orientated horizontal swimming (OHS). The model was forced with oceanographic data from BRAN3 [Bluelink renalysis, version 3p5; Oke:2013dm], a data-assimilating hindcast model which resolves mesoscale eddies with mean daily velocities. BRAN3 has a resolution of 0.1° latitude and longitude, and resolves depth velocities at bins of 5-10 m. As with similar studies  [CITE condie, chiswell], an eddy diffusivity value (K) of 300 ms^-1^ was implemented in the model. Larvae positions in the BDM were updated based on a time step of two hours.

Patterns of annual settlement were assessed for the period 2004-2011 by spawning and tracking the settlement of larvae along the coast of NSW and offshore islands. Nineteen spawning regions were chosen, 17 along the NSW coast (approximately equally sized spawning regions at ~125 km each), and with two off-shore areas, Lord Howe Island and Elizabeth and Middleton reefs (considered as a single region; Figure 1). Reef patches within each region was identified (as per Chapter 3), using benthic data obtained from the NSW Office of Environment and Heritage (OEH; http://data.environment.nsw.gov.au) with areas of roughly equally sized sections of contiguous reef demarked as specific reef patches’ (total of 560 in the model domain). Larvae were spawned from four reef patches per region (chosen using either the known distribution or randomly if there was no specific data), daily between the known aggregating months, April-May, every year over the period 2004-2011. For each reef patch, 4000 pelagic eggs were spawned per day (16,000 per region) over the 61 day period. In total 18.5 million eggs were released each breeding season and 148 million over the course of the experiment. Black cod were allowed to settle to reef & rock intertidal patches if they came within the settlement sensory distance, after the settlement competency window and before the pelagic larval duration. Black cod were allowed to settle to reefs in Queensland, Victoria, Norfolk Island, and New Zealand as per the known distribution, although none of which have known breeding populations [CITE Harasti]. Biological parameters were obtained from the literature, and if no data was found for *E.daemelii* specifically, either similar species, genus averages, or general data was used to parameterise the model (@tbl:bio-params).

![The 19 regions (each containing four rocky reef patches) used to spawn the black cod *Epinephelus daemelii* larvae along the coastline of New South Wales, Australia and the offshore areas of Lord Howe Island, Elizabeth reef, and Middleton reef (E&M reefs)](chapters/applied/figs/release-sites.png){#fig:release-sites}

: Biological parametrisation for the larvae of the Black Cod (*Epinephelus daemelii*) in the biophysical dispersal model. For species, generic indicates that a general value that could apply to all reef fish species was used to determine the value as no specific data could be found {#tbl:bio-params}

| Parameter               | Value (± s.d.)   | Reference         | Species |
|-------------------------|------------------|-------------------|---------|
| Spawning time   | April-May  | Harasti  | Epinephelus daemelii  |
| Pelagic larval duration | 60 (± 15) days   | CITE Francis 2016 | Epinephelus daemelii |
| Settlement competency window   | 40 days  |   | Generic  |
| Hatching                | 0-3 (± 1) days   | CITE Cuhna 2013   | Epinephelus marginatus |
| Preflexion              | 4-12 (± 1) days  | Cuhna 2013        | Epinephelus marginatus |
| Flexion                 | 12-16 (± 1) days | Cuhna 2013        | Epinephelus marginatus |
| Postflexion             | 16-60 (± 1) days | Cuhna 2013        | Epinephelus marginatus |
| Settlement sensory      | 7 km             |                  | Generic
| Olfactory sensory       | 10 km            |                   | Generic
| U~crit~                 | 0.3 ms^-1^       | CITE Leis 2009    | Epinephelus spp.
| In situ potential       | 0.16             | Leis 2009         | Epinephelus spp.
| Endurance               | 0.5              | Leis 2009         | Epinephelus spp.
| Mortality   | 0.1 day^-1^  |   | Generic |


1.	To investigate the realised connectivity patterns from all spawning regions
2.	To investigate the realised connectivity patterns from known spawning regions
3.	Does the current marine park network protect areas of strong demographic connectivity?

First provide some overall structure to the analysis…say broadly how you approched the analysis to address your aims.  Yo unever mention your aims in here at all.

There’s no mention in here of known spawning sites versus the others.

## Data analysis

The BDM generates as output (per calendar year) a connectivity matrix (connectivity between larval source region (row~*i*~) and settlement region (column~*j*~), where each element~*i,j*~ proportion of all larvae spawned at *i* which settled at *j* over the release year) is the proportion settled, a dispersal kernel (dispersal path of the settled larvae) and a GIS Shapefile displaying the trajectories of a random subset of larvae. To investigate the first two aims, univariate connectivity metrics of self-recruitment, local retention, settlement success, and dispersal distance for each region were calculated from both the connectivity matrices and dispersal kernels, comparing between regions and years using one-way ANOVAs with the factors source region and year. Student-Newman-Keuls (SNK) post-hoc tests were used to make comparisons between groups if the ANOVA was significant using the r package *agricolae* [CITE]. To compare settlement patterns from source regions, multivariate non-metric multidimensional scaling (NMDS) ordination was utilised, using settlement from a source region in each year as the sampling unit. Analysis used a Bray-Curtis dissimilarity measure with a square root transformation. NMDS was conducted using the r package *vegan* [CITE]. To quantitatively compare the settlement patterns between regions and across years, I conducted PERMANOVA analysis, using the adonis function within the r package *vegan*. To address the second aim, I compared the total settlement across regions for each year sourced from all regions to the settlement patterns seen using only the known aggregation regions of Solitary Islands, Nambucca, Port Stephens, Lord Howe Island, and Elizabeth and Middleton reefs. To address the third aim of marine park connectivity, graph analysis using the r package *igraph* was conducted. To identify strong demographically connected regions, i.e. sub-communities, modularity optimisation on the graph, using source regions are nodes and the edges between weighted by the mean annual settlement, was performed. Regions containing marine parks (either NSW or Commonwealth) were considered to be protected areas, and compared to the communities identified. The marine parks falling into regions at the time of writing are NSW marine parks (Cape Byron, Solitary Islands, Port Stephens, Jervis Bay, Batemans Bay, and Lord Howe Island), NSW aquatic reserves (Tweed, Sydney), and Commonwealth marine parks (Pt Macquarie, Elizabeth and Middleton reefs).

# Results

## Assessing the realised connectivity patterns from all regions

The strongest demographic connectivity for all source regions occurred to geographically close settlement regions, although each source region along the NSW coast showed long tails of connectivity with decreasing latitude (@fig:heatmap-all). From the Tweed to Pt Stephens, the strongest connectivity was with the region directly below, and few larvae migrated to regions of higher latitudes. This pattern ceased at the Newcastle region, which had poor local retention, and settlement to lower latitudes. The southern source regions from Sydney to Eden had most larvae settle at the natal region, but also tended to settle at regions both increasing and decreasing latitude (@fig:heatmap-all). The offshore areas of Lord Howe Island, and Elizabeth and Middleton (EM) reefs also mostly recruited to the natal sites and to each other, but also both connected to the central NSW coast, from Nambucca to Wollongong. These patterns are reflected in the trajectories seen for a random subset (only 5% of larvae from the year 2010 are displayed for visualisation purposes) of black cod larvae that settled (@fig:trajectories A). The larvae only made it into Southern Queensland or Victoria occasionally, and predominately from geographically connected sites (although both Lord Howe and EM reefs did have connectivity with Queensland). The connectivity, while not strong,  between Lord Howe, EM reefs, and the mainland was bi-directional (@fig:heatmap-all). No connectivity was seen to occur to either Norfolk Island or New Zealand from any of the chosen source regions.

![The connectivity matrix of the mean proportion of total settlement (log~-10~) from all source regions to settlement regions for the years (2004-2011), using a log scale on the settlement proportions.](chapters/applied/figs//heatmap-all.png){#fig:heatmap-all}

![Comparison of a subset (5% of the larvae were randomly selected) of the trajectories for the settled Black Cod larvae from all source regions (A) and known aggregation regions (B) for the year 2010.](chapters/applied/figs//trajectories-comp.png){#fig:trajectories}

Comparing the mean annual settlement patterns by source regions, strong latitudinal patterns were also expressed. The source regions with the most similar settlement patterns occurred in close geographical proximity (@fig:nmds-settlement A). Although, settlement patterns were more similar in the most northern and most southern regions, with the regions Nambucca to Sydney showing more dissimilarity. Comparing the connectivity from each source region to each settlement region for each year between 2004-2011 using PERMANOVA, the settlement patterns between source regions were significantly different (F~model(18,151)~ = 82.67, p < 0.05, r^2^= 0.92; @fig:nmds-regions). The variation between regions was more significant than the annual variation (F~model(7,151)~ = 0.18, p > 0.05, r^2^ = 0.01). Annual variation in connectivity patterns was not consistent between sources regions, the offshore areas of Lord Howe Island and EM reefs showed the largest variations, but also the southern regions along the NSW coast were more variable annually than the northern areas. A few source regions, e.g. Nambucca, Newcastle, and Sydney, had minimal annual variation. There was annual variation seen when comparing the total settlement across all settlement regions. Some years, e.g. 2004 and 2007, 2006 and 2009, the black cod larvae settlement pattens were acutely similar, but in general each year was dissimilar to all others (@fig:nmds-settlement B).

![NMDS comparison of the mean total settlement from each of the 19 source regions across NSW and the offshore areas (A; 0.07), and the total settlement to all regions by year (B; stress 0.05).Bray-Curtis dissimilarities were used with a square-root transformation.](chapters/applied/figs/ndms-settlement.png){#fig:nmds-settlement}

![NMDS of the connectivity patterns from each source region (colour coded and grouped by ellipses) in each year (2004 - 2011) to all possible settlement regions. Bray-Curtis dissimilarities were used with a square-root transformation (2D stress = 0.12)](chapters/applied/figs/nmds-regions.png){#fig:nmds-regions}

The strongest region of settlement were Yamba and Solitary Islands, which were also consistently settlement in high proportions (@fig:cv A). Black cod settlement was highest in the northern-central region of NSW, when considering all source sites. The offshore islands of Lord Howe and EM reefs, along with settlement regions in Queensland and Victoria had the lowest settlement numbers. Queensland, and the the most northern site of the Tweed had the highest variation, but for the rest of the regions the annual variation was consistent.

![The coefficient of variation against the mean annual settlement from all source regions (A) and from the known aggregation sites (B).](chapters/applied/figs/settlement-cv.png){#fig:cv}

### Connectivity metrics

There were significant differences in the self-recruitment between source regions (F~(18,126) = 52.60, p < 0.05). Post-hoc tests determined there were seven source regions with the highest values of self-recruitment, with means above 75% (Nambucca, Crowdy Bay, Port Stephens, Wollongong, Ulladulla, Batemans Bay, and Eden; @fig:region-metrics A). The lowest self-recruitment occurred in the Tweed region with 21%. Self-recruitment tended to either be above 65% or below 40%, with one or two exceptions. Crowdy Bay and Sydney had the least variation in self-recruitment between the years 2004-2011, while the source regions of Lord Howe Island, Elizabeth and Middleton Reefs (E\&M Reefs), and Newcastle produced the greatest annual variation. There were also significant differences to the self-recruitment between years, averaged across all source regions (F~(7,126)~ = 3.03, p < 0.05; @fig:year-metrics A). Post-hoc tests indicated that in 2011 and 2008 self-recruitment were 10% higher than in 2010. The mean annual self-recruitment values were always above 50%.

Local retention was more variable than self-recruitment across most source regions (@fig:region-metrics B), and was different between regions (F~(18,126) = 77.96, p < 0.05). Local retention was highest in Yamba, Solitary Islands, and Crowdy Bay, and lowest at Lord Howe Island and Elizabeth and Middleton reefs. These two source regions, along with Eden, had the least annual variation in local retention. Yamba, Solitary Islands, and Newcastle had the largest annual variation in the larvae that were locally retained. The mean annual local retention across all regions varied significantly (F~(7,126)~ = 22.214, p < 0.05). The lowest annual local retention values occurred in 2007, which was 53% lower than 2008, the year when the highest local retention transpired (@fig:year-metrics B). In 2007 there was also the least variation of local retention between source regions, while 2008 had the largest variation.

The settlement success of larvae also varied significantly between source regions (F~(18,126) = 77.97, p < 0.05). Settlement success exhibited latitudinal patterns, strongly increasing with latitude from the Tweed until Yamba and then reversing and strongly decreasing with latitude until Port Macquarie (@fig:region-metrics C). Settlement success increased again until the Newcastle and Sydney regions, after which it decreased gradually with latitude. Similar patterns, albeit not as strong, can be seen with local retention (@fig:region-metrics B). Settlement success was lowest at Lord Howe Island, and the Elizabeth and Middleton reefs (@fig:region-metrics C). The Tweed, Byron and Port Macquarie regions producing the largest variation of settlement success. There were annual differences in settlement success (F~(7,126)~ = 27.068, p < 0.05), which followed a similar pattern to local retention (@fig:year-metrics B, C). The lowest annual settlement success again occurred in 2007, and the years with most successful settlement were 2006, 2008, 2010, and 2011 (approximately 1.6 times more likely to settle than 2007 @fig:year-metrics C).

Most regions had similar dispersal distances, yet several had significantly longer dispersal distances (F~(18,126) = 175.71, p < 0.05). Dispersal distance showed an inverse latitudinal pattern to settlement success, e.g. where settlement success is high, dispersal distance is low (@fig:region-metrics D). Lord Howe Island, and Elizabeth and Middleton reefs larvae dispersed the longest, with mean distances over 1000km. Of the coastal regions, Eden, Merimbula, and Port Macquarie dispersed the longest. There were annual differences between the yearly mean dispersal differences (F~(7,126)~ = 2.70, p < 0.05), however post-hoc tests were unable to identify years that were significantly different to each other (@fig:year-metrics D). The mean dispersal distance per year was about 250 km (@fig:year-metrics D), but the majority of regions had larvae dispersing less than 150km before settlement (@fig:region-metrics D).

![The connectivity metrics of self-recruitment (A), local retention (B), settlement success (C), and dispersal distance (D; km) for each of the 19 source regions where Black Cod (*Epinephelus daemelii*) larvae were released in the dispersal model. The whisker plots represent the mean, standard deviation. and min/max values of the distribution. ](chapters/applied/figs/region-metrics.png){#fig:region-metrics}

![The mean annual connectivity metrics across all regions of self-recruitment (A), local retention (B), settlement success (C), and dispersal distance (D; km) for the years 2004-2011, when Black Cod (*Epinephelus daemelii*) larvae were released in the dispersal model. The whisker plots represent the mean, standard deviation, and min/max values of the distribution](chapters/applied/figs/year-metrics.png){#fig:year-metrics}




Discussion points
- Strong latitude patterns - why? How do the coastal dynamics match? Seperation zone?
- e.g. Port macquarie is always low, crowdy bay, solitary and yamba is always high
- High self-seeding for many regions (oceanographic related , e.g. strong downwards currents and eddies)
- Some regions showed more yearly variation than others, not consistent. 2007 dispersed more and less local recruitment and settlement success. Not a special climatic year (Strong La nina (2010-11), moderate El-nino (2009-2010).


## Assessing the realised connectivity patterns from all regions

The settlement from the known aggregation sites (Nambucca, Solitary Islands, Pt Stephens, Lord Howe Island, and EM reefs) was more restricted, with black cod larvae not making it up in Queensland or down into Victoria (@fig:trajectories B). Three of the source regions, Nambucca, Solitary Islands, and Pt Stephens were the areas of highest settlement and with strong consistency, significantly different from the rest with settlement at Port Stephens was 4.8 times higher than the fourth highest area of settlement (F~(19,133)~ = 140.51, p \< 0.05; @fig:cv B). Yamba and Newcastle were the other sites receiving the highest numbers of new recruits (connectivity was more variable to Yamba), and the south coast had seemingly negligible connectivity (high annual variation). Solitary Islands produced the most successful number of larvae that successfully settle, mostly to itself (high local retention @fig:region-metrics B), but also to Nambucca, the region below (@fig:heatmap-known). This high local-retention was reflected by the low dispersal distance for larvae from the Solitary Islands (@fig:region-metrics D). However, it is also the most important source region for itself, with annual self-recruitment values of 72.9 ± 7.7 (@fig:region-metrics A). The other known aggregation regions on the NSW coast of Port Stephens and Nambucca also both have high self-recruitment at about 80% (@fig:region-metrics A). The settlement at Nambucca showed slightly less annual variability than either the Solitary Islands and Pt Stephens (@fig:cv B), but the differences were small. Pt Stephens showed strongest connectivity to the Sydney and Wollongong regions, but had some of the lowest overall settlement success (and highly variable) for the NSW regions (@fig:region-metrics C). Compared to Solitary Islands and Nambucca, larvae spawned from Port Stephens showed the strongest connections to the southern regions of NSW, dispersing with a mean distance of 112.2 km before settlement (@fig:region-metrics D). Even though Lord Howe Island and EM reefs both support populations of black cod, these regions had the lowest settlement success in the model. Both had low local retention and low and highly variable self-recruitment, with means below 50%. Larvae spawned at Lord Howe Island larvae settled consistently to all regions in NSW, apart from Yamba to Nambucca. EM reefs showed similar settlement patterns to Lord Howe, except the larvae spawned at EM reefs had limited connectivity to the most northern sites Tweed, Byron, and Ballina. The larvae from these sites were also the most dispersed, travelling on average more than 1000 km before successfully settling.

![The connectivity matrix of the mean proportion of total settlement (log~-10~) from all source regions to settlement regions for the years (2004-2011), using a log scale on the settlement proportions.](chapters/applied/figs/heatmap-known.png){#fig:heatmap-known}

Discussion Pts
- Surprising (if weak) connectivity to all regions of NSW.
- Spawning regions are key self-seeding areas
- Shows elizabeth, middleton, & lord howe are linked (and linked with the coast)


## Marine Park Connectivity

Due to the life cycle of the black cod, marine protected areas are important in protecting the adult fish to both grow to a sufficient age with which to spawn, and to be allowed to spawn in sufficient numbers. The three highest areas of settlement from known spawning sites, and the three spawning areas with highest settlement all occur in NSW marine protected areas, Solitary Islands, Nambucca and Port Stephens (@fig:known-settle-region, @fig:known-source-region). The black cod larvae at all three have high levels of self-recruitment and local retention, allowing for strong potential population sustainability within these marine parks. When considering each region as a release region, only one out of the four highest areas of settlement contains a marine park, Solitary Islands (@fig:known-settle-region). Considering the top five source areas for successful settlement, two of them contain marine parks; Solitary Islands, and Sydney (Aquatic Reserve; @fig:known-source-region). When considering the sub-communities that form the network of demographically connected regions from all possible spawning sites, there is at least one marine protected area in each sub-community (@fig:dendro-regions).

![Dendrogram of communities detected through greedy optimisation of modularity using the mean yearly settlement between regions](chapters/applied/figs/dendo-all-regions.png){#fig:dendro-regions}

Cook Island Aquatic Reserve (78 hectares)
-

Cape Byron
- Julian rocks

Solitary Islands
- Jones Beach and Jones Point Sanctuary Zone (1.3 km)
- Central Section Sanctuary Zone (3.0 km)
- Flat Top Point Sanctuary Zone (1.3 km)
- Southern Section Sanctuary Zone (4.3 km)
-

Pt Stephens
-  The Pinnacle Sanctuary Zone (2.5km)
- seal rocks
- broughton island
- cabbage tree island
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




Discussion

Newcastle tends to be the bottom of the separations zone, which could describe these results. The regions where the separation zone usually occurs -30 to -32, is where the most differences occurred between regions. The yearly variation was largest for the offshore reefs (Lord Howe, Elizabeth, and Middleton). The northern NSW regions of Tweed, Byron, Ballina, Yamba, and Solitary Islands had similar settlement patterns, driven by a strong EAC. The regions in southern NSW from Jervis Bay to Merimbula also had similar settlement patterns.



 - Marine protected areas seem to be in many of the right places? Ballina and Yamba the big exclusions with the highest source settlement
 - Although this is looking at regional connections, MPAs don't span the entire region
 - Also different usages, if adults can be fished by rec fishers for example are the protections there
 - Really don't care so much about locations of larvae settlement, but ability to breed (we know they spawn after many years and can migrate long distances). Seems to do well protecting known spawning areas - probably helps its been vunerable for so long and planning went into it (need to find info about this - is population increasing, seems no one knows)
 - Good to see lots of genetic drift also (interesting none to NZ or Norfolk)


# Discussion
