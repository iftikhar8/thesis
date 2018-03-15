Discussion
==========

Thesis aims and summary
-----------

1.	Identify modelling choices of connectivity modelling that are important
2.	Get empirical evidence of ontogenetic vertical migration for reef fish off NSW
3.	Identify important modelling choices off NSW for ichthyoplankton
4.	Identify the marine reserve networks of NSW for black cod.

* Data gaps
* Generalities in connectivity modelling.
    * empirical data
    * what changes in theroretical . OHS, why don’t people change as much
    * OVM. were there generalities? was there a variation
    * where do we go from here - lack of uniformity and reporting.
    * summaries. connectivity is powerful, probably the tool due to hard empirical . knowledge gaps. going forward.
    *  - or localised
* Standardisation etc.

What does the thesis do and how did it achieve it?

Meta-analysis
- How can we report metrics better?
- What can we do with these choice?


Empirical chapter

Theoretical chapter

Applied chapter


## Implications for connectivity, data gaps & generalities

## Implications for biophysical dispersal modelling - how to move forward

A trait common to nearly all biophysical connectivity studies is that they are attempting to estimate at least one of two fundamental and general patterns; 1) levels of connectivity between natal and settlement sites and 2) dispersal of particles in the system. The first is essentially a measure of larval source-sink dynamics, looking at patterns of production and settlement in marine species with a pelagic larval phase that inherently links one patch in the system to another. The second is a measure of the total dispersal area, looking at issues such as how far the particles travel and where they occur in highest densities in the system. Both traits are useful in describing system connectivity and dispersal and are a product of the system and modelling environment. In undertaking the review in Chapter 2, I came across two impediments to a meta-analysis of these estimated metrics. Firstly, many studies utilised their own unique metric in measuring either of these patterns. In fact, we found over 25 different measures used to describe the patterns of connectivity & dispersal Secondly, for a given metric, often only a single summary statistic was reported, e.g. mean, median, or upper quartile. Summary statistic are useful, however they were often reported without information on the underlying dispersal distribution, making rigorous qualitative comparisons difficult.

### Models and reproducibility

Reproducibility, a term often synonymous with open science, is an important facet in assessing the scientific merit of a published paper. It can be difficult to achieve in large empirical studies due to experimental variance [@opensciencecollaboration2015], however, the same challenges do not exist in computational modelling [@peng2011]. Ideally for reproducibility, the model configurations, source code and the output data is made available at the time of publishing. Transparency provides both confidence to the reader, and importantly the peer reviewer, about the outcome and interpretations of the study.

@sandve2013 produced ten rules of reproducibility for computational research, which all apply to studies involving a biophysical model. Most are intuitive, such as tracking exactly how results were obtained, automating as many steps as possible, and using version control for scripts, code & software. Others are not thought about as often, like recording the seed used for random number generators, which was not seen amongst the connectivity studies. The most visible facet to a researcher reading a published study is Rule 10; "all input data, scripts, versions, parameters, and intermediate results should be made publicly and easily accessible" [@sandve2013]. Ignoring the reporting of the random number seed and providing access to source code, only 34% of the studies in our review could be considered reproducible.

Transparency is difficult when performing complex modelling because of all the parameters used. In our review, there were many common and rectifiable omissions that prevented reproducibility, deduced while inspecting the methods and the supporting information (if available). 12% of the studies did not mention the years used for their oceanographic model in their simulation. 34% did not mention the time-step used when advecting the particles in their model. 69% mentioned using diffusion in their model, but only 51% of these published the diffusion coefficient used. When mortality was implemented into the biophysical model, 25% of these studies either did not include the mortality curve or rate used. It is advised, where possible, to use oceanographic models that are freely available to the public. Fortunately, this is happening more, whether it is government funded ocean models becoming available through legislative requirements or studies using open hydrodynamics models such as the Regional Ocean Modeling System (ROMS) or the Princeton Ocean Model (POM), which can be coupled with higher resolution models for specific site locations. Transparency amongst models (providing source code) allows for other researchers without the necessary coding skills to utilise the system. There are several examples of this already [e.g. Icthyop [@lett2008], CMS [@paris2013], MGET @roberts2010], suggesting popular support for model reuse amongst the community.

Complexity in biophysical models derives from coupling two distinct models, biological and physical, creating an additive effect on the number of input parameters.  However, it is impossible to reproduce a biophysical connectivity study without all of these parameters, hence the importance of publishing these parameters along with the results. The strong trend towards supplementary information in journals allows for publication of these parameters without obscuring the primary scientific message. The cost of reproducible research for biophysical studies is minimal, many free online repositories exist for both source code and data, two popular examples being GitHub (http://github.com) and Dryad (http://datadryad.org). Only two studies in the review uploaded their data using such a portal, both choosing to use Dryad. Several journals are also making reproducibility a requirement and providing mechanisms for online storage of data (e.g. PLOS Biology).

### A common approach

In order to provide transparency and allow for useful comparisons between connectivity studies using biophysical models, we need a common approach to publishing both methods and results. We identified two main problems in the literature with connectivity studies preventing us from making meaningful comparisons. The first is a lack of commonality of metrics used to describe the connectivity amongst studies. The second issue is the lack of reproducibility and clarity of the model parameters used in studies.

To get consistency amongst metrics, our suggested approach is to utilise the two most common metrics currently reported. These provide useful measures and also they should be readily accepted amongst the research community (@tbl:metrics). The first metric, a connectivity matrix (also referred to as a transition matrix), is the most useful for connectivity studies. The connectivity measures of self-recruitment, local retention and settlement success can all be calculated from the underlying matrix data (means of these values are also useful in publication for easy reference). Therefore, in addition to presenting the data in a heat map visualisation, the full connectivity matrix should be published. It is suggested these are published in an online data-repository or attached as supplementary information, rather than in the body of the paper. This is especially important where studies may have simulated a number of connectivity matrices for different situations (e.g. time periods, parameter combinations). The supplied matrices can be the summary of your data, e.g. if your study was conducted over a five year period, the matrix can be the mean connectivity over this period. It is understood reporting of connectivity matrices can become non-trivial depending on the number of sites used in the model and the number of days larvae are spawned. There is no one solution, instead options ranging from complete data dumps, to summarising results into more management segments (e.g. years), or even only providing data relating to the important findings of the paper.  However, if you vary a parameter such as PLD, different matrices should be supplied for each value used value used in order for such results to be more broadly useful to the field in the future. Graph theory is also a useful technique to assess the connectivity of a system. There are easily derived and comparable metrics, however, it can be hard to calculate the underlying values of the connectivity matrix, which makes it hard to compare against studies that do not also use a graph theory approach. So even where graph theory has been utilised, publishing the basic connectivity matrix is still important.

: The two metrics that are required to make comparative analysis from studies using biophysical connectivity models. From each of these metrics, four important measures can be derived for further analysis {#tbl:metrics}

| Published metric    | Derivable measure parameters    |
| :------------------ | :-----------------            |
| Connectivity matrix | Site-site connectivity values |
|                     | Self-recruitment              |
|                     | Local retention               |
|                     | Dispersal success             |
| Dispersal kernel    | Mean distance travelled       |
|                     | Median distance travelled     |
|                     | Maximum distance travelled    |
|                     | Measure of spread             |

The second most important metric used to describe the output of these models is the dispersal kernel. The dispersal kernel——a probability density function——gives information about the spread and distance of dispersed the particles in the system. For the dispersal kernel, a publishing the density plot, along with a heat map, is the recommendation. From a density plot we can derive the mean, median and maximum distance travelled to allow for comparisons between studies, along with the distribution of the dispersal kernel. Note that when we talk about distance, we are referring to actual distance travelled, therefore when other distances such as straight-line or alongshore distances are used it is important to define this. There is no consensus for a measure used for spread. A few of studies in our review used a measure called positive or seeded area, which counted all the cells in the system that had greater than one particle to get a measure of spread. Another two studies tried to calculate the centre of the mass of particles to see how it changed over time. The positive area measure holds potential though it would need to be standardised to the size of the cells used in the model.

To provide transparency between studies on how the biophysical model is implemented, we have provided a non-exhaustive list of the sort of parameters required to reproduce these studies (@tbl:open). The list covers parameters used for both the physical and biological models. This is not definitive, models will increasingly become more complex and there will be more parameters added to the initialisation of the models. For reproducibility purposes, an individual set of parameter values should be supplied for every model run used in the study. Again, these can be supplied in the supporting information or online in a data repository.

: List of input parameters to a biophysical model that should be published as part of every connectivity study using a biophysical model. All values should be published in the appropriate SI units where applicable. The supplied column list the percentage of studies that included this information at the time of publication {#tbl:open}

| Model      | Name                    | Description                                                                                                                                                                                                                                     |   |
|------------|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---|
| Particle   | Particle model          | Link to the source code of the particle model used and specifications with information on type, movement and integration methods e.g. Individual based model, with Lagrangian model and it uses Runge-Kutta fourth order method for integration |   |
|            | Random number seed      | If random numbers are used, it is important to publish the seed used to generate the random number so the study can be replicated [@sandve2013]                                                                                                 |   |
| Physical   | Oceanographic model     | Link to the specifications of the model, including all sub-models, bathymetry & tidal models used                                                                                                                                               |   |
|            | Spatial scale           | The area the particles can move                                                                                                                                                                                                                 |   |
|            | Time step               | The time step used to move the particles using the oceanographic model (preferably in seconds)                                                                                                                                                  |   |
|            | Diffusion / turbulence  | Diffusion strategy (random walk, horizontal and/or vertical) and the turbulence values used                                                                                                                                                     |   |
| Biological | Release times           | Release times of the particles                                                                                                                                                                                                                  |   |
|            | Release strategy        | How the particles were released (e.g. daily, lunar, temperature cues, depths)                                                                                                                                                                   |   |
|            | Release sites           | The GPS locations and sizes of the release sites                                                                                                                                                                                                |   |
|            | Settlement sites        | The GPS locations and sizes of the settlement sites (if different from the release sites)                                                                                                                                                       |   |
|            | Particles released      | The number of particles released                                                                                                                                                                                                                |   |
|            | Pelagic larval duration | The pelagic larval duration of the taxa and whether you used a variable or fixed duration                                                                                                                                                       |   |
|            | Pre-competency period   | The pre-competency period given before settlement can occur                                                                                                                                                                                   |   |
|            | Movement strategies     | What movement strategies were the particles given and the values associated with these strategies (e.g. passive, diel, horizontal)                                                                                                              |   |
|            | Mortality strategies    | The mortality strategy used (if any)                                                                                                                                                                                                            |   |
|            | Settlement strategies   | How did the particles choose a settlement site (e.g. passively, sites were buffered 10 kms, sensory cues)                                                                                                                                       |   |

In order to advance our understanding of connectivity in marine systems, biophysical modelling studies need to start publishing consistent quantitative metrics of dispersal and connectivity so that comparisons can be made. Studies must also provide more transparency on the parameters used. We have attempted to provide a template for the basic information we think necessary based on our review. We suggest this template be used as the basis for discussion amongst scientists in the field, but strongly encourage all researches publishing the results of biophysical connectivity studies to adopt at least the principles of cohesion, consistency and transparency which are at its core. We feel that such an approach will greatly speed advancements in our understanding of the drivers and outcomes of connectivity more generally. Ultimately it is confidence in the generality of the results of these models which, along with more empirical validation of the modelled output, will allow for their more widespread use within management and conservation initiatives.

## Conclusion

OHS DISCUSSION
--------------

Shown OHS is an important factor, making issues of ocean acidification, which can remove ability to sense an even greater issue [@rossi2016], and could possibly make this finding mute.



OHS - did not account for variations in temperature waters - perhaps temeprature should be a factor in the equation. Tropical fish are known to be better swimmers than teperatre fish etc....


Modelling Issues
----------------

Need to validate Without validation these models are also only models.

### Limitations and future directions.

The most notable limitation of this modelling approach is the assumptions made for biology of *E. daemelii*, whether using values from related species or averages across species. The need for these assumptions is not specific to this study and occurs in the majority connectivity study with a biophysical dispersal model (BDM). The biggest assumption made for this study was giving the larvae the ability to sense, orientate, and swim towards suitable habitat within a 7 km boundary. From Chapter 4, it has been shown this ability for larval fish to orientate significantly changes dispersal patterns. The likelihood of *E. daemelii* larvae being able to sense habitat is why I chose to make these assumptions [@leis2010]. Another potential limitation is the coarseness of the oceanographic model used, while Chapter 2 suggested model resolution had no effect on connectivity metrics overall, it could influence the final settlement habitats reached; therefore I used settlement regions instead of specific habitat patches. This model coarseness also creates a limitation in not effectively capturing nearshore processes. Validating the results of BDMs are increasingly achievable using empirical methods and an essential next step [@burgess2014]. However, this has to be combined with more knowledge of the early-life history of *E. daemelii* to accurately parametrise model input with behaviour, and knowledge of larval production to produce realised connectivity patterns. The model included constant larval production across all regions and across all years, which is unrealistic in nature.

#### MPA connectivity

The optimum amount of coastline to protect black cod populations can be measured by the fishing pressure faced, both recreational and commercial [@botsford2009]. Its also understood that for sedentary species with larvae that can disperse long distances, such as the black cod, contiguous MPAs can be more effective when comprising coastline twice the dispersal distance [@botsford2001]. However, in contrast the size of the protected coastline for protecting adult black cod can be small, due to its limited movement as an adult [@Green:2014ct]. For a population to persist, local retention is important, therefore creating MPAs within regions that exhibit high local retention is crucial [@botsford2009], Although, some simulation studies have shown protecting quality habitat areas (i.e. carrying capacity) for rock cod is more important than preserving sites of connectivity [@Cabral:2016cr].
