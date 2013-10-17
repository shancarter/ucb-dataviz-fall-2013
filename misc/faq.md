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
##How do you “bring to front” in SVG?
</a>
SVG unfortunately doesn’t have any z-index property, so all elements are drawn according to thier order in the DOM — elements further down the DOM are drawn on top of earlier elements. Therefore, if you hover over an element that is higher up the dom it will still be obstructed by other, newer elements.

There are two ways to solve this problem:

1. [This stack overflow question](http://stackoverflow.com/questions/14167863/how-can-i-bring-a-circle-to-the-front-with-d3) answers the most common way. Basically it reorders the element in the DOM so that it is drawn on top (it does this by removing the element and adding it back into its parent as the newest child).

2. Another way is to draw two versions of all your elements — the unhovered states and the hovered states — with all the unhovered versions hidden by default. You then show the hover versions on rollover. For instance, if you had a county map CA map you’d actually draw all the country shapes twice, once with the fills in a g, then again with the hover colors in another g that was on top of that one. I used that approach [here](http://www.nytimes.com/interactive/2013/02/20/us/hispanics-californias-next-majority.html). If you inspect the elements, you'll see two versions of each county, one ".county-path" and one ".county-hover".

<a id="d3-data-format" href="#d3-data-format">
##How do I know which is the best format for my data in d3, i.e. whether to use a .csv,.tsv, json, etc.? Are there instances in which multiple formats can work?
</a>
There are a few answers here. Most importantly, it doesn't matter what data you use as long as you're comfortable with using it. In nearly every instance, any format can work to make almost any chart. If your data is "rectangular" (like an Excel spreadsheet), any format should work. Mike B. prefers .tsvs simply because they're very human-readable, but do whichever you like.

If the data is not rectangular, you might use json, but chances are it's already in that format anyway.

When you load any of these formats anyway, D3 turns them into the same kind of javascript objects, so it doesn't matter. We do sometimes mix and match depending on what's at hand, though.

```javascript

  queue()
      .defer(d3.json, "_assets/data/fourthsByGameId.json")
      .defer(d3.tsv, "_assets/data/team-lookup.tsv")
      .await(ready);

```

<a id="d3-data-format" href="#d3-data-format">
##What's the difference between d3.select and d3.selectAll? Are there examples of when to use them correctly?
</a>

Here is the [official document page](https://github.com/mbostock/d3/wiki/Selections#selecting-elements) for D3 selections.

Beyond that, the main difference is that `select` returns just the first matching selection and `selectAll` returns all matching selections. If you're going to be doing a data-join, `selectAll` is what you should use. If you just want to replace one thing, like change the value of an element on the page, you might want to use `select`: `d3.select(".favorite-animal").text("Blue whale")`

<a id="d3-line-path" href="#d3-line-path">
##I've seen both .append("path") and .append("line") used to make a simple line chart in d3, do they do the same thing?
</a>

`path` and `line` are two different SVG elements, the same way that `rect` and `circle` are different elements. Here's a good overview of [all of the shape elements in SVG](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Basic_Shapes) Basically, a `line` is used to draw a straight line between two points and nothing more. A `path` is used to draw a path or shape of any kind: curved, straight, triangle, zigzag, etc. Since a line chart is usually more than one straight line (they usually zigzag up and down) you should always be using ONE path element for the entire line. To draw a line chart with `line` elements, you would need to append a multiple `line` elements, one for each straight segment of your chart.
