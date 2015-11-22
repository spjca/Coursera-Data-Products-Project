# Data Products Project User Interface
# K Means Clusters of mtcars data
# Sean Jackson

library(shiny)

#define UI for app

#define components of sidebar
shinyUI(pageWithSidebar(
  #application title  
  headerPanel('Data Products Project: mtcars K Means Analysis'),
  #sidebar with 2 dropdowns and numeric counter
  sidebarPanel(
    # label and dropdown for x variable selection using
    # mtcars data column names
    selectInput('xcol', 'X Variable', names(mtcars)),
    # label and dropdown for y variable selection using
    # mtcars data column names
    selectInput('ycol', 'Y Variable', names(mtcars),
                #use second colum for starting position
                #so that chart has some order at runtime
                selected=names(mtcars)[[2]]),
    # label cluster count range input
    numericInput('clusters', 'Cluster count', 
                 #start at 3, range 1 to 9
                 5, min = 1, max = 9)
  ),
  # define main display
  mainPanel(
    # display server calculated plot.output
    plotOutput('plot.output')
  )
))