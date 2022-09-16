#### LOAD R SCRIPT, PACKAGE, DATA TO USING IN R SHINY ####

#setwd("App_Example")
#percent_map(counties$white, "darkgreen", "% White")

library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")

ui <- fluidPage(
  titlePanel(title = "censusVis"),
  sidebarLayout(
    sidebarPanel(
      p("Create demographic maps with information from 2010 US Census"),
      selectInput(inputId = "select1", label = h4("Choose a variable to display"), 
                  choices = c("Percent White", "Percent Black", 
                              "Percent Hispanic", "Percent Asian"), 
                  selected = "Perent White"),
      sliderInput(inputId = "slider1", label = h4("Range of Interest:"), 
                  min = 0, max = 100, value = c(0, 100))
    ),
    mainPanel(
      plotOutput(outputId = "map")
    )
  )
)

server <- function(input, output){
  output$map <- renderPlot({
    data <- switch (input$select1,
                    "Percent White" = counties$white,
                    "Percent Black" = counties$black, 
                    "Percent Hispanic" = counties$hispanic,
                    "Percent Asian" = counties$asian
                    )
    color <- switch(input$select1,
                    "Percent White" = "darkblue",
                    "Percent Black" = "black", 
                    "Percent Hispanic" = "darkorange",
                    "Percent Asian" = "darkviolet"
                    )
    legend <- switch(input$select1,
                     "Percent White" = "% White",
                     "Percent Black" = "% black", 
                     "Percent Hispanic" = "% Hispanic",
                     "Percent Asian" = "% Asian"
                     )
    
    percent_map(var = data, color = color, 
                legend.title = legend, 
                min = input$slider1[1], 
                max = input$slider1[2])
  })
}

shinyApp(ui, server)