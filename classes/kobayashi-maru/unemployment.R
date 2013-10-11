setwd("~/personal/j221-fall-2013/classes/kobayashi-maru/")

library(gdata)

#I did loose formatting on this – deleted empty rows
data <- read.xls("ssamatab1-f.xls", stringsAsFactors=F)

# rename the fields, makes for easier typing and fewer mistakes.
names(data) <- c("code", "stfips", "areafips", "area", "year", "month", "labor_force", "employment", "unemployment", "rate" )

# get rid of the commas in the employment numbers fields
# also, turn it from a string to a number so we can do math on it.
data$labor_force <-   as.numeric(gsub(",", "", data$labor_force ))
data$employment <-    as.numeric(gsub(",", "", data$employment ))
data$unemployment <-  as.numeric(gsub(",", "", data$unemployment ))

#a true date field, assigning the value arbitrarily to the first of the month.
data$date <- paste(data$year, data$month, "1", sep="-")
data$date2 <- as.Date(data$date, format="%Y-%m-%d")

# just the city name, for labeling nicer. optional.
# this code says, split up each value in the vector into chunks where you see a comma,
# then give me the first chunk back.
data$city <- sapply(strsplit(data$area, split=","), function(x) { x[1] })

#just california
ca_cities <- subset(data, stfips == 6)

#this is a manual job.
coastal <- c("Salinas", "Vallejo-Fairfield", "Los Angeles-Long Beach-Santa Ana", "Oxnard-Thousand Oaks-Ventura", "San Diego-Carlsbad-San Marcos", "Santa Rosa-Petaluma", "San Francisco-Oakland-Fremont", "San Luis Obispo-Paso Robles", "Santa Barbara-Santa Maria-Goleta", "Napa", "San Jose-Sunnyvale-Santa Clara", "Santa Cruz-Watsonville")
inland <- c("Bakersfield-Delano", "Chico", "El Centro", "Fresno", "Hanford-Corcoran", "Madera-Chowchilla", "Merced", "Modesto", "Redding", "Riverside-San Bernardino-Ontario", "Sacramento--Arden-Arcade--Roseville", "Stockton", "Visalia-Porterville", "Yuba City")

# make a new vector called setting. then set it depending on whether it's coastal or inland.
ca_cities$setting <- NA
ca_cities$setting[ca_cities$city%in%coastal] <- "coastal"
ca_cities$setting[ca_cities$city%in%inland] <- "inland"

# average for california - two lines gets us what we need!
ca_avg <- aggregate(ca_cities[,c("unemployment", "labor_force", "employment")], list(date2=ca_cities$date2), sum)
ca_avg$rate <- 100 * ca_avg$unemployment / ca_avg$labor_force

#sort it just to make sure
ca_avg <- ca_avg[order(ca_avg$date),]

# make a function -- dont have to but it's cleaner to read.

plot_regional_rates <- function(region) {

  #just records from this setting (inland/coastal)
  this_region <- subset(ca_cities, setting == region)

  #plot the ca average
  plot(ca_avg$date, ca_avg$rate, type = "l", ylim = c(4, 30), col="red", lwd = 2, xlab="Date", ylab="Rate", main = region )

  #add lines for cities in this group
  for (i in unique(this_region$city)) {
    this_city <- subset(this_region, city == i )
    lines(this_city$date2, this_city$rate, col="lightgrey")
  }
}

#plot in a 2x1 grid
par(mfrow=c(1,2))
plot_regional_rates("inland")
plot_regional_rates("coastal")

