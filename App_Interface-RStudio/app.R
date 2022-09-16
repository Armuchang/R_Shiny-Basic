#### BUILD A USER INTERFACE: PRACTICE ####
ui.interface <- fluidPage(
  titlePanel(title = "My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      h2("Installation"), 
      p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
      code('install.packages("shiny")'),
      br(),
      br(),
      br(),
      img(src = "rstudio.png", height = 100, width = 300), 
      p("Shiny is product of ", span("RStudio", style = "color:blue"))
    ), 
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is a new package from RStudio that makes it", 
        em("incledibly easy"), "to build interactive web application ith R"), 
      br(),
      p("For an introduction and live examples, visit the", 
        a("Shiny homepage.", href = "https://shiny.rstudio.com/tutorial/#get-started")), 
      h2("Features"), 
      p("- Make useful web applications with only a few lines of code -",  
        strong("no JavaScript required."))
    )
  )
)

server.interface <- function(input, output){
  
}

## RUN THE APP TO PLOT HISTOGRAM
shinyApp(ui = ui.interface, server = server.interface)
