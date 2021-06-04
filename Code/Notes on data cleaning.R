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
#7. map the species and color by density and reef type, shape for species ie 
#two shapes/site
#shape = species, size =density, color = reef type
#-- spit and map only one species at at time? 
#-- have two maps side by side?

### potential analyses we could do/ questions to ask
# does the removal of an invasive species affect the local species?
  #ANOVA looking at the difference in the two species densities on removal and 
#non removal site
# Is there a difference in species density and distribution by reef type or latitude? 
  # lm with density as response and "type/latitude" as the predictor


### draft code for joining csv files

library(tidyverse)
library(data.table)

## set you working directory to where the csv data are located on you comp
setwd("C:/Users/15879/Documents/Github/DirtyData-CleanMaps/Data")
##Read in the three data sheets, and look at the column names
#Site level metadata
site= read_csv("Site_metadata.csv")
names(site) #shows you the name of each column
str(site) #shows you the information about each column

setnames(site, "Site Length (m)", "Site_length_m")
setnames(site, "Site Width (m)", "Site_width_m")
names(site)


# make new column and calculate  site area
site$Site_area = site$Site_length_m * site$Site_width_m


#transect data
transect = read_csv("Transects.csv")
names(transect)

#fish counts
species = read_csv("Species.csv")
names(species)

#Join data table together using a left join. we want to to make our "left" table
# the one with the most data. for this it will be our species data set

full_transect = left_join(species, transect)
#something weird is going on because we have added rows to our new dataframe
# lets explore, the most common thing to happen would be duplicate rows
n_distinct(species$Transect_id)
n_distinct(transect$Transect_id)
#because the number that is returned is smaller that our original transect 
#dataframe it suggests we have exact duplicates, let remove them
transect = unique(transect)

full_data = left_join(full_transect, site)
names(full_data)

#aggregate data into abundances of each species per site (dplyr)
data_sum<-full_data %>%
  group_by(Site_name, Species) %>%
  tally()
full_summary = left_join(data_sum, site)

#rename your n column to Abundance
setnames(full_summary, "n", "Abundance")
names(full_summary)

# make new column and calculate density
full_summary$Density = full_summary$Abundance / full_summary$Site_area

<<<<<<< HEAD
=======

>>>>>>> 5364b3807ab1c703347b678fe10b25cad75b2435
