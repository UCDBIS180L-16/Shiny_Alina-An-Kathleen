
# 5/5/2016 started
# need to upload rice data

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page

  
  titlePanel("Rice Data"),
  
  
  helpText("This application creates a violin plot to show difference between",
           "rice species.  Please use the radio box below to choose two traits",
           "for plotting"),
  
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      
      selectInput("population", label = h3("Choose a population to display"), 
                  choices = list("Population 1" = 1, "Population 2" = 2, "Population 3" = 3, "Population 4" = 4), 
                  selected = "Population 1"),
      
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
    )
    )
