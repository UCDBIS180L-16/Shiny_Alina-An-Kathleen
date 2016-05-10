
# 5/5/2016 started
# need to upload rice data

# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(reshape2)

shinyServer(function(input, output) {
  
  output$scatterplot <- renderPlot({ 
    
    rice <- read.csv("data.pheno.mds.csv")
    
    riceID <- subset(rice, popID == input$population)
    
    p2 <- ggplot(riceID,aes(x = Protein.content,y = Amylose.content, colour=Region))
    p2 + geom_point() + scale_colour_hue(l=80, c=150)
    
    })
  
  output$violinPlot <- renderPlot({
    rice <- read.csv("data.pheno.mds.csv")
    rice$popID <- as.character(rice$popID)
    
    pl <- ggplot(data = rice,aes_string(x = input$grouping, y = input$trait, fill = input$grouping))
    pl + geom_violin() })

                                      })


