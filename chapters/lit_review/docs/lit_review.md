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

This review begun from an attempt to understand what biological parameters influence connectivity and how they influence connectivity. We wanted to build a biophysical model and we wanted to know what behaviours we needed as input to get the most accurate patterns we could (without empirical validation). Common to all models is the suspicion that the output does not in fact match the reality of the processes modelled. In connectivity modelling, it can be difficult to verify the output. This difficulty is proportional to the spatial and temporal scales used in the model. However, we need to have progression in the field so that where it is difficult to empirically replicate the results, we can have a degree of confidence in the accuracy and precision of the modelled patterns. The end goal is to understand what input parameters are required to make the most accurate model possible (with well understood trade-offs such as execution time), to allow us to infer compelling conclusions. 

The last major review in the area of ichthyoplankton biophysical modelling was undertaken nearly a decade ago (Miller 2007). We wanted to see if the biological processes found in this review were still relevant in recently published models. For example, had emergent processes like growth become standard in models now or was there a new consensus of parameters to implement? In the last decade, high powered computing has become more accessible to researchers and in addition researchers are becoming more programming literate, arguably due to the rising popularity of the free statistical platform R (insert citation). Therefore it is expected that models will be both more common in the recent literature and that these models will have a higher inherent complexity, as the tools and knowledge to construct these models are more ubiquitous. 

Our research interest lies in the connectivity patterns of ichthyoplankton, however we looked at studies for a variety of marine species with a pelagic larval stage, as the differences in input parameterisation can be negligible. Therefore the scope of this review was to understand the parameters being used in these models and how these input parameters effect the dispersal patterns generated. We wanted to identify what processes were shared amongst these models, to understand if there was an established suite of required biological processes. Specifically, our interest was in how the configuration of parameters affected these generated dispersal patterns, allowing us to understand what we needed to include in our model. 

#####Study aims: 

1. Wanted to compare how larval behaviours affected the connectivity patterns of models. The aim was to understand what behaviours are required to produce the most accurately generated models.


## Methods

Our review used the keywords connectivity, model* and marine, querying the online search engines ISI Web of Knowledge and SCOPUS. In total we found 76 studies matching these criteria within this period, published in 34 different journals (the full list of references and the data extracted is provided as part of the Supplementary materials). We limited the search to publication dates post-2007, as oceanographic models are the biggest influence on connectivity patterns and the resolution of these models are constantly being refines, in both spatial scale and in resolving mesoscale processes such as eddies. Therefore this arbitrary date was chosen as a cut-off in order for us to compare studies hopefully using similarly resolved physical models. 
This higher resolution makes it hard to compare between models.

Papers were assessed in three main sections, the input parameters of their physical model, the input parameters of the biological model and the metrics used to measure the model output. The physical model section included details such as the oceanographic model used, the particle tracking software, diffusion methods and model time-step. The biological model section recorded the species modelled, pelagic larval durations and the larval behaviours implemented, e.g. mortality, vertical migration or growth. The last section focused on how the study measured the output of the model. These varied widely, with X different metrics used to describe the patterns of connectivity. These metrics ranged from more common metrics such as dispersal kernels and connectivity matrices to unique metrics described by the study. Most studies performed multiple runs of their model, using different input parameters. We identified these criteria for each model specified in the study, not just that was used overall in the paper. For instance some studies might have 75 different model runs described in their paper, while others will have the one model run. 

Models were classified into four categories basic on the objective of the study: climate change, marine park connectivity, dispersal & settlement and theoretical. Climate change objectives sought to see how larval connectivity patterns changed over by temporal and spatial scales by increasing ocean temperatures. Marine park connectivity studies were focused on seeing how well connected either existing or potential marine parks were connected for various species. Dispersal and settlement approaches were interested in the dispersal or settlement of a particular species using known input parameters. Theoretical approaches to connectivity studies investigated how different larval parameters effected the pattens of connectivity. 



## Review results

###Summary
Biophysical connectivity model studies are a popular research tool for understanding connectivity patterns. Although it looks like this popularity peaked in 2013, with a decrease since then in their occurrence in the literature (@fig:years). The regions these studies are investigating span the breadth of the globe, although similar to Miller's 2007 review, they are still concentrated in highly industrialised fishing regions, such as the North-East Atlantic coast and the Mediterranean Sea (@fig:ocean_regions). The stark difference is in the increase in tropical studies, with 35% of the studies occurring in tropical regions, compared to only 4% in Miller's 2007 review. The majority of studies were in temperate waters (65%) , with one study in the Antarctic polar region and another attempting a global connectivity study.

![The years studies in the review were published](../figs/years.png){#fig:years}

![The oceanographic regions modelled in the studies used in the review](../figs/oceanic_region.png){#fig:ocean_regions}

The taxa of species modelled, when looking at individual model runs (there were often multiple species per paper), consisted of 10 major groups and a generic group (#fig:species). Generic species, in that there was no model species, instead a suite of parameters that could apply to several species was the most common, consisting of 40% of the model runs. Out of the specified taxa, the most common were Fish (39%) and Bivalves (10%). Within the fish taxa, in the majority, individual species were modelled, however they were sometimes modelled to the family level or even as generic fish.

![The different taxa that were modelled in the reviewed papers](../figs/species.png){#fig:species}

### Talk about the years modelled etc. All the initial summary conditions. 

## Where are we now?

###Physical model inputs

Comparisons with ichthyology & connectivity modelling in general? 

### Biological model inputs



### #What are the behaviours that are getting modelled

#### Pelagic larval duration
Nearly every study reviewed included the concept of a pelagic larval duration (PLD) (@tbl:behaviours). Whereby the larvae (or particle, from here on I shall use the larvae when referring to particles in a biophysical model) moved in the system until the a defined number of days based of knowledge from the literature. Although this was a common approach, there were a variety of methods used to implement this concept. The standard approach (92.4% of models) was to make this PLD value a fixed concept for each larvae, so that if the individual larva reached this it either had to settle where it was (if possible) or it was killed. The other approach was to implement some variability in the PLD, either using a Gaussian distribution (based on knowledge of the population) or instead of using time, make the PLD dependent on ocean temperature. Most of the fixed PLD values are found between 20-60 (@fig:pld_range). Although there were exceptions, with some models implementing values large values (excess of 100) depending on the known biology of the species, e.g. the long duration of the phyllosoma stage of some lobster larvae. 

: The behaviours that have been implemented in the modelled connectivity studies. Note that multiple behaviours can be implemented in the one model {#tbl:behaviours} 

|        Functionality         | Proportion(Model) |
|------------------------------|-------------------|
| Pelagic larval duration      |             0.993 |
| Mortality                    |             0.410 |
| Growth                       |             0.067 |
| Sensory ability              |             0.583 |
| Settlement competency window |             0.487 |
| Orientation                  |             0.026 |
| Swimming behaviours          |             0.257 |
| Passive                      |             0.743 |

![The range of fixed PLD values implemented in the reviewed models (n=318)](../figs/pld_range.png){#fig:pld_range}

#### Mortality

Larval mortality was implemented in 41% of the models (@tbl:behaviours). However the implementation of mortality varied across the models, the most common mortality function used was a linear function (82.2%), whereby a fixed  percentage of the larvae were killed after each day. Although the number of larvae killed varied from a maximum rate of 30.0% to minimum mortality rate of 1.7%. Another popular mortality implementation was to kill the larvae based on a known temperature or salinity threshold. Mortality schemes using decay or Weibull functions were implemented in a small subset of the models (less than 2%). 

#### Growth

Unlike in Miller's 2007 review, where growth was implemented in a 1/3 of the studies, only 6% of the models we looked at had the concept of growth built in (@tbl:behaviours). 

: The different implementations of swimming behaviours for models of ichthyoplankton {#tbl:swimming} 

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

## Metrics

###How do the behaviours influence metrics?

###Mortality


## Future directions



## Conclusion
The conclusion should:

summarise the important aspects of the existing body of literature;
evaluate the current state of the literature reviewed;
identify significant flaws or gaps in existing knowledge;
outline areas for future study;
link your research to existing knowledge.


###Figures and tables required

Comparison between self-recruitment & settlement success






