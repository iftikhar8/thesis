# Title: Individual-based modeling and ecology (GRIMM & Railsback)

## Individual based model
The model uses a continous space, so that the location of each particle is decribed using lat/lon coordinates.

### Why use super individual
There are many benefits to using a super individual. Computationally it allows you to model more individuals. You lose some individual variation, but you can apply averaged variance etc. It the individual eats, it eats for X (the number of individuals it represents). Problem is you have to think about the spatial resolution and how to best to model N.

## Emergent vs Imposed behaviours (pp.77)
Emergent behaviours are more explanatory of the real world system, but are more complex to understand (test + analyse). Provide explanations of how the system works, not just observed behaviours.
Also allows for generality in the model system, not just for the observed values.
Imposing empirical values tends to give rise to steady state conditions, but you don't know if it works in non-average conditions

## Sensing habitat
Distance should be related to time step. How far can the animal swim in the available time step.

## Analysing (Chapter 9 p.329)
Be careful using statistics to analyse data from IBMs. There are several arbitrary assumptions, from number of replicates, the degree of differences used in the initial values, to the amount of stochasticity included in the model.
They recommend using graphs and then simple statistics to determine differences in generated data. Communication over understanding.

### Sensitivity analysis
Better to use a regression based method against a continuous variable to compare relationships.  
Look up sensitivity analysis, robustness analysis and uncertainty analysis
