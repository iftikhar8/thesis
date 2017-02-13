#Theoretical modelling chapter

What swimming behaviours (including orientated) most effect the output of dispersal patterns. If you were going to implement larval behaviours, where should we start and what ideas should we be focusing on. Also do implementations matter - a case study using ontogenetic vertical migration.

##Scope
* Major aim: Compare different movement behaviours for fish
    * Diel, ontogenetic, vertical & horizontal swimming, orientation
    * Combinatorial approach (=16 including passive)

* Minor aim: Compare different implementations of ontogenetic migration

##Hypothesis

* Major: Expectation is they will all show unique patterns as they all influence the movement in different ways. However, vertical migration will exhibit a greater effect than horizontal swimming. The idea being that we cannot get away with running passive models any more! 
* Minor: I also expect that while implementation will slightly change the values, I do not expect there to be significant differences and they all try and achieve the same outcomes

##Aim 1: Movement comparison

###Methods: 
- Model a generic fish, with only the implemented behaviours to change
- Find a model species with the most known, e.g. tropical fish (use temperate swimming speeds)
- Use same random number generator (or run multiple trials?) 
- Release at 10 (equi-distant or random?) sites along the east Australian coast
- 1 run for each behaviour, including 1 for passive to baseline test against
- Use the mean values found in the review

###Results
Compare on metrics of: 
- connectivity (self-recruitment, local-retention and settlement success)
- dispersal (distance & spread)

###Analysis
- nMDS to visually compare each model run per metric (5 graphs)
- Use ANOVA to determine if there are significant differences between mean metrics for each run

##Aim 2: Implementation comparison

###Methods: 
- Use the same general methods as part one
- Look at different four implementations of OVM
    - Probability distribution function covers water column
    - Probability distribution but constrained by location
    - Fixed migration (based on age)
    - Fixed migration and randomisation within stratified zones

###Results
Using the same technique as part one. If there are major differences, then it implementation becomes a major problem is small differences can change the output. 

##Discussion
Talk about the results found, how to prioritise modelling in biophysical models. Compare to other "where to from here" papers, with the difference in this paper is we want to prioritise where the modelling & empirical effort should go to. 
