library(shiny)
library(ggplot2)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  

  output$boxPlot <- renderPlot({
    
    iris.melt <- melt(iris, meas.var=c("Sepal.length", "Sepal.width", "Petal.Length", "Petal.Width"))
    sub.iris.melt <- subset(iris.melt, Species==input$Species)
    
    # set up the plot
    pl <- ggplot(data = sub.iris.melt,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x= "variable",
                            y="value",
                            fill="value"
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_boxplot()
  })
})
