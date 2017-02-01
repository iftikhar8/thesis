# Title
Review of biophysical modelling in investigating connectivity patterns in marine species with a pelagic larval stage. 

# Introduction 
Biophysical modelling has been used to investigate marine larvae dispersal patterns for nearly 30 years {Bartsch:1988vg}. Biophysical connectivity models typically focus on marine species with distinct sedentary adult and a pelagic larval life stage. Modelling the pelagic larval stage of these species and their subsequent connectivity pattern allows us to infers the distributional patterns of the model species. Biophysical models produce potential patterns of connectivity using a physical (i.e. oceanographic) model coupled with a model of the known biology of the larval stage. Biophysical models are powerful research tools, allowing us to investigate these potential connectivity patterns over large spatial scales {Andrello:2013cc}{Treml:2015bt} and over long temporal scales {Richar:2014cg}{Berglund:2012cr}, scales that empirical studies cannot capture. These models also provide us the ability to investigate how different early-life history traits (e.g. mortality, swimming ability, and orientation) affect the patterns found in connectivity studies {Butler:2011wu}{Staaterman:2012ek}. Thus we can ask important question about how these factors influence connectivity; experiments that are largely intractable *in situ* due to the inherent difficulties of studying the larval phase of marine species.

This review began from an attempt to identify and understand the importance of biological parameters on the connectivity patterns of ichthyoplankton. We know physical patterns are the driving force in moving ichthyoplankton around the world's oceans, however, it is now well understood that biological factors also influence where these larvae settle. This intended aim was to understand what biological parameters people were implementing in their biophysical models, i.e. was there a consensus of the most important, and how these biological parameters influence the connectivity patterns as measured through common metrics. If we can ascertain the importance of biological parameters in influencing these patterns, we can then ensure we target collecting the empirical data on these traits and behaviours. In addition, an inherent challenge in connectivity modelling is the difficulty in verifying the output as proportional to the spatial and temporal scales used in the model. Progression in the field requires that we have a degree of confidence in the accuracy and precision of the modelled patterns especially where it is difficult to empirically replicate the results. Therefore understanding what input parameters are required to maximise model accuracy (with well understood trade-offs such as execution time) that allow us to infer compelling conclusions is another aim of this review.

The last major review in the area of ichthyoplankton biophysical modelling was undertaken a decade ago {Miller:2007iu}. We wanted to see if the biological processes found in this review were still relevant in recently published models, even though our focus was on connectivity models. For example, had emergent processes like growth become standard in models now or was there a new consensus of parameters to implement? In addition to this review, the International Council for the Exploration of the Sea (ICES) published a comprehensive and well defined manual on the recommended practices for modelling connectivity in 2009 {Anonymous:2009tx}. High-performance computing has also become more accessible to researchers in the last decade, with researchers becoming more programming literate and the decreasing start-up costs of high-performance computing. Therefore, it is hypothesied that models will become more common in the recent literature and that these models will have a higher inherent complexity, as the tools and knowledge to construct these models are more ubiquitous. Whilst our research interest lies in the connectivity patterns of ichthyoplankton, we reviewed studies of a variety of marine species with a pelagic larval stage, owing to negligible differences in input parameterisation. The scope of this review therefore was to understand the parameters used in these models and how these input parameters effect the dispersal patterns generated.

##Study aims: 
1.  To compare the effects of larval behaviours on the connectivity patterns of models. 
2.  To identify the behaviours required to produce the most accurately generated models.


# Methods
##Literature search
Our review used the keywords connectivity, model* and marine, querying the online search engines ISI Web of Knowledge and SCOPUS. Seventy-six studies matching these criteria as published in 34 different journals were found (the full list of references and the data extracted is provided as part of the Supplementary materials). Our review search was limited to publications from 2009 as this was when a manual had been published, recommending the way forward for biophysical connectivity models {Anonymous:2009tx} and also close to the date the last review in this area had been conducted {Miller:2007iu}.

##Choices
Each biophysical model was classified using four categories. The first was general information about the study, such as location, model species, and whether the system tropical or temperate. The next category focused on the inputs used to parametrise the physical model. Assessing the physical model included details such as the oceanographic model used, the particle tracking software, diffusion methods and the model time-step. The third category considered the input parameters of the biological model, recording the traits such as the pelagic larval duration and spawning times and the behaviours implemented, e.g. mortality, vertical migration and growth. The last category recorded what metrics were used to measure the output of the connectivity biophysical model, which consisted of both common and rare metrics. The metrics used varied considerably, with in-excess of 25 different metrics used to describe the patterns of connectivity. These metrics ranged from common metrics such as dispersal kernels and connectivity matrices to metrics unique to the study. These metrics can be broadly categorised into two related classes. The first is purely dispersal, which using the dispersal kernel, provides metrics of spread, distance and direction travelled. The second class described the settlement of larvae, using measures such as self-recruitment, local retention and settlement success. 


Most studies performed multiple runs of their model, using different input parameters. We identified these criteria for each model specified in the study, not just the overall parametrisation of the paper. For instance, one study executed 99 different parametrised model runs, whereas the majority of studies only conducted one or two different models.

*TODO: Can I find better terminology than model run*

Models were classified into four categories based on the aim of the study: climate change, marine park connectivity, dispersal & settlement, and theoretical. Climate change objectives identified temporal and spatial changes in larval connectivity patterns with increases in ocean temperatures. Marine park connectivity studies determined the extent of connectedness of either existing or potential marine parks for various species. Dispersal and settlement approaches were interested in the dispersal or settlement of a species using known input parameters. Theoretical approaches to connectivity studies investigated how different larval parameters effected the patterns of connectivity.

##Statistics and data
Data was derived from figures using the free software package GraphClick (version 3.0.3; http://www.arizona-software.ch/graphclick/). Analyses were conducted using the R programming language version 3.3.2 {RAlanguageanden:wf}, using the package tidyverse to manipulate the data {Wickham:2016te} and the package ggplot2 to produce the figures {Wickham:2009tn}.

#Results

##Summary
The utility of biophysical connectivity model studies as a research tool for understanding connectivity patterns appears to have peaked in 2012 (@fig:years). We looked at the different groups of behaviours that were implemented (passive or moving, settlement sensory zone & orientation) for both fish and invertebrate taxa to see how trends over time were occurring. For the fish, we can see that while the number of studies using fish has been decreasing since 2012, so has the studies using passive movement, with 2015 being the first time there were more studies using movement behaviours than other forms of behaviour (@fig:fish_prop). Implementation of settlement sensory strategies seem to have remained constant over the published time period. Interestingly, the ability of fish to orientate towards settlement sites was only found to be implemented in one study in 2012. This is despite the plethora of recent research regarding the ability of reef fish larvae to orientate towards natal reefs using olfactory mechanisms and the direction of the sun (*TODO: Cite Leis / Kingsford*). For the invertebrates, there appears to be no real real change in the pattern of implemented behaviours, except for 2014 when there was a trend towards passive moving larvae (@fig:invert_prop).

![The years studies in the review were published](../figs/years.png){#fig:years}

![The proportion of behaviours in the published fish studies by year](../figs/fish_prop.png){#fig:fish_prop}

![The proportion of behaviours in the published invertebrate studies by year](../figs/invert_prop.png){#fig:invert_prop}

###Motivations
The overwhelming motivation for using a connectivity biophysical model was to answer questions about dispersal and settlement (@fig:motivation). Dispersal models without settlement and studies motivated by investigating marine park connectivity occurred in equal frequencies. Theoretical and climate change studies were both rare motivations amongst these review papers. Understandably, climate change predictions for connectivity patterns using hydrodynamic modelling have inherent difficulties in ascertaining their accuracy due to having to use past oceanographic data. Interestingly, there were few studies using a purely theoretical approach to understanding the biology that influences connectivity, although many studies indirectly accomplished this by using different behaviours.

![The different motivations for the studies reviewed](../figs/motivation.png){#fig:motivation}

###Regions
The regions these studies investigated span the breadth of the globe, although like Miller's 2007 review, they concentrated in highly industrialised fishing regions, such as the North-East Atlantic coast and the Mediterranean Sea (@fig:ocean_regions). A noticeable difference reflects the increase in tropical studies, with 35% of the studies occurring in tropical regions, compared to only 4% in Miller's 2007 review. The majority of studies were in temperate waters (65%), with one study in the Antarctic polar region and another attempting a global connectivity study.

![The oceanographic regions modelled in the studies used in the review](../figs/oceanic_region.png){#fig:ocean_regions}

###Taxa
The taxa of species modelled, when looking at individual model runs (there were often multiple species per paper), consisted of 10 major groups and a generic group (@fig:species). These 10 taxa comprised 47 different species and another 7 which were specified at the family level, e.g. Labridae or Sparidae. Generic species, defined as a suite of parameters that could apply to several species, was used in 40.2% of the model runs with 99 of these occurring in one paper. Fish (39%) and Bivalves (10%)were the most commonly specified taxa. Individual species were modeled within the fish taxa to the greater extent compared with modeling to the family level or even as generic fish.

![The different taxa that were modelled in the reviewed papers (need to rename NA to generic)](../figs/species.png){#fig:species}

###Models used
Most studies practice software reuse, using an existing particle tracking model (82.6%), rather than create a new model (16.0%). The three most popular models used were Ichthyop (18.67%), Connectivity Modelling System (CMS;12.0%) & MGET (8.0%) (*TODO: Need to find the citations for these models*). A minimum of 21 different models were used although we were unable to identify the exact particle tracking model used for 22.7% of the papers. The studies used forecasting models to run their connectivity studies, with one exception. This exception used a hindcast solution whereby the larvae were moved from settlement sites to determine their natal sites {Wren:2016gu}.

## Metrics
When describing the results of connectivity studies, there was a lot of variation in the metrics used. There were in-excess of 25 different measures used to describe the patterns of dispersal and settlement. The common approaches were to use combinations of dispersal kernels (64.0%) and connectivity matrices (57.2%). Some less common measures of model output were larval centre of mass (average geographical position of the larvae) {Lacroix:2013cf}{Miyake:2011hr}, isotropy (describes the inertia around the centre of mass) {Ayata:2010hg}, positive area (number of areas that had larvae in them) {Puckett:2014cx}, and proportion of sites settled {Robins:2013ih}.

The trend in biophysical modelling is to present data using visual techniques such as heat maps, which being effective, make it difficult to pull out quantified data points. The most common values we could extract were self-recruitment (the percentage of settlers at a site that were spawned from there), local retention (the percentage of spawned larvae at a site that settled there) and overall settlement success of larvae. For a detailed explanation of how these are calculated from the connectivity matrix, see {Burgess:2014cf}. 

We could extract mean self-recruitment values from 17.5% of the published models, even though 29.7% of the papers used self-recruitment in their analysis. There was a large spread of the mean self-recruitment amongst the models, ranging from 0-98%, depending on the study, with a median value self-recruitment value of 13.0%. Local retention, while mentioned for 31.7% of studies, we were only able to get mean local retention values for 5.5% of the models. Most people only reported potential connectivity models (potential is the probability of settlement, where realised is a more accurate measure offset by biological processes such as egg production and mortality). Mean local retention ranged from 0.3-46.0%, with a median value of 6.0%. Overall mean settlement success of the larvae was extracted for 18.02% of the studies, ranging from 0.1-80% successful settlement rates, with a median of 26.8%. 

To see if there was an effect of the modelled geographical area on settlement, the regions were broadly categorised into open (coastal, island) or closed (bay or inland sea). There was no noticeable effect of geographical area on self-recruitment, however closed systems had double the median settlement success rate. This makes sense as in a closed system the choices of settlement sites for larvae are increased. Open systems will have higher degree of unsettled larvae as many are swept out into sea and away from settlement regions. There were not enough data points on local retention for comparison on geographical location.

##Physical model

###Hydrodynamic models used
Although this review focuses on the biological part of the coupled model, we will report some findings of the physical models used. The choice of oceanographic current model depends upon the region the connectivity study is taking place in. The two most common ocean circulation models used were the Regional Ocean Modelling System (ROMS; 25.3%) and the Hybrid Coordinate Ocean Model (HYCOM; 17.3%). Nested circulation models were used in the more complex particle trackers to bypass issues of low resolution in modelling. 

The mean resolution of the largest resolution used in these connectivity models was 5.6km^2, with extremes ranging from a precise 50m^2 {Brennan:2014fm} to broader 33km^2 {Crochelet:2013kr}. As seen in Miller's 2007 review, there was no trend over time towards high resolution models. There was no relationship between either model resolution or nested models on the metrics of settlement or dispersal. This was unexpected given that sub-mesoscale processes are expected to be more accurately captured in the hydrodynamic model as the resolution increases, as would the connectivity patterns of the modelled larvae, e.g. increasing self-recruitment as small eddies trap larvae close to natal reefs.

The time particles updated in the system (environmental forcing) were either fixed time-steps or varied per other factors. The median time-step was 1 hour, and ranged between 60 seconds {Moritz:2013dc} and 24 hours {Mora:2012kn}. Under reporting of the time-step used occurred in 37.3% of the papers. The choice of time-step is determined by both the physical model and computational choices, and no rational was given for the decision in those studies. There was no relationship of time-step choice on the metrics of dispersal or settlement, therefore it is integral to be accurate when resolving oceanographic forcing.

The models used different time-scales of oceanographic data depending on the trends they were interested (inter- or intra-annual). Studies trended towards running the biophysical model using only the time-scale of a few years  (median = 3 years) (@fig:modelled_years) with the majority using only a single year  in their connectivity study. Only one study used the average of several years input data to interpret mean connectivity patterns {Feutry:2013je}. Other outliers included studies investigating climate change scenarios, which used periods of 60 years {Aiken:2011dv} and 130 years {Andrello:2014ge}. In these studies, the earliest year modelled was 1950, and the latest year modelled was 2100 (using ocean current data based on past averages). The average of the dates modelled was a start date of 2001 with an end date of 2008. Although not all models used continuous years as input, some studies only used specific years as input.

![Density plot of the total years modelled in each of the model runs](../figs/modelled_years.png){#fig:modelled_years}

##Biological model
The biological attributes implemented were not consistent across the studies, apart from the two biological parameters every connectivity study must implement, spawning strategies and pelagic larval duration. Whether this lack of consistency is because researchers do not agree that biological has much influence on connectivity patterns, some behaviours are species specific  or the empirical knowledge to parametrise the model is missing in the literature. 

: The behaviours that have been implemented in the modelled connectivity studies. Note that multiple behaviours can be implemented in the one model {#tbl:behaviours} 

|        Functionality         | Proportion |
|------------------------------|------------|
| Pelagic larval duration      |      1.000 |
| Settlement competency window |      0.487 |
| Spawning strategies          |      1.000 |
| Mortality                    |      0.410 |
| Growth                       |      0.067 |
| Sensory ability              |      0.583 |
| Orientation                  |      0.026 |
| Swimming behaviours          |      0.257 |


### Pelagic larval duration
The first core biological parameter that is inherent to every biophysical model is the pelagic larval duration (PLD) of the model species (@tbl:behaviours). The pelagic larval duration is the time the larvae spends in the ocean before it settles at a site. There were two different approaches when implementing the pelagic larval duration. The standard approach (92.4% of models) was to make the PLD value a fixed for each larva. If the individual larva reaches this time, it either must settle (if possible) or it is considered dead. The other approach was to implement some variability in the PLD, either using a Gaussian distribution (based on knowledge of the population) or instead of using time, make the PLD dependent on ocean temperature. The fixed PLD values ranged from 2-420 days, with the median value 30 days (@fig:pld_range). The PLDs were, in general, taken from known ranges found in the literature, with the highest values modelled for invertebrate species e.g. the long duration of the phyllosoma stage of some lobster larvae {ButlerIV:2011kq}{Kough:2013fa}.

![The range of fixed PLD values implemented in the reviewed models (n=318)](../figs/pld_ranges.png){#fig:pld_range}

The settlement competency window gives the fish larvae a period in which they can settle before they reach the end of their pelagic larval duration. It is generally based on their known biology and the idea that most species must develop sufficiently before their pelagic stage can finish. The length of the settlement competency window (from the beginning age of settlement to the pelagic larval duration) had no effect on the mean settlement success. It did have a slight positive correlation with self-recruitment (r^0.27, df=18) and a strong negative correlation with local retention (r^0.70, df=9). (*Note: Do I want to show these graphs?*)

###Spawning strategies
How the larvae were released in the model was dependent on the biology of the marine species, for instance fish can have multiple strategies, e.g. pelagic eggs, demersal eggs, and brooding. The implement these different strategies, studies changed the release depth of the larvae. The two strategies for releasing the particles at depth were either to use a fixed depth (37.5%), or to randomly release the larvae over a range of depth values (60.8%), i.e release larvae in in the 0-20 m range of the water column. The timing of when larvae were released varied from hourly intervals {Jacobi:2012cz}, daily {Kough:2013fa}, monthly {Staaterman:2012ek}, on lunar cycles {Davies:2014cw} or just a one-off spawning event {Herbert:2011bh}. The spawning windows relied on the known biology and what times of year the species is known to produce larvae. In general, spawning events were pre-determined, but several studies used temperature as a spawning initiation {Andrello:2014ge}{Rochette:2012io} or even wave height was used to release abalone larvae in one model {Miyake:2011hr}. In general, the release sites and settlement sites were same sites. However, in several studies with known release sites, there were many more available settlement habitats for the larvae. The larvae spawned at each site ranged from only 10 larvae to 10,000,000, with a median of 6800. The overall larvae tracked in the system (spawning site x number of sites x number of releases) had a similarly large range, from 328 to 610,000,000 larvae, with a median total of 3.2 million. Some studies also used a super-individual concept, whereby a single particle in the system represented a number of larvae with similar attributes. 

### Mortality
Larval mortality was implemented in 41% of the models (@tbl:behaviours). However, the implementation of mortality varied across the models, the most common mortality function used was a linear function (82.2%), whereby a fixed  percentage of the larvae were killed after each day. Although the number of larvae killed varied from a maximum rate of 30.0% to minimum mortality rate of 1.7%. Another popular mortality implementation was to kill the larvae based on a known temperature or salinity threshold. Mortality schemes using decay or Weibull functions were implemented in a small subset of the models (less than 2%). 

Including mortality in the model increases the mean self-recruitment (@fig:sr_mort). There was not much change in the mean overall settlement success, however mortality limited the spread of the percentage that successfully settled (@fig:ss_mort). Including mortality also seemed to increase the mean distance travelled of the larvae, which is the opposite of what you would expect (@fig:dist_mort). 

![Comparison of the mean self-recruitment values with mortality included implemented in the model](../figs/sr_mortality.png){#fig:sr_mort} 

![Comparison of the mean settlement success values with mortality included implemented in the model](../figs/ss_mortality.png){#fig:ss_mort} 

![Comparison of the mean distance travelled with mortality included implemented in the model](../figs/dist_mortality.png){#fig:dist_mort} 

*TODO: Do I need these mortality graphs and if so, put them into a panel?*

### Growth
Unlike in Miller's 2007 review, where growth was implemented in a 1/3 of the studies, only 6% of the models we looked at had the concept of growth built in (@tbl:behaviours). This would be because these models are focused on connectivity, where growth is not considered such an important factor in moving between the source and sink sites. 

### Sensory Ability & Orientation
The ability of the marine larvae to sense settlement habitat was implemented in 50.9% of the models. Of these, 95.4% opted for a buffer implementation, where each settlement habitat has a buffer zone added around it. The average size of the buffer zone around the potential settlement sites was 8.18 km. The other implementation, which essentially works on similar principles, was to give the larvae a detection distance, which was relative to the centre of the settlement site {Staaterman:2012ek}. This settlement cue was used to allow the larvae to orientate towards the reef if the larvae was within the cue distance, where they used a mixture of early and late onset sensory abilities. Giving the larvae the ability to orientate early improved their chances of settling, and increased self-recruitment. 

### Swimming behaviours
Only 26% of the models implemented swimming behaviours of some kind, meaning the other 74% assumed the larvae were passive and moved solely by the currents. This is interesting, because we know that this is not the case. At the very least many larvae have diel vertical migration patterns to below the mixed layer to escape predators during the day. Is the reason we are not seeing swimming behaviours implemented because a) we do not know enough about the behaviour of the individual species, b) researchers do not believe swimming movement has much overall effect on the connectivity patterns or c) are people trying to keep their models as simple as possible. It has been established that vertical migration (either diel or ontogenetic) does increase self-recruitment and limit the dispersal kernel (*Note:cite all the papers*).  

: The different implementations of swimming behaviours for models of ichthyoplankton. Note the proportions sum to greater than 1 because multiple swimming behaviours can be implemented {#tbl:swimming} 

|       Swimming behaviour      | Proportion |
|-------------------------------|------------|
| Horizontal swimming           |      0.125 |
| Vertical swimming             |      0.045 |
| Ontogenetic vertical swimming |      0.272 |
| Diel vertical migration       |      0.454 |
| Halocline migration           |      0.011 |
| Circatidal migration          |      0.057 |
| Pynocline migration           |      0.068 |
| Sinking velocity              |      0.034 |
| Egg buoyoncy                  |      0.045 |

### How does introducing behaviour influence connectivity

*TODO: Should I do Kruskall-Wallace tests between these groups to see the statistical differences, or just visualise it*

From the reviewed papers, if movement or settlement sensory was included in the model, it reduced the mean self-recruitment occurring of the model (@fig:behaviours_sr). This is an unexpected result, considering the overriding consensus is that self-recruitment is increased through behavioural implementations in the model. While the maximum values for mean self-recruitment are higher with behaviour, other model parameters specific to the studies could be influencing this trend. If both these behaviours were included, then self-recruitment increased, although there are fewer data points for comparison. The large spread of values for self-recruitment, ranging from close to 100% down to almost none, also suggest that the is a mix of parameters influencing the self-recruitment seen in models.

The opposite trend appears to occur for settlement success (@fig:behaviours_ss). The highest settlement success occurred when multiple behaviours of movement & settlement or movement & orientation & settlement were all included in the model. Unfortunately there were not many studies that included orientation to draw meaningful comparisons about orientation influenced connectivity amongst the papers, but the strong assumption is that it would also increase settlement success, as shown in individual studies {Staaterman:2012ek}. 

![The effect of larval behaviour (movement, orientation & settlement sensory) on the mean self-recruitment in connectivity studies](../figs/behaviours_sr.png){#fig:behaviours_sr}

![The effect of larval behaviour (movement, orientation & settlement sensory) on the mean settlement success of larvae in connectivity studies](../figs/behaviours_ss.png){#fig:behaviours_ss}


#Discussion
The interesting finding from this review is that after all the empirical knowledge of fish behaviour influencing the outcome of connectivity {Leis:2006kf}{Cowen:2009fm}, many biophysical modelling showing how connectivity changes with behaviour, and papers suggesting the way forward is to include behaviour {Staaterman:2014ee}{Anonymous:2009tx}, there are still many studies including models with no implemented behaviour at all - passive larvae were used in 75% of model configurations. One reason for this could be that the complete (or even partial) early life history is often unknown for many species, and researchers might be trying to avoid any behavioural assumptions. Fish larval behaviour is known to be species specific, yet many models are reduced to using data from the Family taxonomic level due to what is known in the literature. Such an approach for large taxonomic families like Labridae, potentially masks a large variation of behavioural traits. This then poses the question, that can we only model species where we truly understand the early life history, or is there some level of assumptions that are deemed to still be scientifically valid? Another potential explanation is there could be a divide amongst physical and biological oceanographers over how much larval behaviour compared to physical processes really do influence connectivity patterns in the real world. Although we suspect that while this might occur, it is probably not the case as these papers often involve excess of 5 co-authors, indicating high collaboration between fields.

The other interesting outcome was the large spread of values reported for these studies. The common measures of self-recruitment, local-retention and settlement success all reported huge variations amongst studies. Seemingly obvious explanations such as open/closed systems did not explain the variance. These are inherently complex systems and teasing out the differences between studies is not a trivial task. The other key driver is the variability of the oceanographic currents, which change within and between years. Therefore it was interesting there were still many studies that only looked at dispersal patterns over one or two year periods, arguably not allowing the model to capture enough natural variation.

The first caveat to such an approach is that comparisons such are difficult because of the number of parameters used to configure these biophysical models that could all have an influence on the results. This is a complicated issue to resolve. Comparing a large number of studies should cancel out some of the noise surrounding all the parameters. A future direction would be to determine a way to normalise the data based on the input parameters, allowing for more effective comparisons. Otherwise perhaps it is only prudent to compare studies that occur in the same oceanic region, at the same time, using the same physical models and perhaps the same particle disperser for consistency.

The second caveat is that is was difficult to get measures to compare amongst the papers due to the different metrics that were used. When there were common approaches of connectivity matrices, visual tools such as heat maps hid the underlying data points, impeding any meta-analysis. A consistent approach, including providing underlying data would assist in progressing the field for future comparisons, allowing us to understand why there is so much variation amongst reported measures such as self-recruitment and transport success. 

The current state of the field feels like is not moving forward as coherently it should be. Studies have been calling for behaviour to be implemented for nearly a decade, yet the majority of studies are still not including larval behavioural traits. This is despite the evidence that behaviours do change the described connectivity patterns. Perhaps we cannot move forward until these models, which include behaviour, are empirically validated. However, we would argue that the first priority should be to start including both movement and settlement sensory abilities for species where this is applicable and known in the literature. The second priority to is provide clarity in metrics so we can meaningfully compare the outcomes of connectivity studies and progress the field further.





