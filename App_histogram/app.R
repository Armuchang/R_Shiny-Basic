#### WELCOME TO SHINY ####

#### INSTALL INVOLVING PACKAGES ####
## INSTALL AND REQUIRE THE SHINY PACKAGE 
if (!("shiny" %in% installed.packages())){
  install.packages("shiny")
  require(shiny)
}else{
  require(shiny)
}

#### RUN AN EXAMPLE SHINY APP ####
#runExample("01_hello")

#### LEARN STRUCTURE OF A SHINY APP ####
## MAKE UI FOR HISTOGRAM PROGRAM
ui.example <- fluidPage(
  ## DEFINE NAME OF PANEL
  titlePanel("Hello Wolrd!"),
  ## SIDEBAR LAYOUT WITH SLIDER INPUT AND MAIN PANEL
  sidebarLayout(
    ## SLIDER INPUT WHIT ID NAMED Bins
    sidebarPanel(
      sliderInput(inputId = "Bins", label = "Number of bins:", 
                  min = 5, max = 50, value = 20)
      ), 
    ## MAIN PANEL WITH A HISTOGRAM PLOT
    mainPanel(
      plotOutput(outputId = "Histogram")
    )
  )
)

## MAKE LOGIC SERVER FOR PLOTTING A HISTOGRAM
server.example <- function(input, output){
  ## MAKE A PLOT
  output$Histogram <- renderPlot(
    {
      ## DEFINE INPUT AND OUTPUT DATA
      x <- faithful$waiting
      bins <- seq(min(x), max(x), length.out = input$Bins + 1)
      #bins <- input$Bins
      
      ## MAKE A HISTOGRAM PLOT WITH REQUIRED BIN
      hist(x, breaks = bins, col = "#75AADB", border = "orange",
           xlab = "Waiting time to next eruption (in mins)",
           main = "Histogram of waiting times")
    }
  )
}

## RUN THE APP TO PLOT HISTOGRAM
shinyApp(ui = ui.example, server = server.example)
