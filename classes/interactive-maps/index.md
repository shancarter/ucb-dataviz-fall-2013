---
layout: class
week: 5
title: Interactive Maps
---

##Housekeeping

- Office hours this Sunday 4pm to 6pm.

- Please add more to the [things we don’t get wiki](https://github.com/shancarter/ucb-dataviz-fall-2013/wiki/Things-We-Don't-Get) if you're having problems with anything or there’s anything you want us to cover.

- Here’s a cool [free book](http://chimera.labs.oreilly.com/books/1230000000345/index.html).

##Critique

Diego will be discussing this [animated video of income inequality](http://youtu.be/QPKKQnijnsM).

##Your Big Project

[Let’s talk projects](http://shancarter.github.io/ucb-dataviz-fall-2013/projects/)

##Lab

- [Finished lab](http://shancarter.github.io/ucb-dataviz-fall-2013/classes/interactive-maps/final-map.html)

- [Lab with slider](http://shancarter.github.io/ucb-dataviz-fall-2013/classes/interactive-maps/slider-map.html)

This week we’ll be building a D3 version of last week’s map.

1. Go to your maps-intro project. We’ll be using the same project repo this week.

2. Create interactive-map.html

3. Add D3 to the page.

4. Create the [margin conventions](http://bl.ocks.org/mbostock/3019563)

  ```javascript
  var margin = {top: 20, right: 20, bottom: 20, left: 20};
      width = 750 - margin.left - margin.right,
      height = 700 - margin.top - margin.bottom;

  var svg = d3.select("body").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
  ```

5. Now, let’s load our dataset -- it should be called `merged-multirace.txt` -- and `console.log(data)` to see it in the chrome javascript console.

6. Next we need some geodata. Thankfully I’ve prepared some for you -- download this file to your project: [california counties topojson](ca-counties.json)

7. Let’s load it up... unfortunately we need use of [queue](https://github.com/mbostock/queue)

  ```javascript
  queue()
      .defer(d3.tsv, "merged-multirace.txt")
      .defer(d3.json, "ca-counties.json")
      .await(ready);

  function ready(error, data, ca) {
      //data is loaded and ready!
  }
  ```

8. I’ve prepared it in a [topojson](https://github.com/mbostock/topojson/wiki/API-Reference) format. In order to properly use it, we need to add support for topojson and then convert our data back into [GeoJSON](http://geojson.org/) so D3 can draw it.

  ```javascript
  var counties = topojson.feature(ca, ca.objects.counties);
  ```

9. Now that we’re loading up both files, let’s inspect the ca counties data.

10. First we need to add a [projection](https://github.com/mbostock/d3/wiki/Geo-Projections). Let’s start with mercator.

  ```javascript
  var projection = d3.geo.mercator();
  ```

11. Next, we need to create something that will generate our paths for us based on this projection.

  ```javascript
  var path = d3.geo.path()
      .projection(projection);
  ```

12. One more step and we’ll have a map. Let’s do a data join which will create one path for each county.

  ```javascript
  svg.selectAll(".county")
      .data(counties.features)
    .enter().append("path")
      .attr("class", "county")
      .attr("d", path);
  ```

13. That doesn’t look that great, let’s revisit the projection. First, something better for a state, like albers.

  ```javascript
    var projection = d3.geo.albers();
  ```

14. Let’s add these one at a time and see what they do.

  ```javascript
    .translate([width / 2, height / 2])
  ```

  ```javascript
    .parallels([34, 40.5])
  ```

  ```javascript
    .rotate([120, 0])
  ```

  ```javascript
    .scale(3000);
  ```

15. We can add a few styles

  ```css
  .county {
      fill: grey;
      stroke: black;
  }
  ```

16. What we really want though is to color it from the data. In order to do that we need to merge our datasets together.

17. Convert our data to numbers.

18. Filter to just 2020.

19. Merge on fips code

20. Now, log our data join...

21. Create a color scale

22. Fill by pcthispanic

