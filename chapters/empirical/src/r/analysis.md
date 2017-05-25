# Analysis steps for empirical chapter

Two facets for each analysis, a total taxa trend for reef fish, and looking at the 7 individual families.

## Aim 1: Does stage predict depth

### Exploratory graphs

Graph concentration as a factor of stage, grouped by depth

```
ggplot(aes(x=depth, y=concentration_log), data=data.all)
```

### Model

| Independent factors | Type   | Levels | Nested | Values                             |
|:--------------------|:-------|:-------|:-------|------------------------------------|
| location            | random | 2      | no     |                                    |
| feature             | fixed  | 2      | no     | coastal, eddy                      |
| station             | random | 2      | yes    |                                    |
| depth               | fixed  | 3      | no     | 0, 25, 75                          |
| stage               | fixed  | 3      | no     | pre-flexion, flexion, post-flexion |


Unit of replication = net (2)

| Dependent factor | Transformation |
|:-----------------|:---------------|
| Concentration    | log(x+1)       |

Transformation as per Underwood for concentration data.

```
model <- lm(concentration_log ~ stage * depth * station / feature * location, data=data.concentration)
```

ANOVAs to reproduce:
One for overall trends.
One per each fish family.



## Aim 2: Does length predict depth

| Independent factors | Type   | Levels | Values                             |
|:--------------------|:-------|:-------|------------------------------------|
| location            | random | 2      |                                    |
| feature             | fixed  | 2      | coastal, eddy                      |
| sites               | random | 2      |                                    |
| depth              | fixed  | 3      | 0, 25, 75                          |
| stage               | fixed  | 3      | pre-flexion, flexion, post-flexion |

| Dependent factor | Transformation |
|:-----------------|:---------------|
| Concentration    | log(x+1)       |
