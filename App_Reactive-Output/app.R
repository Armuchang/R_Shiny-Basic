#### DISPLAY REACTIVE OUTPUT ####
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
      h4("Reactive outputs"),
      p(textOutput(outputId = "select.var")),
      p(textOutput(outputId = "slider.var"))
    )
  )
)
server <- function(input, output){
  output$select.var <- renderText({
    paste("You have selected this", input$select1, sep = " ")
  })
  output$slider.var <- renderText({
    paste("You have chosen a range from ", input$slider1[1], "to", 
          input$slider1[2], sep = " ")
  })
}

shinyApp(ui, server)