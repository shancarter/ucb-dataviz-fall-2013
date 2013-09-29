---
layout: lecture
title: How to Transform Data
---

##Filtering
Return a new dataset that has only the elements that match given criteria.
#### R
```r
filtered_data <- subset(data, year > 2000)
```
#### Javascript
```javascript
var filteredData = data.filter(function(d) { return d.year > 2000; });
```

##Sorting
#### R
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

```

#### Javascript
```javascript

```

##Aggregation
#### R
```r
aggregate
```

#### Javascript
```javascript
d3.nest()
```