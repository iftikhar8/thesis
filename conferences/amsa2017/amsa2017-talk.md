# An analysis of current trends in biophysical connectivity modelling and where to next
## Authors: Steven Hawes, (Phd Candidate) and A/Prof Will Figueira (Supervisor).
???
Hello. My name is Steven Hawes, I'm from the University of Sydney, undertaking a PhD.
I hope you have all thoroughly enjoyed this conference as much as I have. This is the second half of a talk I gave back in 2015, at the Geelong conference. So I apologise if it sounds like something you may have heard before. Although, as I'm speaking on the last day, potentially no one is paying too much attention anyhow.
---
# What is a biophysical connectivity model?

Combination of biological model with physical model.

Mature modelling technique - been used 30 years (first published in 1988)
---
# Why are they useful?

PROs:
Can estimate patterns of connectivity over spatial and temporal scales that empirical studies do not allow for.
Cheap.
Allow us to investigate how different parameters effect connectivity.

CONs:
Element of faith in the results.
Models are only as good as the information you put in.

---
# Estimating connectivity

We are interesting in the BIOLOGY.
(It makes increasingly little sense to not include the biology)
[Show the connectivity picture]

---
# Ever increasing complexity

Models are getting more complex
- Increased computing power
- More empirical studies reflecting ability of larval fish
---
# Aims of the meta-analysis

To understand what input parameters

Last major review was in 2007 (Miller).
---
# Methodology

Searched connectivity, model* and marine, querying the online search engines ISI Web of Knowledge and SCOPUS (Dates 2009 - 2016)
* Found 77 studies published in 34 journals
* Looking at marine species with a pelagic larval stage and sedentary adult phase
---
# Common connectivity metrics
| Term                | Definition                                                                                                                                                                                      |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Self-recruitment    | The percentage of settlers to a site, that (regardless of their origin site) were natal to that site.                                                                                           |
| Local retention     | The percentage of the larvae natal to a site that recruited back to that site.                                                                                                                  |
| Settlement success  | The percentage of recruits natal to a site that recruit to any site.                                                                                                                            |
| Dispersal kernel    | The probability density function of the dispersal distance for the larvae released in the system.                                                                                               |
| Connectivity matrix | A matrix with columns specifying *i* natal sites and rows specifying *j* settlement sites, showing the probability of a larva spawned at site~*i*~ that settles at site~*j*~ at position~*ij*~. |

---
# Yearly trends

[INSERT YEARS GRAPH]

???
As you can see it peaked in 2012 and has been declining since for reasons unclear.
Similar yearly trends as the Miller's review, consistent publications.
---
# Taxa
[INSERT TAXA GRAPH]
* 47 species from 10 taxa
* Most modelled a generic species (40%), then fish (39%)
---
# Oceans regions studied
[INSERT OCEAN REGIONS GRAPH]
Focused on high industrial fishing regions. Most studies were in temperate regions, same as Miller's study, but tropical regions increased from 4 to 32 %.
---
# Years modelled
(INSERT YEARS MODELLED GRAPH)
* Median years modelled was 3.
* 27% used a single year
---
# Physical parameters (part 1)
* Oceanographic model depends on the study region
* ROMS (26%) and HYCOM (17%) most popular now (Miller had FEM and HANSOM)
* Some used nested ciruclation models for caputring in-shore complexity
* Mean resolution was 5.6 km^2 (Miller's review had 10.8 km^2)
* Time-step tracking ranged from 60 seconds to 24 hours (median 1 hour, same as Miller's review)
---
# Biological behaviours implemented

| Functionality                | Implemented (%) |
|------------------------------|-----------------|
| Pelagic larval duration      | 100.0           |
| Settlement competency window | 48.3            |
| Spawning strategies          | 98.3            |
| Mortality                    | 41.0            |
| Growth                       | 6.7             |
| Sensory ability              | 58.3            |
| Orientation                  | 2.6             |
| Swimming behaviours          | 25.7            |

---
# Pelagic larval duration





---
# Influence of modelling decisions on connectivity values
---
# Physical parameters
---
# Particle model choice
[Use the graph of the four metrics]
* Implementation matters?
* Wide spread of values
---
# Model resolution
---
# Model design
---
# Study system
