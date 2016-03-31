#A quantitative & reproducible approach for biophysical connectivity models
Steven Hawes^1,2^ and Will Figueira^1,2^  
1 Sydney Institute of Marine Science,  (Mosman, NSW,  (Australia); 2 University of Sydney, School of Life & Environmental Sciences (Sydney, NSW,  (Australia)

##Abstract 
1. What is the information required to publish for reproducibility, what do we need to know to evaluate]
2. How we can start useful comparisons between papers - metrics to publish
Introduction

##Introduction
Last review was in 8 years ago {Miller:2007iu}, in a fast changing field.
Initial aim was to perform a meta-analysis and see how variables of connectivity, e.g. self-recruitment, varied across these studies using biophysical models.

##Research design
We conducted a search for marine biology papers, looking at connectivity, in the last 6 year period (2010-2015) that used a biophysical model in their methods. The start date of 2010 was chosen arbitrarily, to limit the search to a manageable amount of papers-note this was not an exhaustive search. The online search engines, ISI Web of Knowledge and SCOPUS, were queried with the keywords connectivity, model* and marine. The search returned 59 papers that fit within the scope of our study, consisting of 248 authors and published in 31 unique journals. The full list of references is available at [provide reference to .csv at github perhaps or in supplementary material?]. The papers were published in journals with a diverse range of themes (e.g. ecology, oceanography, and genetics).

*Do I want to provide a summary of impact factors? Show how they are connectivity models are being published in high impact journals, i.e. They are taken seriously*

##Connectivity metrics & their parameters
In 59 papers, we found over 30 different parameters used to describe the resulting patterns of connectivity & dispersal. This became a problem when we wanted to compare our model against other similar studies, a useful tool for evaluating the robustness & accuracy of your study. In a field where there are so many metrics, which ones should be reported? The two biggest issues were that people created their own unique metric, and that people used reported a single parameter of a metric, e.g. mean, median, or upper quartile. The most common parameters used related to distance the particles travelled and measures of self-recruitment, local-retention and settlement success ([Table 1][T1]). Although this isn't as clear cut as it may seem, as there is confusion about the definitions of self-recruitment and local retention-often used interchangeably-amongst the studies. To clarify, {Burgess:2014cf} stated the definitions clearly and succinctly, local retention is the fraction of offspring produced by a population that also recruits into that population; and self-recruitment is the fraction of recruitment to a site comprised of individuals born in that site.

### Heat maps

Idea is to propose a suite of metrics that should be published in all studies.
Connectivity metrics.
Transport Success
Self-recruitment. Talk about what it measures - demographic
Local retention. Measures population persistence , important for connectivity.
Dispersal metrics.
Dispersal is most commonly measured using a PDF
Connectivity
Connectivity is most commonly measured using a connectivity matrix.
- From the core can I describe how to construct the other metrics?
- Create a table showing the % that used what metrics, perhaps the 10 most popular?

This paper suggests going with the most common metrics used for consistency. Graph theory provides some interesting metrics, yet it probably still isn't used enough (though we have nothing against it)
 
[*Table 1:* Those most common metrics published in the connectivity studies and the parameters reported per metric used.][T1]
|        Metric       |        Parameter        |  Reported |
| ------------------- | ----------------------- | --------- |
| Dispersal kernel    |                         | **71.2%** |
|                     | Mean distance           | 57.1%     |
|                     | Maximum distance        | 33.3%     |
|                     | Median distance         | 11.9%     |
|                     | Upper quartile distance | 11.9%     |
|                     | Minimum distance        | 4.8%      |
| Connectivity matrix |                         | **84.6%** |
|                     | Self-recruitment        | 70.0%     |
|                     | Local retention         | 62.0%     |
|                     | Settlement success      | 42.0%     |
|                     | Source-sink indices     | 32.0%     |
| Graph theory        |                         | **10.2%** |

[*Table 2:* The five parameter metrics that are required to make comparative analysis on studies using biophysical connectivity models][T2]
|        Metric       |     Parameter      |
| ------------------- | ------------------ |
| Dispersal kernel    | Spread             |
|                     | Distance           |
| Connectivity matrix | Self-recruitment   |
|                     | Local retention    |
|                     | Settlement success |


##Reproducibility

### Why reproducible research
Reproducibility, a buzzword is often synonymous with open science, is an important facet of assessing the scientific merit of a published paper. 

It would also provide an opportunity for marine scientists to become leaders in ecological reproducible research. 

### Barriers and cost
While reproducibility can be difficult to achieve in large empirical studies due to experimental variance {OpenScienceCollaboration:2015cn}, the same challenges do not exist in computational modelling {Peng:2011et}. Ideally the  model configurations (both physical and biological), all source code and the generated output data should be made available along with the publication. 

The cost of reproducible research is trivial, many free online repositories exist for both source code and generated data; GitHub (http://github.com) and Dryad (http://datadryad.org) are two popular examples. Several journals are also making reproducibility a requirement and providing mechanisms for online storage of data (reference journal).

### Reproducibility in connectivity studies
I'm not going to go into what is required for reproducible research, others had done summarised it better than I ever could {Sandve:2013gh}. Instead I want researchers using biophysical models for connectivity studies to embrace reproducible research and to think about how they could do more in the context of their own publications.

Biophysical models are inherently complex, combining both biological and physical models has an additive effect on the number of parameters as there is little overlap.  It is impossible to reproduce a biophysical connectivity study without all of these parameters, hence it is so important that these details are published. 

[*Table 3:* List of parameters that should be published with every connectivity study that uses a biophysical model][T3]
|   Model    |           Name          |                                                            Description                                                             |
|------------|-------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Particle   | Particle model          | Link to the source code of the particle model used and specifications with information on type, movement and integration methods e.g. Individual based model, with Lagrangian model and it uses Runge-Kutta fourth order method for integration  | 
| Physical   | Oceanographic model     | Link to the specifications of the model, including all sub-models, bathymetry & tidal models used                                  |
|            | Spatial scale           | The area the particles can move                                                                                                    |
|            | Time step               | The time step used to move the particles using the oceanographic model (preferably in seconds)                                     |
|            | Diffusion / turbulence  | Diffusion strategy (random walk, horizontal and/or vertical) and the turbulence values used                                        |
| Biological | Release times           | Release times of the particles                                                                                                     |
|            | Release strategy        | How the particles were released (e.g. daily, lunar, temperature cues, depths)                                                      |
|            | Release sites           | The GPS locations and sizes of the release sites                                                                                   |
|            | Settlement sites        | The GPS locations and sizes of the settlement sites (if different from the release sites)                                          |
|            | Particles released      | The number of particles released (both per release and in total)                                                                   |
|            | Pelagic larval duration | The pelagic larval duration of the taxa and whether you used a variable or fixed duration                                          |
|            | Pre-competency period   | The pre-competency period given before settlement could occur                                                                      |
|            | Movement strategies     | What movement strategies were the particles given and the values associated with these strategies (e.g. passive, diel, horizontal) |
|            | Mortality strategies    | The mortality strategy used (if any)                                                                                               |
|            | Settlement strategies   | How did the particles choose a settlement site (e.g. passively, sites were buffered 10 kms, sensory cues)                          |


(Mini-conclusion) Lets not re-invent the wheel.

##Discussion
The purpose of this review is to facilitate a discussion about how we can compare biophysical models, used for measuring connectivity in marine systems, to mature the field (?). We identified two main issues present in the literature that are preventing us from making meaningful comparisons. The first issue is the lack of reproducibility and clarity of the model parameters used in studies. The second issue is inconsistency in the metrics used in connectivity models and how we present the data.

In solving the first issue, we have made a concise list of the input parameters that should be published with every study. The strong trend towards supplementary information in journals allows for easy publication of these parameters without clouding the main message of the article itself [provide reference]. To provide a starting point, we have attached a template that could be utilised for future studies [reference supplementary material].
The second issue is more difficult to solve, as it depends on the motivations (confusing term) behind connectivity studies as well as the personal preferences of the researchers themselves. We have identified a succinct set of metrics that we believe provides the ability-along with knowledge of the input parameters-to compare (what?) between models. And… these metrics should be used by everyone!

The main point is that we need to start publishing quantitative metrics of both dispersal and connectivity, as too often studies have just focused on one of these facets [how to reference studies here - don't want to put anyone's nose out of joint?]. It is hoped that, in addition to providing these measures, researchers will also feel comfortable about publishing the data behind their connectivity matrices and dispersal kernels wherever possible to facilitate future meta-analyses. We know grants are increasingly asking for datasets to be made available [reference] and as such open data publication (?) should become standard practice in the near future[reference on open science].

Our chosen metrics are suggestions only and, realistically, we need a community driven approach-such as a workshop-to ensure we come up with agreed common measures. We hope this paper can begin the discussion.

##Acknowledgements
[Who do we acknowledge]

##References

##Supplementary Info
Provide a link to the list of papers used (or should I just provide a link to a github repository?)

###Reproducibility
Do I want to explain the type of values? 

####Physical parameters
+ Oceanographic models used (including sub-models, bathymetry & tidal models)
+ Spatial scale
+ Dates run
+ Timestep used
+ Diffusion method / values


####Biological parameters
+ Release times 
+ Release strategy 
+ Release sites locations 
+ Settlement site locations (if different to release) 
+ Particles released
+ Pelagic larval duration
+ Pre-competency period
+ Movement strategies
+ Mortality strategies
+ Settlement strategies

