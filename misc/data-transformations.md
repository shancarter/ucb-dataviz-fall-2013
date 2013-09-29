---
layout: lecture
title: How to Transform Data
---

##Filtering
Return a new dataset that has only the elements that match given criteria.
#### R
```r
filtered_data <- subset(data, year > 2000)

#can take many arguments
filtered_data <- subset(data, year <= 2000 & player_name == "Shavin")

# filter matching many conditions
upper_midest = subset(data, state_abb%in%c("Minnesota", "Wisconsin", "North Dakota", "South Dakota"))



```
#### Javascript
```javascript
var filteredData = data.filter(function(d) { return d.year > 2000; });
```

##Sorting
#### R
```r
#sort data frame on a field name – note ascending order by default.
data <- data[order(data$fieldname),]

#descending sort
data <- data[order(data$fieldname, descending=TRUE),]

```


#### Javascript
```javascript
//Simple alphabetical sort
data.sort();

//Easy way to reverse the sort order
data.sort().reverse();

//If you want to sort on a field
data.sort(function(a, b) {
  if (a.year > b.year) return 1;
  if (a.year < b.year) return -1;
  return 0;
});

//If you're sorting on numbers, you can use this shortcut
data.sort(function(a, b) { return a - b; });

//Same thing but with field names
data.sort(function(a, b) { return a.year - b.year; });

//Alphabetical sort by last then first name
data.sort(function(a, b){
  if (a.lastName < b.lastName) return -1;
  if (a.lastName > b.lastName) return 1;
  if (a.firstName < b.firstName) return -1;
  if (a.firstName > b.firstName) return 1;
  return 0;
});

```
<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort">More documentation</a> about Javascript sorting.

##Joining Two Datasets
#### R
```r

# field names must match for R to know what to join on
# note: this will DROP RECORDS that don't join; returns only successful joins
merged <- merge(dataframe1, dataframe2, by="field_name")

# to keep all the records in dataframe1 even if they dont join perfectly to dataframe2
merged <- merge(dataframe1, dataframe2, by="field_name", all.x = TRUE)

# to keep all the records in dataframe2 even if they dont join perfectly to dataframe1
merged <- merge(dataframe1, dataframe2, by="field_name", all.y = TRUE)





```

#### Javascript
```javascript

```

##Aggregation
#### R
```r
#to get, say, the total strikeouts per year (from our homework)
agg <- aggregate(data$strikeouts, list(data$year), sum)

#to get, say, the total strikeouts per team per year (from our homework)
agg <- aggregate(data$strikeouts, list(data$year, data$team), sum)

# the third argument takes any function (including a custom one)
# fewest strikeouts per team per game
agg <- aggregate(data$strikeouts, list(data$year, data$team), min)


```

#### Javascript (D3)
How you aggregate really depends on what you want. [Mister Nester](http://bl.ocks.org/shancarter/raw/4748131/) is useful for tinkering.

```javascript

d3.nest()
  .key(function(d) { return d.year; })
  .rollup(function(values) {
    return {
      totalStrikeouts: d3.sum(values, function(d) { return d.strikeouts })
    };
  })
  .entries(data);
```