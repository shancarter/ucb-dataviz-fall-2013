---
layout: default
title: You Asked, We Answered
---

<h1>You asked, we answered</h1>

##How do you "undo" in R?

A good question. The short answer is, you don't. Or, to put another way, when you are working in your R console or RStudio, the console does only what you ask. For example, if you say...

```r
# load data
data <- read.data("strikeouts.csv")

#only the yankees in 2004
data <- subset(data, team == "NYY" & year == 2013)

```
...you have **overwritten** `data`, and the only way to get it back is to re-run the code where you loaded `data`. (For simple things, you can just the up arrow a few times.)

You can do a couple things to make sure you don't get hosed by only working in your console:

• The first and most effective way is to work with a text editor (like [Sublime Text 2](http://www.sublimetext.com/2) and make a file called `strikeouts.R` ). This way, you can experiment and sketch in your console, but keep your working code (with comments!) in a separate place so you can go back to it later to learn or see what you did. That way, if things go south, you can just cut and paste from your text file.

• A second thing to do is try not to overwrite your data objects. So instead of what's written above, try:

```r
# load data
data <- read.data("strikeouts.csv")

#only the yankees in 2004
yankees2013 <- subset(data, team == "NYY" & year == 2013)
```