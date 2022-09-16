#### REACTIVE EXPRESSION ####
#install.packages("quantmod")
#setwd("App_Example")
library(quantmod)

source("helpers.R")

ui <- fluidPage(
  titlePanel(title = "stockVis"),
  sidebarLayout(
    sidebarPanel(
      p("Select a stock to examine. Information will be contrlled from YAHOO finance."), 
      textInput(inputId = "symb",label = "Symbol", value = "SPY"), 
      dateRangeInput(inputId = "dates", label = "Date range", 
                     start = "2021-09-15", end = Sys.Date()), 
      checkboxInput(inputId = "log", 
                    label = "Plot Y-axis on log scale", 
                    value = FALSE),
      checkboxInput(inputId = "adjust", 
                    label = "Adjust prices for inflation", 
                    value = FALSE)
    ), 
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

server <- function(input, output){
  data.input <- reactive({
    getSymbols(Symbols = input$symb, src = "yahoo", 
               from = input$dates[1], to = input$dates[2], 
               auto.assign = FALSE)
    })
  data.final <- reactive({
    if (input$adjust) {
      adjust(data.input())
    }else{
      data.input()
    }
  })
  
  output$plot <- renderPlot({
    chartSeries(x = data.final(), type = "line", theme = chartTheme("white"), 
                log.scale = input$log, TA = NULL, name = "Stock data")
    })
}

shinyApp(ui, server)