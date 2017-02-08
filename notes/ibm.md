# Notes on Model

FROM: Individual-based modeling and ecology (GRIMM & Railsback)

## Individual based model

The model uses a continous space, so that the location of each particle is decribed using lat/lon coordinates. 

### Why use super individual
There are many benefits to using a super individual. Computationally it allows you to model more individuals. You lose some individual variation, but you can apply averaged variance etc. It the individual eats, it eats for X (the number of individuals it represents). Problem is you have to think about the spatial resolution and how to best to model N. 