### Notes on data cleaning needed before we can create the map###
#1. import csvs, 3 total
#2. left merge the csvs together?
  # Species <- Transects <- Site_metadata
  # merge the transect info to the species using transect id
  # merge the site meta data using Site name
#3. amalgamate the the fish into abundance by species and and site, should
  # end up with two numbers per site for a total of 86 rows of data
#4. calculate the area of each site based on length and width
#5. calculate density of the two species for each site
#7. map the species and color by density and reef type, shape for species ie two shapes/site
#shape = species, size =density, color = reef type
#-- spit and map only one species at at time? 
#-- have two maps side by side?

### potential analyses we could do/ questions to ask
# does the removal of an invasive species affect the local species?
  #ANOVA looking at the difference in the two species densities on removal and non removal site
# Is there a difference in species density and distribution by reef type or latitude? 
  # lm with density as response and "type/latitude" as the predictor
# plot a time series based on session number? i dont think date is in a good format currently...
