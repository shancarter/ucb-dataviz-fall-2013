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

#2010 only
data <- subset(data, year == 2010)

#match order of data and shapes fields
match_order <- match(map_data$FIPS,data$FIPS)

#add this field to map_data
map_data$pctHispanic2010 <- data$pcthispanic[match_order]

#these can be changed...picked manually depending on our distribution
map_breaks <- c(0, .1, .2, .3, .4, 1)

#assign the data to one of these buckets
buckets <- cut(map_data$pctHispanic2010,breaks=map_breaks)
numeric_buckets <- as.numeric(buckets)

#a vector of 5 colors.
colors <- brewer.pal(5,"YlOrRd")

#plot
plot(shapes, col=colors[numeric_buckets])


