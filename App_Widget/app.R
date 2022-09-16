#### ADD CONTROL WIDGETS ####
ui <- fluidPage(
  titlePanel(title = "censusVis"),
  sidebarLayout(
    sidebarPanel(
      p("Create demographic maps with information from 2010 US Census"),
      selectInput(inputId = "selet1", label = h4("Choose a variable to display"), 
                  choices = c("Percent White", "Percent Black", 
                              "Percent Hispanic", "Percent Asian"), 
                  selected = "Perent White"),
      sliderInput(inputId = "slider1", label = h4("Range of Interest:"), 
                  min = 0, max = 100, value = 100)
    ),
    mainPanel(
      h2("Shiny's widgets")
    )
  )
)

server <- function(input, output){
  
}

## RUN THE APP TO PLOT HISTOGRAM
shinyApp(ui = ui, server = server)
