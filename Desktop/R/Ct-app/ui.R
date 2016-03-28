library(shiny)
load("ct.RData")
load("money.RData")
load("settle.RData")

shinyUI(fluidPage(
  titlePanel("Titles"),
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      sliderInput("n", 
        label = "Range of interest:",
        min = 0, max = 1000000, value = c(0, 100))
    ),
    
    conditionalPanel("input.n >= 0",
      plotOutput("lossplot")
    )
  )
))