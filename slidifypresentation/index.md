---
title       : Developing Data Products
subtitle    : K means clusters of mtcars data
author      : Sean Jackson
job         : Analyst
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Project Overview
The goal of the project is to create and deploy a shiny app as well as this associated slidify presentation. It is intended for the project to be as simple as possible so as to show proof of concept. The application uses k means clustering on a common data set and allows the user to adjust the measured inputs as well as number of clusters.

--- .class #id 

## Data Source
mtcars is the source data set for the analysis

This data was provided by motor trend magazine contains 11 variables for 32 vehicles


```r
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

--- .class #id

## ui.r
server.r is seperated into the main panel and sidebar components

The sidebar takes in the user defined inputs of the columns analyzed as well as the number of clusters to create

The main panel displays the plot returned from the server.r calculation based on the sidebar inputs

--- .class #id

## server.r
server.r takes in the user defined inputs from the sidebar, calculates the correct number of clusters as well as their center then returns a plot of the ouput to ui.r main panel

