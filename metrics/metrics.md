#A quantitative & reproducible approach for biophysical connectivity models
Steven Hawes^1,2^ and Will Figueira^1,2^  
1 University of Sydney, School of Life & Environmental Sciences (Sydney, NSW,  (Australia); 2 Sydney Institute of Marine Science,  (Mosman, NSW,  (Australia)

  
##Abstract 
*LEAVE THIS TO LAST*

##Introduction
Biophysical models have become a popular tool in advancing our understanding on the connectivity patterns of various marine species {SanvicenteAnorve:2014bl}{Koeck:2015bf}{Andrello:2014ge}. Biophysical models, as the name suggests, produce potential patterns of connectivity using a physical (i.e. oceanographic) model coupled with a biological model. These models are particularly relevant for connectivity in marine systems, as dispersal during a pelagic larval stage is a key driver of connectivity for many species {Cowen:2009fm}. We couple the two models together, because while oceanic processes are the presiding driver of dispersal, biological processes also have highly influential roles {Leis:2006kf}{Pineda:2007bv}. These models are useful as we can predict connectivity patterns over large temporal and spatial scales in a cheap & timely manner, compared to the current empirical techniques.

Utilising to the growing number of connectivity studies using these biophysical models, we wanted to conduct a meta-analysis to answer questions about how early-life history or oceanographic model parameters influence the connectivity and dispersal patterns described in the literature. This was found be an impossible task due to two factors. Comparisons between studies were made difficult due to the variety of metrics used amongst the papers to measure the connectivity and dispersal. The other issue was the lack of transparency on the model parametrisation for many of the studies. The other motivation for the analysis was to validate our own models against existing studies. Validation is an important concern for any modeller and constraints of time and cost make using published literature a sound alternative to empirical research studies.

We reviewed a sample of the literature to see what metrics were used when reporting connectivity studies. The aim was to use these metrics in a meta-analysis, comparing how these metrics changed with parameterisation of the biological model. The second aim was to investigate how parametrisation of biophysical models effected the output. We conducted a database search for connectivity studies, in the last 6 years period (2010-2015) using a biophysical model in their methods. The start date of 2010 was chosen arbitrarily, to limit the search to a manageable amount of papers; note this was not an exhaustive search. The online search engines, ISI Web of Knowledge and SCOPUS, were queried with the keywords connectivity, model* and marine. The search returned 59 papers fitting within the scope of our study, consisting of 248 authors and published in 31 unique journals. The full list of references is available at (*provide reference to .csv at github perhaps or in supplementary material?*). 

##Metrics

###General Introduction
Biophysical connectivity studies have two related quantifying 



Two prominent problems we came across were researchers creating their own unique metric, which not embraced in other studies or only a single parameter of a metric was reported, e.g. mean, median, or upper quartile. These two issues made comparisons between studies almost impossible. In fact, we found over 30 different measures used to describe the patterns of connectivity & dispersal in these papers.

### Heat maps (Connectivity matrices & dispersal kernels)
The de-facto standard for publishing connectivity matrices and dispersal kernels is to use a heat map. While heat maps are a powerful visualisation tool for both these metrics, it restricts what information which can be extracted from the graph, which bins the values to a colour legend, resulting in information loss. Comparative quantitative metrics are essential for analysis between studies, needed for model validation.

###Why hard to get compare values? 
In a field where there are so many measures, which ones should be consistently reported? The most common parameters found in the dataset related to distance the particles travelled and measures of self-recruitment, local-retention and settlement success (@tbl:common). Although this isn't as clear cut as it may seem, as there is confusion about the definitions of self-recruitment and local retention. These terms were often used interchangeably. {Burgess:2014cf} stated the definitions clearly and succinctly, i.e. local retention is the fraction of offspring produced by a population, which also recruits into that population; and self-recruitment is the fraction of recruitment to a site comprised of individuals born in that site.

### What do we want and how to reproduce?
Our suggested approach is to utilise the two most common metrics used, these provide useful measures and also they should be readily accepted amongst the research community (@tbl:metrics). The first metric, a connectivity matrix, is the most useful for connectivity studies. The measures of self-recruitment, local retention and settlement success can all be calculated easily from the underlying matrix data. The other metric is a dispersal kernel. The dispersal kernel gives up valuable data on the spread of the particles and the distance they travel, including the density.
  
### Summary (Do I need this section?)


##Models and reproducibility

###Why is it important?
Reproducibility, a term often synonymous with open science, is an important facet in assessing the scientific merit of a published paper. It can be difficult to achieve in large empirical studies due to experimental variance {OpenScienceCollaboration:2015cn}, the same challenges do not exist in computational modelling {Peng:2011et}. Ideally for reproducibility, the model configurations (both physical and biological), all source code and the output data is made available at the time of publishing. Reproducibility allows us to run other published models to compare and contrast again our own.

The cost of reproducible research is minimal, many free online repositories exist for both source code and data, two popular examples being GitHub (http://github.com) and Dryad (http://datadryad.org) . Several journals are also making reproducibility a requirement and providing mechanisms for online storage of data (e.g. PLOS Biology).

###What is required?
We're not going to go into what is required for reproducible research, others have summarised it better than we ever could {Sandve:2013gh}. Instead, the goal is to get researchers using biophysical models for connectivity studies to embrace the concept of reproducible research and to think about how they can meet this goal when publishing their next study.

###How can we achieve it?
Complexity in biophysical models derives from coupling two distinct models, biological and physical, creating an additive effect on the number of input parameters.  However, it is impossible to reproduce a biophysical connectivity study without all of these parameters, hence the importance of publishing these parameters along with the results. We have supplied a non-exhaustive list of the sort of parameters required to reproduce these studies (@tbl:open). The strong trend towards supplementary information in journals allows for publication of these parameters without obscuring the primary scientific message.                                                  

#A common approach
The purpose of this paper is to advance a dialogue about how we can compare biophysical models, used for measuring connectivity in marine systems, with the goal of maturing the field. We identified two main problems in the literature with connectivity studies preventing us from making meaningful comparisons. The first is the inconsistency in the metrics used in connectivity models and how we present the data. The second is the lack of reproducibility and clarity of the model parameters used in studies. 

The main take home message is connectivity modelling studies need to start publishing quantitative metrics of both dispersal and connectivity; too often studies have just focused on one of these facets. We hope, in addition to providing these measures, researchers will also feel comfortable about publishing the data behind their connectivity matrices and dispersal kernels, allowing for future meta-analyses. Research grants are increasingly asking for publication of datasets and as such, open data publications should start becoming standard practice in the near future.

##Summary
Our chosen metrics are suggestions only and, realistically, we need a community driven approach——perhaps a discussion facilitated by a workshop——to ensure we come up with agreed common metrics. We hope this paper goes some way to starting this conversation.

##Acknowledgements
???

###Tables

: Those most common metrics published in the connectivity studies and the parameters reported per metric used. {#tbl:common} 

|        Metric       |        Measure parameters        |  Reported(%) |
| ------------------- | ----------------------- | :-------: |
| Connectivity matrix |                         | **84.6** |
|                     | Self-recruitment        | 70.0     |
|                     | Local retention         | 62.0     |
|                     | Settlement success      | 42.0     |
|                     | Source-sink indices     | 32.0     |
| Dispersal kernel    |                         | **71.2** |
|                     | Mean distance           | 57.1     |
|                     | Maximum distance        | 33.3     |
|                     | Median distance         | 11.9     |
|                     | Upper quartile distance | 11.9     |
|                     | Minimum distance        | 4.8      |
| Graph theory        |                         | **10.2** |  


: The five measures that are required to make comparative analysis from studies using biophysical connectivity models. {#tbl:metrics} 

|        Metric       | Measure parameters |
| :------------------ | :----------------- |
| Connectivity matrix | Self-recruitment   |
|                     | Local retention    |
|                     | Settlement success |
| Dispersal kernel    | Spread             |
|                     | Distance           |


: List of parameters that should be published with every connectivity study using a biophysical model. {#tbl:open}

|   Model    |           Name          |   Description                        |
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


##References




