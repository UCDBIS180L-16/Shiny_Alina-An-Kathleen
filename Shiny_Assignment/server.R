
# 5/5/2016 started
# need to upload rice data

# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

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
    ricedata <- read.csv("data.pheno.mds.csv")
    # set up the plot
    pl <- ggplot(data = ricedata,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x = "V1", y = "V2", color = input$grouping
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_point()
  })
})


