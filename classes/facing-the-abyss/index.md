---
layout: class
week: 8
title: Facing The Abyss
---

<img src="face.jpg">

##How to Probe Unknown Data
So you have your shiny new R skills and you’ve successfully loaded a cool dataframe into R... Now what?

1. Make sure all your columns are the correct data type (nums, strings, factors, dates)
  [Changing data types in R](tktk)

2. View some summary stats on your number columns (min, max, mean)

  ```r
  summary(data)

  summary(data$column)

  table(data$column)
  ```

3. Chart histograms of your numeric columns (distributions)

4. Chart histograms of your categorical columns (gender, color, etc..)

  ```r
  plot(table(data$column), type="h")
  ```

5. Plot a time series of your date column

6. Plot a time series, but aggregated up to a different time frame (days to months, months to years)

7. Look for correlations and outliers

  ```r
  #plots all the combinations of all your columns
  pairs(data)

  #If you want to plot just one of the combinations for more detail
  plot(data$column1, data$column2)
  ```

8. Look for outliers

9. Most importantly, ask questions in plain English and try to answer them. WHat month was X highest or lowest? How has field Z changed since policy X was implemented? What's the relationship between X and Y? What does the distribution of one column of data tell us?
