
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

library(reshape2)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  output$boxPlot <- renderPlot({
    iris.melt <- melt(iris, id = "Species")
    # iris.order <- iris.melt[order(iris.melt$Species), ]
    iris.grep <- subset(iris.melt, Species == input$species)
    # set up the plot
    pl <- ggplot(data = iris.grep,

                 aes_string(x="variable",
                            y="value",
                            fill="variable"
                 )
    )
    
    # draw the boxplot for the specified species
    pl + geom_boxplot()
  })
})

