---
layout: class
week: 7
title: Finding Hidden Data, Sort Of
---
We'll go over some project stuff, learn a little about scraping, and use the Chrome Inspector to find hidden data. The main thing to remember is this: *if you can see data in a structured way on the page, you can probably automate collecting it*. (That doesn't mean you should...it only means you can!)

##Housekeeping

An overview of in-class projects from last week's Chicago guns exercise:
  [Erik and Sean] (http://erikreyna.github.io/chicago/)
  [Jess, Angie, Chelsi](http://jessihamel.github.io/data-wild/)
  [Sam, Aaron, Samantha](http://scrolens.github.io/group_map/)
  [Julie, Diego, Stephen](http://diegoleonbarido.github.io/dataviz-home/)
  Mihir & Nausheen (?)
  Pearly & Tawanda (?)

Another plug for [this sweet tumblr](http://newsnerdfirsts.tumblr.com/).

##Critique

Sam and Nausheen are discussing [a recent UGC map by the Washington Post](http://www.washingtonpost.com/wp-apps/your-own-words/shutdown-map/) (left over from last week).

Chelsi is discussing [this map of girls' names](http://jezebel.com/map-sixty-years-of-the-most-popular-names-for-girls-s-1443501909). Related, let's check out this map from [the Economist](http://www.economist.com/blogs/dailychart/2011/01/comparing_us_states_countries).

##Scraping the web
The inspector in Chrome is an extremely useful tool for all sorts of functions. Today we'll use it for help in three things: styling pages, finding "hidden" data Shan and Kevin give a tour of the Chrome Inspector to find data you didn't know was there. The inspector does much more than just let you experiment with CSS. It also lets you see every asset your web page is loading &mdash; even when you can't see it.

There are tons of resources out there to automate data collection. Here's a handy tipsheet from [Scott Klein and Michelle Minkoff](https://github.com/kleinmatic/datashow). We'll use R's [XML package](http://cran.r-project.org/web/packages/XML/index.html) to fetch HTML tables and other kinds of things that are easily automated when we think like a robot.

Say you're a data editor for the New Yorker (or, better yet, you're trying to convince them that they need one) and you are helping a reporter report her story about [Russia's recent ban on U.S. adoptions](http://www.newyorker.com/online/blogs/newsdesk/2012/12/whats-behind-the-russian-adoption-ban.html). There is plenty of data on their [stats page](http://adoption.state.gov/about_us/statistics.php) but no place for you to download them all at once. You're **looking for data for all U.S. adoptions to any country for as many years as you can**.

Here's what we'll do

1. Use the inspector to find out where the data lives
2. Use R to download that table
3. Generalize the code ito a function to download the data for any country
4. Get a list of all countries in the database
5. Apply the function to get a data frame representing all the adoptions in the data base.

6. Visualize!

<!-- http://adoption.state.gov/maps/statistics/map_files/statistics.php?special=NONE&year=ALL&country=Burkina+Faso&state=NONE -->

##Project time
We'll start setting up the infrastructure for your projects and making sure your pitch is where it should be. Everyone should end up with a new "project" repo with an a completed pitch that meets all the requirements, published to your github page. If you're done, you can move on to the next exercise.

##Using the network panel...

• Say you got in touch with the press office of the [National Community Pharmacists Association](https://www.ncpanet.org/) to see if they could send you data for the locations of all 23,000 community pharmacies in the U.S. Their press office replied, saying they could not send her that data but would be willing to send her summary information.

Take a look at [their web site](https://www.ncpanet.org/index.php/find-your-local-pharmacy). Enter your favorite ZIP code and note the response.

Now open the Chrome inspector. Click the "Network" panel, refresh browswer and do the same search again. What happens? Take a look at the files and see if you can find anything that might resemble data.

Here's [the URL](http://www.fight4rx.org/map/getpharms3.php?address=55441) for Kevin's hometown (Plymouth, MN). Say you want to work with the data for just your town in Excel. Is this ready for cutting and pasting?

With some mild formatting in a text editor, [this site](http://www.danmandle.com/blog/json-to-csv-conversion-utility) might help.

If you could tell a robot what to do to get all this data, what would it be?

##Other examples
Let's use the Inspector to...

- find out if [Erik and Sean](http://erikreyna.github.io/chicago/) used the same data you did on their homework assignment.
- try to find some help reporting about [bicycle destinations](http://www.nytimes.com/newsgraphics/2013/06/07/bicycle-routes/#city=san-francisco) in San Francisco. (Goal: a list of people from the SF bay area who commented on this map. Bonus, how many times did they each comment?)
- get a list of GIS coordinates for NYC's [citiBike stations](http://citibikenyc.com/stations)




