setwd("~/personal/j221-fall-2013/classes/data-practice/")

# load the data
data <- read.delim("county-data.txt", header=F)
names(data) <- c("place_orig", "guns")

# make it a number
data$gunsNum <- as.numeric(gsub(",","",data$guns))


data$state <- sapply(strsplit(data$place_orig, "\\("), function (x) { x[2]})
data$state <- gsub(")", "", data$state)

data$county <- sapply(strsplit(data$place_orig, "\\("), function (x) { x[1]})
data$county <- gsub(")", "", data$county)