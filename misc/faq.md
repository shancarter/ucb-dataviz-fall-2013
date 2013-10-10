---
layout: default
title: You Asked, We Answered
---
<img src="burning-questions.jpg">

These are questions from the class wiki about [things we don't get](https://github.com/shancarter/ucb-dataviz-fall-2013/wiki/Things-We-Don't-Get). The more you ask, the better this is.

<a id="undo-r" href="#undo-r">
##How do you "undo" in R?
</a>
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

<a id="bring-to-front" href="#bring-to-front">
##How do you bring elements to front in SVG when you hover over them so they aren’t hidden by other elements?
</a>
SVG unfortunately doesn’t have any z-index property, so all elements are drawn according to thier order in the DOM — elements further down the DOM are drawn on top of earlier elements. Therefore, if you hover over an element that is higher up the dom it will still be obstructed by other, newer elements.

There are two ways to solve this problem:

1. [This stack overflow question](http://stackoverflow.com/questions/14167863/how-can-i-bring-a-circle-to-the-front-with-d3) answers the most common way. Basically it reorders the element in the DOM so that it is drawn on top (it does this by removing the element and adding it back into its parent as the newest child).

2. Another way is to draw two versions of all your elements — the unhovered states and the hovered states — with all the unhovered versions hidden by default. You then show the hover versions on rollover. For instance, if you had a county map CA map you’d actually draw all the country shapes twice, once with the fills in a g, then again with the hover colors in another g that was on top of that one. I used that approach [here](http://www.nytimes.com/interactive/2013/02/20/us/hispanics-californias-next-majority.html). If you inspect the elements, you'll see two versions of each county, one ".county-path" and one ".county-hover".
