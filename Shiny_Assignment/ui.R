
# 5/5/2016 started
# need to upload rice data

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page

  
  titlePanel("Rice Data"),
  
  
  helpText("This application creates a scatter plot to show amylose content vs protein content for different populations of",
           "rice species.  Please use the pull down bar to select a population. This application also creates a violin plot",
           "to group data by Region or Population. Please use the radio boxes below to choose which trait to plot."),
  
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      
      selectInput("population", label = h3("Choose a population to display for amylose content vs protein content"), 
                  choices = list("Population 1" = 1, "Population 2" = 2, "Population 3" = 3, "Population 4" = 4), 
                  selected = "Population 1"), # default is Population 1
      
      radioButtons("grouping", #the input variable that the value will go into
                   "Choose a way to group the data:",
                   c("Region",
                     "popID")
      ),
      radioButtons("trait", #the input variable that the value will go into
                   "Choose a trait to investigate:",
                   c("Protein.content",
                     "Amylose.content")
      )
    ),  
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("violinPlot"), plotOutput("scatterplot"))
  )
))

###################################################
# url for shiny app:                              #
# https://austinan.shinyapps.io/Shiny_Assignment/ #
###################################################