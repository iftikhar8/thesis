## Code Book for Connectivity Review



### Variables 

#### Summary 
Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----  
ID | The unique identifier of the study | Number | (1....N)
DOI | Digital Object Identifier | DOI Code | |
Title | Title | Text | |   
Lead_author | Lead author | Text | Free text | 
Institution | Lead author's institution | Text | Free text| 
Journal | Published journal | Text | Free text |  
Published | The year the paper was published | Year | Four digit year |
Motivation | The primary motivation for the connectivity study | Text |  MP = Marine protected area connectivity, DS = Dispersal & settlement, DI = Dispersal, CC = Climate change scenarios, TH = Theoretical model

#### Study Area

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----  
Area  | The area the study was located in | Text |
Site  | The localised site of the study area | Text |
Size | The size of the study area | Text | Small (0 < 100 km) / Medium (100 < 250 km) / Large (>= 250 km)
Years_total | The number of years the model was run for | Number |
Dates  | ?? | Text |  
Release_period | The period of time particles were release in the model | Text | 
Trend_identified | ?? | Text | Intra-annual / Inter-annual / Both
Release_sites_total | ?? | Number | 
Settlement_sites_total | ?? | Number |
Release_interval | ?? | Text |
Species_scientific_name | The scientific name of the species used in the model | Text | 
Species_common_name | The common name of the species used in the model | Text | 
Species_type | ?? | Text | 
Geographical_zone | ?? | Text | Tropical / Temperate / Polar


#### Modelling Parameters 

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Model_developed_in_house | Did the authors develop the software for the study | Text |
Model_name | The name of the software used | Text | Free text
Model_type | The type of model developed (e.g. Individual based model) | Text | IBM / Density cloud
Model_Movement | The movement used in the model to move the particles | Text | L = Lagrangian, E = Euler
Physical_model | The name of the hydrodynamic model used to move the particles | Text |
Submodel | Was a submodel nested within the physical model | Text | Yes / No
Model_spatial_resolution_min | The minimum horizontal spatial resolution of the physical model | Km^2 | 
Model_spatial_grid_type | The type of spatial model used in the physical model | Text | Square / Triangular / Curvilinear / Unstructured
Model_depth | The depth the model resolves to | Metres | 
Tidal_model_used | Was a tidal model used | Text | Yes / No
Bathymetry_model_used | Was a bathymetry model used | Text | Yes / No
Model_integration | The integration used to move the particles in the model | Text | 
Model_time_step | The time step used in the model | Seconds | 
Model_time_step_type | The type of time step used in the model | Text | Fixed / Variable
Model_diffusion_scheme | The type of diffusion used in the model | Text | Random Walk / TKE
Model_diffusion_direction | The direction of the diffusion implemented | Text | Horizontal / Vertical / Both
Model_diffusion_value | The value of diffusivity | m^2.s^-1 | 
PLD_type | Type of pelagic larval duration (PLD) | Text | Fixed / Variable
PLD_fixed_value | Fixed value of the pelagic larval duration (PLD) | Days | 
PLD_variable | Type of variable pelagic larval duration | Text | Gaussian, Temperature
PLD_stdev | Standard deviation of the pelagic larval duration | Days | 
Spawning_depth_type | Does the model use a constant spawning depth | Text | Fixed / Variable
Spawning_depth_value | The depth the particles were spawned at | Metres |
Spawning_depth_min | The minimum depth at which particles were spawned | Metres |
Spawning_depth_max | The maximum depth at which particles were spawned | Metres |


#### Migration stategies 

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Passive_movement | Did the model disperse passive particles | Text | Yes / No
Diel_vertical_migration | Did the model include diel vertical migration | Text | Yes / No
Circatidal_migration | Did the model include circatidal migration | Text | Yes / No
Pynocline_migration | Did the model include pyncocline migration | Text | Yes / No
Halocline_migration | Did the model include halocline migration | Text | Yes / No
Ontogenetic_vertical_migration | Did the model include ontogenetic vertical migration | Text | Yes / No
Vertical_swimming_ability | Did the model allow particles to swim in a vertical direction | Text | Yes / No
Horizontal_swimming_ability | Did the model allow particles to swim in a horizontal direction | Text | Yes / No
Sinking_velocity | Did the model allow particles to sink based on size | Text | Yes / No

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Mortality | Did the mode include mortality | Text | Yes / No
Mortality_func | The type of mortality function applied | Text | Linear / Decay / Weibull / Temperature
Orientation | Did the model include the ability to orientate | Text | Yes / No
Orientation_value | Type of orientation implemented | Text | Early / Late
Growth | Did the model include the ability to orientate | Text | Yes / No
Growth_func | The type of growth function applied | Text | Constant / Temperature

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Sensory_ability	| Does the model give the particles the ability to sense a settlement site | Text | Yes / No
Sensory_impl	| How was the sensory ability implememtned | Text | Buffer / Cue
Sensory_extent | The extent of the sensory zone | Km | 

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Settlement_competency_window | Does the model include the concept of a settlement competency window | Text | Yes / No
Settlement_competency_type	| The type of settlement competency window | Text | Fixed / Variable
Settlement_competency_variable	| The variable that drives the settlement competency window | Text | 
Settlement_competency_type_start | The start of the window that the particle can settle | Days | 
Settlement_site_type | The type of habitat the particle was allowed to settle on | Text | 
Settlement_site_size | The size of the settlement site | Km^2 |

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Particles_spawned_at_individual_site | The number of particles spawned at an individual site | Number | 
Particles_spawned_range | The range of particles spawned | Number | **
Particles_spawned_super_individual | Was each particle a super-individual representing many particles | Text | Yes / No
Particles_spawned_period | The period the particles were released | Text | 
Particles_spawned_total | The total number of particles spawned | Number | 

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Replicated_run | Did the study use replication of model runs | Text | Yes / No 
Sensitivity_analysis | Did the study perform a sensitivity analysis | Text | Yes / No / Cited_previously

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Statistical_methods_used | What statistical methods were used for the analysis | Text |
Empirically_validated | Did the authors try to empirically validate the model | Text | Yes / No

#### Metrics (Need to explain what the fuck these are)

Variable Name | Variable | Units | Values
:----- | :---- | :----- | :-----
Dispersal_kernel | Did they publish a dispersal kernel | Text | Yes / No
Temporal_kernel | Did they publish a temporal kernel | Text | Yes / No
Accumulation_kernel | Did they publish an accumulation kernel | Text | Yes / No
Partial_summation | Did they publish a partial summation | Text | Yes / No
Minimum_arrival_time | | Text | Yes / No
Mean_distance | Did they publish the mean distance | Text | Yes / No
Median_distance | Did they publish the median distance | Text | Yes / No
Distance_travelled_mean | The mean distance travelled by the particles | Km | 
Distance_travelled_stdev | The standard deviation ofthe mean distance travelled by the particles | Km | 
Distance_travelled_median | The median distance travelled by the particles | Km | 
Direction_mean | The mean direction of the particles | Km | 
Depth_mean | The mean depth of the particles | Km | 
Distance_travelled_upper_quantile | The upper quantile of the distance travelled | Km | | 
Distance_travelled_max | The maximum distance travelled | Km | 
Distance_travelled_min | The minimum distance travelled | Text | Yes / No
Biophysical_matrix | The log inverse of the migration matrix | Text | Yes / No
Travel_time_mean | The mean travel time | Text | Yes / No
Isotropy | Ratio of inertia of the particle distribution | Percentage | (0-1)
Positive_area | Positive area measures the area occupied by particles and is calculated as the sum of area units containing ≥1 particle | Km^2 | 
Seeded_area | Positive area measured as a % of the total area | Percentage | (0-1)
Centre_of_mass | The position of the centre of mass is computed as the average geographical coordinates (longitude, latitude) of all particles | Text | Yes / No
Connectance | Total non-zero connections between release sites | Text | Yes / No
Proportion_sites_settled | The proportion of sites settled | Text | Yes / No
Connections_total | The total number of connections between release & settlement sites | Text | Yes / No
Connected_clusters_total | Did the study include the total number of connected clusters (clustered settlement sites) | Text | Yes / No
Connected_clusters_largest_size | Did the study include the largest size of the connected clusters (clustered settlement sites) | Text | Yes / No
Cross_shore_connectivity | Probability that a particle seeded offshore will settle in the littorial zone  | Text | Yes / No
Dispersion_index | Defined as the sum of of products of the number of particles in each grid cell, multiplied by the straight line distance from the release site and noemalised by the total number of particles released | Text | Yes / No
Connectivity_matrix_potential | Was the potential connectvitiy matrix published in the study, where the potential connectiity matrix defines the probability of connectivity between sites | Text | Yes / No
Connectivity_matrix_realised | Was the realised connectvitiy matrix published in the study, where the realised connectiity matrix is the potential connectivity matrix, normalised by number of particles released | Text | Yes / No
Local_retention | Did the study include the metric of local retention | Text | Yes / No
Local_retention_mean | The mean local retention | Percentage | (0-1)
Local_retention_max | The max local retention | Percentage | (0-1)
Self_recruitment | Did the study include the metric of self-recruitment | Text | Yes / No
Self_recruitment_mean | The mean self recruitment | Percentage | (0-1)
Self_recruitment_max | The max self recruitment | Percentage | (0-1)
Settlement_success | Did the study include the metric of settlement success (Also known as transport success) | Text | Yes / No
Settlement_success_mean | The mean settlement success rate | Percentage | (0-1)
Directional_exchange_rate | If there is a latitude or longitude relationship to the release sites, a directional exchange rate can be calculated e.g. northward or southward  | Text | Yes / No
Export_probability | The proportion of larvae spawned from a site that successfully settle | Text | Yes / No
Source_sink_indicies | Did the study include source-sink indicies (metapopulation metrics) | Text | Yes / No
Graph_theory | Did the study use graph theory to measure metrics of connectivity | Text | Yes / No