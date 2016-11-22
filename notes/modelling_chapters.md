class: middle, center

#Modelling chapters proposal
---
#1. Theory chapter

Vertical movement in the water column and how it affects dispersal. 

---
#Scope
Major theme: Compare different movement behaviours for fish
 - Diel, ontogenetic, vertical & horizontal swimming
 - Combinatorial approach (=16 including passive)
 
Minor theme: Compare different implementations of ontogenetic migration. 

---

#Hypothesis

##Major
Expectation is they will all show unique patterns as they all influence the movement in different ways

##Minor
I also expect that while implementation will slightly change the values, I do not expect there to be significant differences and they all try and achieve the same outcomes

---
#Movement comparison

##Methods: 
- Model a generic fish, with only the implemented behaviours to change
- Use same random number generator (or run multiple trials?) 
- Release at 10 (equi-distant or random?) sites along the east Australian coast

##Visualising Results:
Compare on metrics of: 
- connectivity (self-recruitment, local-retention & connectivity success)
- dispersal (distance & spread)

###QUESTION. How to compare 5 different response metrics and 16 model runs?
- nMDS
- Can I capture all 5 response variables in a linear model? 

---
#Implementation comparison

##Methods: 
- Use the same general methods as part one
- Look at different four implementations of OVM
    + Probability distribution function covers water column
    + Probability distribution but constrained by location
    + Fixed migration (based on age)
    + Fixed migration and randomisation within stratified zones
    
---
#2. Applied chapter

I want to do an applied chapter, but need a good question
Marine estates / parks seems like the obvious one

Connectivity between marine estates in Australia
(NSW marine estates, include federal marine parks?)

---
#Scope
##Ideas
1. Compare the connectivity of the current NSW marine estates for various fish species, using behaviour. Fish would be from the families I caught on the boat so I can use those OVM as these were caught in NSW/QLD waters. (Some of this probably has been done, but not explicitly with models & behaviour)

2. Compare the connectivity of the federal marine reserves
- pelagic / commercial marine species
- but then do I need other factors like predation?


---

# Method


# Results


---