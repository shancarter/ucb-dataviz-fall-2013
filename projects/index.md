---
layout: class
week: 3
title: Class Projects
---
<style type="text/css">

dt {
  font-weight:bold;
}

dd {
  margin: 5px 0 20px 0;
  padding: 10px 0;
  font-size: 15px;
  line-height: 1.4em;
}

dd.example {
  margin:3px 0;
  padding:3px 0;
}

dd.example a {
  padding-right: 4px;
}

</style>


In general, we are flexible about the format of your projects, so we don't want to have too many official requirements. Our only real goal is that you make something publishable. Below, some loose characteristics of a successful project.

[Here’s the schedule](schedule.html)

- **The project is a work of original journalism.**
This is a requirement. It can be on a topic you're written about in the past, but it must contain original work and original findings. The purpose of your project should be journalistic, not technical.

- **The project is based baded on findings that result from data analysis and processing.**
  This might mean your conclusions came from data work done in Excel, like Vlookups, Pivot Tables, sorting and filtering. It might be based on a single data set or a handful of related data sets. But the lede of the project should be the answers to the questions you asked your data

- **The project should involve learning new skills that might not be covered in class.** This class is about learning a little bit about being fluent with data, structured information and the internet, but your projects will all take you down new paths. As such, you're bound to run into some technical obstacles that class might not prepare you for. Maybe you found a structured data source but need to scrape the data to do it. Or maybe you want to make a more complicated map than we've made in class, or work with a data file with 1 million records, or make a project that's optimized for a mobile phone or tablet. A good project will demonstrate to us that you know how to learn new skills as you face new problems

- **The project must be published to the internet. (Duh.)** Whether it's on your github page or a different site, your project must be publicly accessible. It should be a web page you coded and styled yourself (though you're encouraged to be inspired by other news pages you've seen before). You will write all the code yourself

###Examples of published NYT projects that could be (supercharged) class projects:

-[Money on the Bench](http://www.nytimes.com/interactive/2013/05/13/sports/baseball/money-on-the-bench.html) Forget the silly timer, the bar charts and the icons. A table that updates every day based that answers a (semi-) journalistically relevant would be totally doable.

-[Strikeouts on the Rise](http://www.nytimes.com/interactive/2013/03/29/sports/baseball/Strikeouts-Are-Still-Soaring.html) Your project could be a mix of analytical copy and charts. R charts would do just fine here if you didn't want to make them in a browser.


-This [medium-sized chart](http://www.nytimes.com/interactive/2012/04/15/us/politics/Access-in-Washington-Rises-With-Donation-Size.html?ref=politics) is basically the result of merging two data sets, some basic data cleaning and asking interesting questions. It made this [A1 NYT story](http://www.nytimes.com/2012/04/15/us/politics/white-house-doors-open-for-big-donors.html?pagewanted=all#p7#h7) much more comprehensible.


-[Lautenberg's Death Continues Sharp Decrease in Military Veterans in Senate](http://fivethirtyeight.blogs.nytimes.com/2013/06/03/with-lautenbergs-death-senate-lacks-a-world-war-ii-veteran) One of the most analytical popular blogs on the Internet has no fancy charts; instead, fact-based ledes and the data to back them up, sometimes accompanied by an Excel chart. Your project could be a more traditional mix of charts and prose, like this blog post.

-[Where 50,000 Guns Recovered in Chicago Came From](http://www.nytimes.com/interactive/2013/01/29/us/where-50000-guns-in-chicago-came-from.html)This could easily be a Google map or an R map instead of a Javascript one.

-[College Admissions Gap](http://www.nytimes.com/interactive/2013/05/07/education/college-admissions-gap.html) Take away the interactive chart and the 4-step walkthrough and this is just 4 answers to 4 data questions.

-[Seeking Flexibility During Storms](http://www.nytimes.com/interactive/2013/05/04/nyregion/seeking-flexibility-during-storms.html?ref=nyregion) This doesn't have to be just a map; your project could focus on interviews based off of analysis gotten from a map. (For, say, earthquakes instead of hurricanes.)


-[The fastest-gentrifying neighborhoods in the United States](http://www.edexcellence.net/commentary/education-gadfly-daily/flypaper/2012/the-fastest-gentrifying-neighborhoods-in-the-united-states.html) Here's another example where very simple data work might lead you somewhere interesting.


-[Capitol South, Station Domination, and Lobbying Effectiveness](http://www.mattglassman.com/?p=2482) Some of [The Godfather's] (http://www.twitter.com/amandacox) favorite data work is not hugely complicated.


##Other news organizations' work that might give you ideas
-[Pro Publica](http://www.propublica.org/tools)

-[NPR apps](http://blog.apps.npr.org)

-[LAT data desk](http://datadesk.latimes.com)

-[WNYC data news](http://datanews.tumblr.com)

-[NICAR stories](http://www.ire.org/resource-center/stories)

## Project schedule

By **noon on Wednesday, October 9**, we'd like you to post a link on your `dataviz-home` page to an HTML page with **three pitches** on it.

Each pitch should include:

• A summary of your proposal, which includes why your idea is newsworthy

• Links to potential data sources

• Links to potential human sources

• A list of things you would have to learn to complete the project.

• An example of a publication you could pitch your completed project to.

Here's an example of a couple pitches of projects we've worked on in class already. It doesn't need to be in exactly this format, but this is the general idea we're looking for. (Again, we're looking for three.)

**Project proposal example**

Last year, on average, Major League baseball teams struck out more than at any time in its 112 year history. This subject has been [written about before](http://bleacherreport.com/articles/1687201-why-the-single-season-hitter-strikeouts-record-will-be-the-next-to-fall-in-mlb), but no news organization has visualized the distribution or, to my satisfaction, offered a significant answer to why it has been rising so steadily, even in the post-steroids era. This could be published soon, with a focus on how teams currently in the playoffs have been affected, or it could be published at the beginning of next year, as a preview to the next season.

My project would be an interactive chart that shows the average strikeouts per year of every team in the Major Leagues for every year their franchise has been in existence. Ideally, this chart would be interactive, allowing readers to see the chart in the context of their favorite team. All the [historical data](http://www.baseball-reference.com/teams/MIN/2012.shtml) is available on [baseball-reference.com](http://www.baseball-reference.com).

I'd like to talk to a couple hitting coaches to see if they have recognized this difference and if they are telling their batters to hit differently than they did in the past. Chili Davis, the batting coach of the Oakland Athletics, would be ideal, but I've identified some minor league coaches as well.

I would probably need to learn how to scrape the data from baseball-reference, since I don't want to manually download 5000 web pages by hand, and I would also need to learn how to do more effective user interaction with a D3 chart than I do right now.

There are a number of stat-based sports sites that I could pitch this to, including the [Baseball Prospectus blog](http://www.baseballprospectus.com/blog/), [FanGraphs](http://www.fangraphs.com/blogs/) or more local sites, like the sports desks of the San Francisco Chronicle or the Oakland Tribune.


Email shavin with any questions.

<a href="#update-oct-15" id="update-oct-15">
###Update###
</a>

We've started a small timeline for project deadlnes and progress.

By **Tuesday, Oct. 22**, you should update your pitch page (or make a new one) with your final pitch for your project. Most of you will just edit one of your original pitches and incoporate our feedback from last week, but some of you may need to re-pitch a new idea or two.

Under your pitch, include the following:

• A news angle – why should people read your project?

• A list of human sources that might provide insight or background

• Links to relevant news articles or apps that have already been published that are related to your topic

• A list of possible publications that might be interested in publishing your project

• A list of questions you'd like to ask your data





