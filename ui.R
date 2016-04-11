library(shiny)

# has mainly stuff from a tutorial... needs lots of customization
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Add New Book"),
  
  # textInput line is mine...
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("caption", "Caption:", "Data Summary"),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))