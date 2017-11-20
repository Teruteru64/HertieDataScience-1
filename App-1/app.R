#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel("Hello World!"), # App title
  sidebarLayout(  # Sidebar layout with input and output definitions
    sidebarPanel( # Sidebar panel for inputs
      sliderInput(inputId = "bins", # Input: Slider for the number of bins
                  label = "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30)),
    mainPanel( # Main panel for displaying outputs
      plotOutput(outputId = "distPlot") # Output: Histogram
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  # Histogram of the Old Faithful Geyser Data ----
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "orange",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
}

shinyApp(ui = ui, server = server)
