---
layout: class
week: 8
title: Facing The Abyss
---

<img src="face.jpg">

##How to Probe Unknown Data
So you have your shiny new R skills and you’ve successfully loaded a cool dataframe into R... Now what?

The best charts come from understanding your data, asking good questions from it, and displaying the answers to those questions as clearly as possible.

- What month was X highest or lowest?
- How has field Z changed since policy X was implemented?
- What's the relationship between X and Y?
- What does the distribution of one column of data tell us?

Here's a basic checklist to get more familiar with any data set.

We'll go over this checklist with a [test data set](schools.tsv) from a table about the Chicago teachers' union strike, but you can follow along on your own data set too, if you like.


1. Set your working directory.

  ```r
  setwd("~/path-to-your-folder")
  ```

1. Get your data loaded into R and make sure there are no factors.

  ```r
  # csv
  data <- read.csv("path-to-file", stringsAsFactors=F)

  # tsv or txt
  data <- read.delim("path-to-file", stringsAsFactors=F)

  # excel file
  library(gdata)
  data <- read.xls("path-to-file", stringsAsFactors=F)
  ```
3. Know how many rows and columns you have. Know what each column is and what each row represents.

  ```r
  dim(data)
  names(data)
  ```

1. Make sure all your columns are the correct data type (nums, strings, factors, dates)
  [Changing data types in R](http://shancarter.github.io/data-field-guide/2000/01/01/r-transforms-data-types.html)

2. If you have dirty data, clean it and put the results in new columns. (We did this with the [Chicago guns exercise](https://gist.github.com/kpq/7034291) and have examples in the [Data field guide](http://shancarter.github.io/data-field-guide/index.html) )

2. View some summary stats on your number columns (min, max, mean)

  ```r
  summary(data)

  summary(data$column)

  table(data$column)
  ```
  More detail [here](http://shancarter.github.io/data-field-guide/2000/01/01/r-transforms-summary-stats-on-vectors.html)

3. Chart histograms of your numeric columns (distributions)

  ```r
  hist(data$column_name)
  ```

4. Chart histograms of your categorical columns (gender, color, etc..)

  ```r
  plot(table(data$column), type="h")
  ```

5. If you have any time-sensitive data, plot your quantitative data against it to see if there's any relationship.

6. Plot a time series, but aggregated up to a different time frame (days to months, months to years)

7. Look for correlations and outliers

  ```r
  #plots all the combinations of all your columns
  pairs(data)

  #If you want to plot just one of the combinations for more detail
  plot(data$column1, data$column2)
  ```

8. Look for outliers in these plots.


