#A quantitative & reproducible approach for biophysical connectivity models
Steven Hawes^1,2^ and Will Figueira^1,2^  
1 Sydney Institute of Marine Science,  (Mosman, NSW,  (Australia); 2 University of Sydney, School of Life & Environmental Sciences (Sydney, NSW,  (Australia)

##Abstract 


##Introduction
In recent times, biophysical models have become a popular tool in advancing our understanding on the connectivity patterns of various marine species. (Ref SEVERAL PAPERS). Biophysical models, as the name suggests, produce potential patterns of connectivity using a physical model coupled with a biological model. These models are particularly relevant for connectivity in marine systems, as dispersal during a pelagic larval stage is a key driver of connectivity. We couple the two models together, because while oceanic processes are the presiding driver of dispersal, biological processes also have highly influential roles ({Cowen:2009fm}). The usefulness of these models is their ability to quickly and cheaply give us connectivity patterns over temporal and spatial scales; and also due to the high costs associated with empirical research techniques.

Ecological modellers inherently have underlying concerns about the validity of their models - how realistically have they modelled the system processes? This is a central, if not the primary, concern in all ecological modelling studies. Validation through empirical studies is the gold standard, yet constraints of cost, time and resources generally do not make this possible. Another practical and cheaper and approach is to use other published studies, both empirical and modelling, for validation.

With the goal of validating our own biophysical model, we reviewed connectivity studies, published in the last 5 years. Unfortunately, there was inherent difficulty in comparisons, due to the number of competing metrics and lack of transparent data. For a number of these studies, not enough information was provided to be able to reproduce the connectivity patterns presented. Thus prompting two following important questions which need to be address for future studies:

1. How we can start useful comparisons between papers - which metrics should we use?
2. How do we make connectivity studies reproducible? 

##Research design
We conducted a database search for connectivity studies, in the last 6 year period (2010-2015) that used a biophysical model in their methods. The start date of 2010 was chosen arbitrarily, to limit the search to a manageable amount of papers; note this was not an exhaustive search. The online search engines, ISI Web of Knowledge and SCOPUS, were queried with the keywords connectivity, model* and marine. The search returned 59 papers that fit within the scope of our study, consisting of 248 authors and published in 31 unique journals. The full list of references is available at (*provide reference to .csv at github perhaps or in supplementary material?*). The papers were published in journals with a diverse range of themes e.g. ecology, oceanography, and genetics.

##Connectivity metrics & their parameters
In 59 papers, we found over 30 different parameters used to describe the generated patterns of connectivity & dispersal.  We had a goal compare the robustness & accuracy of our model by comparisons with similar studies. Two prominent problems we came across were that researchers created their own unique metric that was not embraced in other studies or that only a single parameter of a metric was reported, e.g. mean, median, or upper quartile. These two issues made comparisons between studies almost impossible. 

The de-facto standard for publishing connectivity matrices and dispersal kernels is to use a heat map. While heat maps are a powerful visualisation tool for both these metrics, it  restricts what information can be extracted from the graph as the use of colours forces the values to be binned and therefore information is lost. Quantitative metrics are essential for study comparisons, so important in connectivity modelling studies, where we are so concerned about the validity of our output.

This begs the question, in a field where there are so many metrics, which ones should be consistently reported? The most common parameters used related to distance the particles travelled and measures of self-recruitment, local-retention and settlement success ([Table 1][T1]). Although this isn't as clear cut as it may seem, as there is confusion about the definitions of self-recruitment and local retention-often used interchangeably-amongst the studies. To clarify, {Burgess:2014cf} stated the definitions clearly and succinctly, local retention is the fraction of offspring produced by a population that also recruits into that population; and self-recruitment is the fraction of recruitment to a site comprised of individuals born in that site.

Our suggested approach is to utilise the most common metrics used, as these will be most easily accepted. Metrics could also be tied to the motivation being the connectivity study.
 
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
Reproducibility, a buzzword often synonymous with open science, is an important facet of assessing the scientific merit of a published paper. It can be difficult to achieve in large empirical studies due to experimental variance {OpenScienceCollaboration:2015cn}, the same challenges do not exist in computational modelling {Peng:2011et}. Ideally the  model configurations (both physical and biological), all source code and have the output data made available as part of the publication. 

The cost of reproducible research is trivial, many free online repositories exist for both source code and data; GitHub (http://github.com) and Dryad (http://datadryad.org) are two popular examples. Several journals are also making reproducibility a requirement and providing mechanisms for online storage of data (e.g. PLOS Biology).

### Reproducibility in connectivity studies
We're not going to go into what is required for reproducible research, others have summarised it better than we ever could {Sandve:2013gh}. Instead the goal is to get researchers using biophysical models for connectivity studies to embrace reproducible research and to think about how they could do more in the context of their own publications.

Biophysical models are inherently complex, combining both biological and physical models has an additive effect on the number of parameters as there is little overlap.  It is impossible to reproduce a biophysical connectivity study without all of these parameters, hence it is so important that these details are published. We have supplied a non-exhaustive list of the the sort of parameters required ([Table 3][T3])

[*Table 3:* List of parameters that should be published with every connectivity study that uses a biophysical model][T3]
|   Model    |           Name          |                                                                                                                   Description                                                                                                                   |
|------------|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Particle   | Particle model          | Link to the source code of the particle model used and specifications with information on type, movement and integration methods e.g. Individual based model, with Lagrangian model and it uses Runge-Kutta fourth order method for integration |
|            | Random number seed                        |   If random numbers are used, it is important to publish the seed used to generate the random number so the study can be replicated {Sandve:2013gh}                                                                                                                                                                                                                                              |
| Physical   | Oceanographic model     | Link to the specifications of the model, including all sub-models, bathymetry & tidal models used                                                                                                                                               |
|            | Spatial scale           | The area the particles can move                                                                                                                                                                                                                 |
|            | Time step               | The time step used to move the particles using the oceanographic model (preferably in seconds)                                                                                                                                                  |
|            | Diffusion / turbulence  | Diffusion strategy (random walk, horizontal and/or vertical) and the turbulence values used                                                                                                                                                     |
| Biological | Release times           | Release times of the particles                                                                                                                                                                                                                  |
|            | Release strategy        | How the particles were released (e.g. daily, lunar, temperature cues, depths)                                                                                                                                                                   |
|            | Release sites           | The GPS locations and sizes of the release sites                                                                                                                                                                                                |
|            | Settlement sites        | The GPS locations and sizes of the settlement sites (if different from the release sites)                                                                                                                                                       |
|            | Particles released      | The number of particles released                                                                                                                                                                        |
|            | Pelagic larval duration | The pelagic larval duration of the taxa and whether you used a variable or fixed duration                                                                                                                                                       |
|            | Pre-competency period   | The pre-competency period given before settlement could occur                                                                                                                                                                                   |
|            | Movement strategies     | What movement strategies were the particles given and the values associated with these strategies (e.g. passive, diel, horizontal)                                                                                                              |
|            | Mortality strategies    | The mortality strategy used (if any)                                                                                                                                                                                                            |
|            | Settlement strategies   | How did the particles choose a settlement site (e.g. passively, sites were buffered 10 kms, sensory cues)                                                  

##Discussion
The purpose of this paper is to facilitate a discussion about how we can compare biophysical models, used for measuring connectivity in marine systems, with the goal of maturing the field. We identified two main issues in the literature that are preventing us from making meaningful comparisons. The first issue is inconsistency in the metrics used in connectivity models and how we present the data. The second issue the lack of reproducibility and clarity of the model parameters used in studies. 

The first issue is more difficult to solve, as it depends on both the aims of the connectivity study as well and the personal preferences of the research team. We have identified a succinct set of common metrics that we believe provides the ability-along with knowledge of the input parameters-to compare the output of connectivity models.

In solving the issue of reproducibility, we have produced a concise (but non-exhaustive) list of the input parameters that should be published with every study ([Table 3][T3]). The strong trend towards supplementary information in journals allows for easy publication of these parameters without clouding the main message of the article itself. Reproducible research is an easily achievable goal in ecological modelling and as such it should be a minimum requirement of future studies.

The main take home message is that connectivity modelling studies need to start publishing quantitative metrics of both dispersal and connectivity; too often studies have just focused on one of these facets. We hope that, in addition to providing these measures, researchers will also feel comfortable about publishing the data behind their connectivity matrices and dispersal kernels wherever possible to facilitate future meta-analyses. Grants are increasingly asking for publication of datasets and as such, open data publications should start becoming standard practice in the near future.

Our chosen metrics are suggestions only and, realistically, we need a community driven approach-such as a workshop-to ensure we come up with agreed common measures. We hope this paper goes some way to starting this discussion.


##Acknowledgements
???

##References


