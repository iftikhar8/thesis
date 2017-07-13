# Summary of the analysis

## Length data
Performed mix of linear mixed models and generalized linear models

Family     | FD | D | F | T | S | C | Patterns
-----------|----|---|---|---|---|---|----------------------------
Labrid     | X  | X | X | X | X | X | Eddy > Coastal, 25 < 0 < 75
Mullid     | X  | X | X | X | X | - | Eddy > Coastal, 25 < 0 < 75
Poms       | -  | X | X | X | X | - | Eddy > Coastal, 0 < 25 < 75
Scarid     | -  | - | - | - | - | - | - diff
Scorp      | -  | - | - | - | X | - | - diff
Synodontid | -  | X | - | - | - | - | 0 = 25 < 75
Serranid   | -  | X | X | X | - | - | Eddy > Coastal, 0 = 25 < 75

### Labrid
Difficult distribution, had to log-transform the data and the analyse it using a LM.

Random variables
* There was no differences in length by location
* There were slight variances at the sites within each feature
* The residual error was large, suggesting there are more factors explaining the size of the labrids.

Interaction
* There was a significance interaction at the 75 m depth between the eddy and coastal water.

Feature
* The labrids were significantly (p=.4975) longer in the eddy (6.77 mm) than the coastal water (5.35 mm), suggesting older fish were caught in the eddies.

Depth
* Labrids were significantly larger in the 75 m water compared to the 25 m water and the surface water. But there was no difference between the length of labrids in the surface and 25 m water.

### Mullid
Difficult distribution, had to log-transform the data and the analyse it using a LMM.

Random variables
* Large differences by location, SD 55.56 mm, suggesting latitude is a factor for mullids.
* There was not much variance between the stations within each feature.
* The residual error was 25 mm, suggesting a lot of unexplained variance.

Interaction
* There was no significant interaction

Feature
* There was a significant difference between the features. The mullids in the eddy (11.83 mm) were about 8.07 mm larger in size than the mullids in the coastal waters (3.77).

Depth
* The size of the fish at the surface (7.61 mm; p/<0.05) and the 75m (10.45 mm; p<0.05) were both significantly larger than the fish in the 25m zone (5.33 mm).

### Pomacentrid
Quantiles followed a log normal distribution, used a GLMM with a log link function

Random variables
* There was little variance at the station level (0.02 mm), but there was higher variance amongst the locations (0.29 mm). The residual error was large (1.22 mm)

Interaction
* No significant interaction

Feature
* There was a significance difference in length in the eddies, the pomacentrids were about double the size in the eddy.

Depth
* The poms were significantly longer in the the 75 m water compared to both the 25 m and the surface. The 25 m pomacetrids were also significantly longer in the 25 m water.

### Scaridae
Quantiles followed a log normal distribution, used a GLMM with a log link function

Random variables
*No difference for either station or location.

Interaction
* Significant interaction at depth 75

Feature
* There was a significant difference between the lengths at the features, with the coastal larval fish 2.29 m longer on average (opposite to the labrids etc.)

Depth
* While the fish were larger in deeper waters, there was no significant difference between the depths.

### Scorpaenid
Quantiles followed a normal distribution, used a LMM

Random variables
* Location had no effect, and stations almost had no effect. The residual has variance of 3.79 mm.

Interaction
* The interaction is not significant.

Feature
* The fish were significantly larger in the eddy than the coast water.

Depth
* The fish at depth at 75m were significantly larger than the fish at 25 and the surface (1.75 mm larger).

### Synodontids
Linear model used.

Random variables
* No differences between stations, but there was a slight difference between locations. The residual was large (variance of 35.59 mm), suggesting the model is not very explanatory.

Interaction
* The interaction was not significant.

Feature
*Feature was not significant, although they were larger in the eddy.

Depth
*Depth was not significant. 25 and 75 were similar, while they were smaller at the surface.

### Serranids
Used a GLMM with a log link function.
Random variables
* Small variances at both location and station.

Interaction
* Interaction not significant.
Feature
* Longer fish in the eddy, significantly different.
Depth
* Longer fish in the 75m, significantly different.

## Ontogeny data
Standarised the data to concentrations at 250m3. 1) models wouldn't converge with low data, value was taken from another paper (Gray 1997).

### Labrids
Used a log-normal glmm. No patterns or significance.
Random variables
* Variance between stations (0.85 at stations and 0.43 at location )

Interaction
* Significant interaction between feature and stage (not depth and stage).

Feature
* Signification difference between feature

Depth
* No significant differences between depth

### Mullids
Used a log-normal glmm.
Random variables
* Variance between location and stations was minimal. Residual error was 0.53.

Interaction
* Significant interaction between feature x depth x stage. Occuring between features, at the PRE stage at the 75m depth. Driven by the high concentration of pre-flexion found inside the eddy at the surface and 25m.

Feature
* No significant differences between feature

Depth
* No significant differences between depth

# Ontogeny data

Performed mix of linear mixed models and generalized linear models

## Presence absence data

Family     | FDS | FD | DS | F | D | S | T | Salt | C | Patterns
-----------|-----|----|----|---|---|---|---|------|---|--------------------------------------------------
Labrid     | -   | -  | -  | - | - | - | - | -    | - |
Mullid     | -   | -  | -  | - | X | - | - | -    | X | More present when chloro decreases, and increases as depth
Poms       | -   | -  | -  | - | X | - | X | -    | X | Less at depth 75m
Scarid     | -   | -  | -  | - | X | - | X | X    | - | 0 < 25 = 75, conc up when salin decreases, temp increases
Scorp      | -   | X  | X  | - | X | - | X | -    | - | 0 = 25 < 75m, Pos0 < Pos25 = Pos75
Synodontid | -   | -  | X  | - | X | - | X | -    | - | 0 = 25 < 75m, Temp increase, Pre75 < Pre0 = Pre25
Serranid   | -   | -  | -  | - | - | - | X | -    | X |

## Non-zero data

Family     | FDS | FD | DS | F | D | S | T | Salt | C | Patterns
-----------|-----|----|----|---|---|---|---|------|---|---------------------------------------------------
Labrid     | -   | -  | -  | - | - | - | X | -    | - | Conc increased with temp
Mullid     | -   | -  | -  | - | - | - | - | -    | X |
Poms       | -   | -  | -  | - | - | - | - | -    | X |
Scarid     | -   | X  | -  | - | - | - | - | X    | X | conc up when salin decreases and less POS in eddy
Scorp      | -   | -  | -  | - | - | - | - | -    | - |
Synodontid | -   | -  | -  | - | - | - | - | -    | - |
Serranid   | -   | -  | X  | - | X | X | X | X    | X | 0 = 25 < 75, PRE > POS = FLE, Pre75 < Pre25 = PreS
