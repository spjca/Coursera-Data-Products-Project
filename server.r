# Data Products Project Server 
# K Means Clusters of mtcars data
# Sean Jackson

# load shiny
library(shiny)

shinyServer(function(input, output, session) {
  
  # use reactive function to create for dynamic data frame
  # of user selected variables
  selectedData <- reactive({
    # from the columns of the mtcars data set
    mtcars[, c(input$xcol, input$ycol)]
  })
  
  # use reactive function to dynamically apply kmeans analysis
  # on user selected columns and number of clusters
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  # dynamically plot output of kmeans analysis using renderPlot
  output$plot.output <- renderPlot({
    # set dimensions for output
    par(mar = c(5.1, 4.1, 0, 1))
    # plot clusters using inputs
    plot(selectedData(),
         # define color based on cluster
         col = clusters()$cluster,
         # define filled circles symbol
         pch = 20, 
         # define size of circles
         cex = 2.5)
    # plot center of each cluster
    points(clusters()$centers, 
           # define x symbol
           pch = 4, 
           # define size of x
           cex = 3, 
           # define line width (required)
           lwd = 2)
  })
  
})