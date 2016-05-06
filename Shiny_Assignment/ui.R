
# 5/5/2016 started
# need to upload rice data

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Data"),
  
  # Some helpful information
  helpText("This application creates a scatterplot to show difference between",
           "rice species.  Please use the radio box below to choose two traits",
           "for plotting"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("grouping", #the input variable that the value will go into
                   "Choose a way to group the data:",
                   c("Region",
                     "popID")
    
                   
    )),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("violinPlot"))
    )
    )
    )
