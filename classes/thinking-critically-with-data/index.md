---
layout: class
week: 3
title: Thinking Critically with Data
---
Moving forward.

##Lecture
[Sit back and enjoy](lecture.html).

##Lab
Say you're a sports reporter covering the Oakland Athletics and you heard one of your sources talk about a shift in the way the game is played. Your source, a batting coach, says he tells his hitters to swing aggressively no matter the pitch count – in the past, he had told them to be more defensive when they had two strikes, opting to put the ball in play rather than strike out. As a result, your source says, players are striking out much more than they used to: last year, the team struck out more than than any time in franchise history.

1. As a journalist who's literate with data, what might be a logical way to assess the veracity of this claim and provide insight on this trend to your readers? Where might you get data to prove or disprove this claim?

3. Start a new github repository in your "dataviz-home" folder called "line-chart". Download [this CSV file](strikeouts.csv), which has the strikeouts per team for every team in a franchise's history, into that folder. Also create a blank R file called ```strikeouts.R``` and an empty HTML file called ```index.html```. (We'll do this every class, so you should get used to it!)

  (By the way, the data comes from [baseball-reference.com](baseball-reference.com), one of the best sites on the internet for sports data. Sometimes you have to scrape it, but frequently it's available to download.)

4. Open ```strikeouts.R``` in a text editor of your choosing. You can either cut and paste between your text editor and RStudio or just code in RStudio, but do have a place for your working code somewhere.

5. In this [public Google Doc](https://docs.google.com/document/d/14i_1poexWXdKbmvXC3DF8-Ek3ZDHSA_t2Il3pnUpfVo/edit?usp=sharing), write down some questions we should ask our data.

6. Open RStudio or the R console, whichever you prefer. Load the data and check it out.

  ```r
  setwd("/~dataviz-home/line-chart")

  strikeouts <- read.csv("strikeouts.csv")

  head(strikeouts)

  ```

  What does our data look like? What do the rows represent? What do the fields represent?

7. We have fields for strikeouts and fields for games, but there have been varying season lengths throughout the year. How many different season lengths have there been? Here's some code that might be useful for this (and later):

  ```r
  unique(strikeouts$g)
  ```

  Why might there be so many different values?

8. Let's normalize this data by making a field called ```kpg```, for strikeouts per game.

  ```r
  strikeouts$kpg <- strikeouts$so / strikeouts$g
  ```

9. What is the max and min of this vector?

10. One of R's most useful methods is called ```subset```. Let's use it to return the whole row where there were the most strikeouts per game.

  ```r
  subset(strikeouts, kpg == max(strikeouts$kpg))
  ```

  When was it, and which team?

11. ```subset``` is one of R's most useful functions. Make a variable called ```oakland``` that just has the Athletics' strikeouts. Sort this by strikeouts per game, in descending order.

  ```r
  oakland <- subset(strikeouts, franchise == "OAK")
  ```

  Is the batting coach's claim true?

12. Let's spend some time answering questions from the Google doc.


###R

###D3