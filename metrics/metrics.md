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
We conducted a search for marine biology papers in the last 6 years (2010-2015) that used a biophysical model in their methods. The start date of 2010 was chosen arbitrarily, to limit the search to a manageable amount of papers-this was not an exhaustive search. The online search engines, ISI Web of Knowledge and SCOPUS, were queried with the keywords connectivity, model* and marine. The search returned 59 papers that fit within the scope of our study, consisting of 248 authors and published in 31 unique journals. The full list of references used is provided in the supplementary material [provide reference]. The topics of these journals were varied, with themes such as ecology, oceanography and genetics.
*Do I want to provide a summary of impact factors? Show how they are connectivity models are being published in high impact journals, i.e. They are taken seriously*

##Common Metrics
We found excess of 30 different metrics of connectivity & dispersal amongst the studies, creating the issue of how to compare across studies. These various metrics consisted of newly created metrics to different variations of the same measure, e.g. mean or median distance travelled.
Another point of confusion in comparing studies is that people have different definitions of both self-recruitment and local-retention, including using different terminology which appear to be interchangeable between papers. {Burgess:2014cf}  stated the definitions clearly and succinctly, local retention is the fraction of offspring produced by a population that also recruits into that population; and self-recruitment is the fraction of recruitment to a site comprised of individuals born in that site.
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

### Most common metrics

+ Dispersal kernel, 71.2%
    + Mean distance, 57.1%
    + Max distance, 33.3%
    + Median distance, 11.9%
    + Upper quartile distance, 11.9%
    + Minimum distance, 4.8%
+ Connectivity matrix, 84.6%
    + Self-recruitment, 70.0%
    + Local retention, 62.0%
    + Transport success, 42.0%
    + Source-sink indicies, 32.0%
+ Graph theory, 10.2%

###Common metrics Table
This the new
Table 1 The five metrics that are required to make comparative analysis on studies using biophysical connectivity models

Dispersal metrics
+ Spread
+ Distance traveled

Connectivity metrics
+ Self-recruitment
+ Local Retention
+ Transport success

##Reproducibility

### Why reproducible research
Reproducibility, a buzzword often synonymous with open science, is an important facet of assessing the scientific merit of a published paper. 

### Barriers and cost
While reproducibility can be difficult to achieve in large empirical studies due to experimental variance {OpenScienceCollaboration:2015cn}, the same challenges do not exist in computational modelling {Peng:2011et}. Ideally the  model configurations (both physical and biological), all source code and the generated output data should be made available along with the publication. 

The cost of reproducible research is trivial, many free online repositories exist for both source code and generated data; GitHub (http://github.com) and Dryad (http://datadryad.org) are two popular examples.

### Reproducibility in connectivity
I'm not going to go into what is required for reproducible research, others had done summarised it better than I ever could {Sandve:2013gh}. Instead I want researchers using biophysical models for connectivity studies to embrace reproducible research and to think about how they could do more in the context of their own publications.

Biophysical models are inherently complex, combining both biological and physical models has an additive effect on the number of parameters as there is little overlap.  

, often requiring parametrisation of greater than 50 variables into the study.


The costs for open science and reproducibility of biophysical connectivity studies are negligible, with many online sources available to us (e.g. GitHub for source code, Dryad for digital repositories). More journals are also providing mechanisms for online storage of data.


How different inputs can effect the output.
- What does this mean again?
- 
Physical models parameters required. [List parameters in a table]
Biological model parameters required. [List parameters in a table]

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

