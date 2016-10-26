# Literature review

## Title



## Introduction 
The introduction should:

define your topic and provide an appropriate context for reviewing the literature;
establish your reasons – i.e. point of view – for
reviewing the literature;
explain the organisation – i.e. sequence – of the review;
state the scope of the review – i.e. what is included and what isn’t included. For example, if you were reviewing the literature on obesity in children you might say something like: There are a large number of studies of obesity trends in the general population. However, since the focus of this research is on obesity in children, these will not be reviewed in detail and will only be referred to as appropriate.

### First background paragraph 
This review focuses on biophysical connectivity models. 

####What is a biophysical model? 

####When did we start utilising them? 

- The ICES manual was released in 2009, have people been implementing models using this paper? It has a suite of recommendations. Want to evaluate if the field is moving forward at all, or are we just making the same mistakes. 


####What are they used for?

####Aims/scope of the review

This review begun from an attempt to understand what biological parameters influence connectivity and how they influence connectivity. We wanted to build a biophysical model and we wanted to know what behaviours we needed as input to get the most accurate patterns we could (without empirical validation). Common to all models is the suspicion that the output does not in fact match the reality of the processes modelled. In connectivity modelling, it can be difficult to verify the output, factored by the spatial and temporal scales used. However, we need to have progression in the field so that where it is difficult to empirically replicate the results, we can have a degree of confidence in the accuracy and precision of the modelled patterns. The end goal is to understand what input parameters are required to make the most accurate model possible (with well understood trade-offs such as execution time), to allow us to infer compelling conclusions. 

The last major review in the area of ichthyoplankton biophysical modelling was undertaken nearly a decade ago (Miller 2007). We wanted to see if the biological processes found in this review were still relevant in recently published models. For example, had emergent processes like growth become standard in models now or was there a new consensus of parameters to implement? In the last decade, high powered computing has become more accessible to researchers and in addition researchers are becoming more programming literate, arguably due to the rising popularity of the free statistical platform R (citation needed). Therefore it is expected that models will be both more common in the recent literature and that these models will have a higher inherent complexity, as the tools and knowledge to construct these models are more ubiquitous. 

Our research interest lies in the connectivity patterns of ichthyoplankton, however we looked at studies for a variety of marine species with a pelagic larval stage, as the differences in input parameterisation can be negligible. Therefore the scope of this review was to understand the parameters being used in these models and how these input parameters effect the dispersal patterns generated. We wanted to identify what processes were shared amongst these models, to understand if there was an established suite of required biological processes. Specifically, our interest was in how the configuration of parameters affected these generated dispersal patterns, allowing us to understand what we needed to include in our model. 

#####Study aims: 

1. Wanted to compare how larval behaviours affected the connectivity patterns of models. The aim was to understand what behaviours are required to produce the most accurately generated models.


## Methods

Our review used the keywords connectivity, model* and marine, querying the online search engines ISI Web of Knowledge and SCOPUS. In total we found 76 studies matching these criteria within this period, published in 34 different journals (the full list of references and the data extracted is provided as part of the Supplementary materials). We limited the search to publication dates post-2007, as oceanographic models are the biggest influence on connectivity patterns and the resolution of these models are constantly being refines, in both spatial scale and in resolving mesoscale processes such as eddies. Therefore this arbitrary date was chosen as a cut-off in order for us to compare studies hopefully using similarly resolved physical models. 
This higher resolution makes it hard to compare between models.

Papers were assessed in three main sections, the input parameters of their physical model, the input parameters of the biological model and the metrics used to measure the model output. The physical model section included details such as the oceanographic model used, the particle tracking software, diffusion methods and model time-step. The biological model section recorded the species modelled, pelagic larval durations and the larval behaviours implemented, e.g. mortality, vertical migration or growth. The last section focused on how the study measured the output of the model. These varied widely, with X different metrics used to describe the patterns of connectivity. These metrics ranged from more common metrics such as dispersal kernels and connectivity matrices to unique metrics described by the study. Most studies performed multiple runs of their model, using different input parameters. We identified these criteria for each model specified in the study, not just that was used overall in the paper. For instance some studies might have 75 different model runs described in their paper, while others will have the one model run. 

Models were classified into four categories basic on the objective of the study: climate change, marine park connectivity, dispersal & settlement and theoretical. Climate change objectives sought to see how larval connectivity patterns changed over by temporal and spatial scales by increasing ocean temperatures. Marine park connectivity studies were focused on seeing how well connected either existing or potential marine parks were connected for various species. Dispersal and settlement approaches were interested in the dispersal or settlement of a particular species using known input parameters. Theoretical approaches to connectivity studies investigated how different larval parameters effected the pattens of connectivity. 


## Main Body

### Study species / Study areas

Most of the studies are concentrated in Northern Hemisphere, especially in the seas around Europe, with the North-West Atlantic and Mediterranean Sea accounting for 36% of the studies we investigated (Figure 4). These are 



## Where are we now?

###Physical model inputs

Comparisons with ichthyology & connectivity modelling in general? 

### Biological model inputs


### #What are the behaviours that are getting modelled



## Metrics

###How do the behaviours influence metrics?


## Future directions



## Conclusion
The conclusion should:

summarise the important aspects of the existing body of literature;
evaluate the current state of the literature reviewed;
identify significant flaws or gaps in existing knowledge;
outline areas for future study;
link your research to existing knowledge.


###Figures and tables

Comparison between self-recruitment & settlement success

Table 1: The behaviours that have been implemented in the connectivity studies modelling ichthyoplankton. Note that multiple behaviours can be implemented in the one model

|        Functionality         | Proportion(Paper) | Proportion(Model) |
|------------------------------|-------------------|-------------------|
| Pelagic larval duration      |                   |               1.0 |
| Mortality                    |                   |             0.410 |
| Growth                       |                   |             0.067 |
| Sensory ability              |                   |             0.583 |
| Settlement competency window |                   |             0.487 |
| Orientation                  |                   |             0.026 |
| Swimming behaviours          |                   |             0.257 |
| Passive                      |                   |             0.743 |


Table 2: The different implementations of swimming behaviours for models of ichthyoplankton. 

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
|                               |            |
