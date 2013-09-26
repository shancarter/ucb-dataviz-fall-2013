---
layout: class
week: 4
title: Intro to Mapping
---

##Housekeeping

• Are you a member of the [class Google Group](https://groups.google.com/forum/#!forum/ucb-datavis-2013)? Are you sure? **Are you really sure?**

* Are you on our github [class roster](https://github.com/shancarter/ucb-dataviz-fall-2013/wiki/Roster) page?

• Check out the [gallery of line charts](bar-chart-gallery.html) from your assignments. You should all have gotten feedback on both assignments by now.

• Common mistakes/helpful tips:

  - Dynamically calculating averages (or establishing any hierarchy in a data set) in Javascript can be much easier with D3.nest(). There are some examples of this [here](http://bl.ocks.org/phoebebright/raw/3176159/), but you should check out Shan's wonderful [Mister Nester](bl.ocks.org/shancarter/raw/4748131) as a guide.


• Office hours at 6:30 this weekend

• Two new wikis: first, a [wiki](https://github.com/shancarter/ucb-dataviz-fall-2013/wiki/Things-We-Don't-Get) where you can ask any questions you might have about D3, data, or anything. (Like "what is a data join" or "how do I make a table in D3" or "can I subset by multiple values in R?"). And another one for the [schedule for critiques](https://github.com/shancarter/ucb-dataviz-fall-2013/wiki/Class-presentation-schedule).

##Critique
Julie and Jess will be discussing [these charts of unisex names](http://flowingdata.com/2013/09/25/the-most-unisex-names-in-us-history/). For fun, let's also discuss [a similar set of charts](http://www.nytimes.com/imagepages/2009/05/17/weekinreview/20090517_NAME_GRFK.html) from the NYT.

##Lecture
We'll be [looking at a variety of maps](maps-lecture-2013.pdf) originally compiled by Amanda Cox.

##Lab Part 1

Say you're a reporter at [California Watch](http://californiawatch.org/) and the California Department of Finance releases [a new report](http://www.dof.ca.gov/research/demographic/reports/projections/) estimating demographic levels by county through 2060. They do have a press release, but it really only says that Hispanics will be the majority in California by 2060, but you want to dig deeper. You add in some historical Census data and get [this txt file](merged-multirace.txt).

What questions might you want to ask this data?

1. As we've done before, we'll start by making make a local repo with an empty index.html file and an R file. Call your repo "maps-intro" and your R file `California.R`. Save the data above, `merged-multirace.txt` to this folder.

2. Set your working directory like we've done in previous classes and load the data.

  ```r
  data <- read.delim("merged-multirace.txt")
  ```

  What basic information do we always find out about a dataset when we load it?

3. Find out which counties have the highest and lowest proportions of each race in 2020. (There are many ways to do this – either sort or filter.)

4. Make a chart that shows the percentage of Asains in San Francisco county from 1980 to 2020. First, get a data frame for just San Francisco county.

  ```r
  sf <- subset(data, county == "San Francisco")
  ```

  Take a look af `sf`. What fields do we want to plot?

5. Now make your plot.

  ```r
  plot(sf$year, sf$pcthispanic, type="l", ylim=c(0,max(data$pcthispanic)), main="Hispanics in San Francisco County")
  ```

  What's wrong with our chart, and why?

  <img src="hispanics-sf.png">

6. Sort your data and replot.

  ```r
  sf <- sf[order(sf$year), ]
  plot(sf$year, sf$pcthispanic, type="l", ylim=c(0,max(data$pcthispanic)), main="Hispanics in San Francisco County")
  ```
  <img src="hispanics-sf-2.png">

7. That's good, but what doesn't it tell us about the actual number of Asian people living in San Francisco county over time? Make a new field in your data called ```hispanic_pop```

  ```r
  data$hispanic_pop <- data$totalpop * data$pcthispanic
  ```

  Which county had the most and fewest Hispanics living in it in 2010?

8. Make similiar fields in your data for percent Asian, white and black. When you're done, `names(data)` shoud look something like this:

<img src="newdatahead.png">

9. In the past, we've said you need to be able to do only 4 things to be dangerous: filter, sort, aggregate and merge. We've done two of the four in the last two classes. Today we'll do the last two. First, let's get a data frame for the total percent of hispanics for the whole state.

  ```r
  ca_hispanic_pop <- aggregate(data$hispanic_pop, list(data$year), sum)
  names(ca_hispanic_pop)
  names(ca_hispanic_pop) <- c("year", "tot_hisp_pop")
  ```

  What does this data frame represent? Is it normalized? What would we need to normalize it?

10. Make a similar data frame with overall popstate totals for every year.

  ```r
  total_ca_pop <- aggregate(data$totalpop, list(data$year), sum)
  names(total_ca_pop)
  names(total_ca_pop) <- c("year", "tot_ca_pop")
  ```


9. Let's take a look at the code we did to make this chart:

  ```r
  sf <- susbet(data, county == "San Francisco")
  sf <- sf[order(sf$year),]

  plot(sf$pcthispanic, type="l", ylim=c(0,max(data$pcthispanic)) )
  ```

10. Now let's merge these two data frames. What field do they have in common?

  ```r
  state_totals <- merge(total_ca_pop, ca_hispanic_pop, by="year")
  head(state_totals)
  ```

  Now normalie and plot the percent of all hispanics in California.

  ```r
  state_totals$pcthispanic <- state_totals$tot_hisp_pop/state_totals$tot_ca_pop
  ```

  It might look like this:
  <img src="merge-1.png">

11. Now plot it:

  ```r
  plot(state_totals$year, state_totals$pcthispanic, main="Calif. pct Hispanic", ylim=c(0,max(data$pcthispanic)), type="l", col="red", lwd=2)
  ```

  <img src="calif-agg-chart.png">

12. Add our previous SF data to this:

  ```r
  plot(state_totals$year, state_totals$pcthispanic, main="Calif. pct Hispanic", ylim=c(0,max(data$pcthispanic)), type="l", col="red", lwd=2)
  lines(sf$year, sf$pcthispanic)
  ```

  <img src="lines-1.png">


13. A few slight changes to our code. Recognize the difference?

  ```r
  #selected county
  county_name <- "San Francisco"

  #filter
  this_county <- subset(data, county == county_name)

  #sort
  this_county <- this_county[order(this_county$year),]

  #initial plot command, with state totals in red
  plot(state_totals$year, state_totals$pcthispanic, main="Calif. pct Hispanic", ylim=c(0,max(data$pcthispanic)), type="l", col="red", lwd=2)

  #this county.
  lines(this_county$year, this_county$pcthispanic)

  ```

14. Let's generalize most of that into a function.

  ```r
  plot_lines_for_county <- function(county) {
      county_name <- county
      this_county <- subset(data, county == county_name)
      this_county <- this_county[order(this_county$year),]
      lines(this_county$year, this_county$pcthispanic)
  }
  ```

15. This seems like a lot of work, but it lets us now add lines to any plot.

  ```r
  plot(state_totals$year, state_totals$pcthispanic, main="Calif. pct Hispanic", ylim=c(0,max(data$pcthispanic)), type="l", col="red", lwd=2)
  plot_lines_for_county("Los Angeles")
  ```

  <img src="calif-la.png">

16. The point of all this is flexibility. Now we can plot all the lines, whether there are 50 or 50,000.

  ```r
  plot(state_totals$year, state_totals$pcthispanic, main="Calif. pct Hispanic", ylim=c(0,max(data$pcthispanic)), type="l", col="red", lwd=2)

  #all the counties
  for (i in unique(data$county)) {
    plot_lines_for_county(i)
  }
  ```
  <img src="full-dist.png">

17. Let's make a new function that factors in the total population of these lines rather than just percentages.

  ```r
  plot_weighted_lines_for_county <- function(county) {
      county_name <- county
      this_county <- subset(data, county == county_name)
      this_county <- this_county[order(this_county$year),]
      lines(this_county$year, this_county$pcthispanic, lwd= this_county$hispanic_pop/100000 )

      y2020 <- subset(this_county, year == 2020)
      text(y2020$year, y2020$pcthispanic, labels=y2020$county, adj=0, cex=.5)
  }
  ```

  Now do the same code as before but with the new function:

  ```r
  plot(state_totals$year, state_totals$pcthispanic, main="Calif. pct Hispanic with population sizing", ylim=c(0,max(data$pcthispanic)), type="l", col="red", lwd=2, xlim=c(1980, 2030))

  #all the counties
  for (i in unique(data$county)) {
    plot_weighted_lines_for_county(i)
  }
  ```

  <img src="weighted-lines-2.png">

  Is this a perfect sketch, no, it is not. But it communicates information about which counties have the most people living in them. Which chart would you choose simply depends on your audience. The Times published this one:

  <img src="nyt-hisp-chart.png">

##Lab Part 2

1. The lines help us find out which counties have which trends, but we don't have a very good idea of which counties are where. To visualize the spatial relationship, a map might be a good idea. (Even if we'll just throw it out later, it's usually good to at least check what the map looks like if we can.)

2. Install the R package "maptools" in your R console.

  ```r
  install.packages("maptools")
  library(maptools)
  ```

3. Download [this zip file](http://scec.usc.edu/internships/useit/content/california-counties-shapefiles) to your local repo. Make sure the folder is called "shapes" and the files are inside.

  Now load the shapefile using `readShapePoly`

  ```
  shapes <- readShapePoly("shapes/CaliforniaCounty.shp")
  ```

  Do the things we always do with data we load: find its class, field names, etc. It's a little trickier for these kinds of objects. Also try ```data.frame(shapes)``` and check out the data.

4. Make a map!

  ```r
  plot(shapes)
  ```
  <img src="ca-r-map-1.png">

5. Super awesome, but not very meaningful. Take a look at the data behind the map again with ```data.frame(shapes)```. What do the field names represent? Do we have anything in our data frame that might work as a match?

##Homework
