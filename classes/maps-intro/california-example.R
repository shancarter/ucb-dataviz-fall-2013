setwd("~/personal/j221-fall-2013/classes/maps-intro")

library(maptools)
library(RColorBrewer)

data <- read.delim("merged-multirace.txt")

#download the shape file
shapes <- readShapePoly("shapes/ca/counties.shp")

#a data frame of the map attribute data
map_data <- data.frame(shapes)

#string work to add a leading zero and make a new vector that matches map_data's fips code.
data$FIPS <- sprintf("%05d",data$fips)


plot_counties_for_decade_and_race <- function(decade, race_field_name) {

  # only data for this decade
  this_decade <- subset(data, year == decade)

  #match order of data and shapes fields
  match_order <- match(map_data$FIPS,this_decade$FIPS)

  # add this field to map_data
  # NOTE: this syntax is weird. yes. but it's the same as:
  # map_data$pcthispanic <- data$pcthispanic[match_order]
  map_data[,race_field_name] <- this_decade[,race_field_name][match_order]

  # breaks for colors. these are semi arbitrary, picked manually.
  map_breaks <- c(0, .1, .2, .3, .4, 1)

  # put our data into 5 groups
  buckets <- cut(map_data[,race_field_name], breaks = map_breaks)

  # make the groups numbers so they're less terrifying to look at.
  numeric_buckets <- as.numeric(buckets)

  #a vector of 5 colors. pick your own by typing display.brewer.all() in the R console.
  colors <- brewer.pal(5,"YlOrRd")

  #plot the map!
  plot(shapes, col=colors[numeric_buckets])

  # give it a title so we know what we're looking at.
  title(paste(race_field_name, decade))
}

#fields we want to plot
race_fields <- c("pctwhite", "pctblack", "pctasian", "pcthispanic" )

#this is puts all the plots on one screen
par(mfrow=c(4, 4), mar=c(1, 1, 1, 1))

for (i in race_fields) {
  for (j in c(1990, 2000, 2010, 2020)) {
    plot_counties_for_decade_and_race(j,i)
  }
}
