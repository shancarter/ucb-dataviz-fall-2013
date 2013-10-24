---
layout: class
week: 7
title: Finding Hidden Data, Sort Of
---

Today we'll be a little lower-key. We'll go over some

##Housekeeping

- An overview of in-class projects from last week's Chicago guns exercise

##Critique

Sam and Nausheen are discussing [a recent UGC map by the Washington Post](http://www.washingtonpost.com/wp-apps/your-own-words/shutdown-map/) (left over from week).

Chelsi is discussing [tktktk]().

##Project time
We'll start setting up the infrastructure for your projects. Everyone should end up with a new "project" repo with an a completed pitch that meets all the requirements, published to your github page.


##Hidden files
The inspector in Chrome is an extremely useful tool for all sorts of functions. Today we'll use it for help in three things: styling pages, finding "hidden" data Shan and Kevin give a tour of the Chrome Inspector to find data you didn't know was there. The inspector does much more than just let you experiment with CSS. It also lets you see every asset your web page is loading &mdash; even when you can't see it.

Last week, you got in touch with the press office of the [National Community Pharmacists Association](https://www.ncpanet.org/) to see if they could send you data for the locations of all 23,000 community pharmacies in the U.S. Their press office replied, saying they could not send her that data but would be willing to send her summary information.

Take a look at [their web site](https://www.ncpanet.org/index.php/find-your-local-pharmacy). Enter your favorite ZIP code and note the response.

Now open the Chrome inspector. Click the "Network" panel, refresh browswer and do the same search again. What happens? Take a look at the files and see if you can find anything that might resemble data.

Here's [the URL](http://www.fight4rx.org/map/getpharms3.php?address=55441) for Kevin's hometown (Plymouth, MN). Say you want to work with the data for just your town in Excel. Is this ready for cutting and pasting?

With some mild formatting in a text editor, [this site](http://www.danmandle.com/blog/json-to-csv-conversion-utility/ might help.

If you could tell a robot what to do to get all this data, what would it be?

##Other examples
Let's use the Inspector to...

- try to find some help reporting about [bicycle destinations](http://www.nytimes.com/newsgraphics/2013/06/07/bicycle-routes/#city=san-francisco) in San Francisco. (Goal: a list of people from the SF bay area who commented on this map. Bonus, how many times did they each comment?)

- learn about [adoption trends](http://adoption.state.gov/about_us/statistics.php) in the U.S. even when downloading the isn't obvious. (Goal: find a URL that gives you the number of adoptions to the United States by country of origin since 1999.)

- get a list of GIS coordinates for NYC's [citiBike stations](http://citibikenyc.com/stations)

##If there's time...
A tiny bit of scraping with R's magic XML package.




