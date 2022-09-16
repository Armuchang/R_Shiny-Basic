#### BUILD A USER INTERFACE ####
ui.interface <- fluidPage(
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(
      h2("How to introduce yourself in Korean?"),
      p("We can talk about name, nationality and occupation to introduce ourselve.", 
        style = "font-family: 'times'; font-size: 1.5em;"),
      br(),
      strong("안녕하세요. 저는 아암입니다. 태국 사람입니다. 저는 과학자입니다.", 
             style = "font-family: 'times'; font-size: 1.5em;"),
      p("Hello. My name is Arm. I am come from Thailand. I am a scienctist.", 
        style = "font-family: 'times'; font-size: 1.5em"),
      br(),
      br(),
      p("There are 2 grammar keys", 
        span("~는/~은", style = "color:#457b9d; font-weight: bold; background-color:#edede9;"), 
        "and",
        span("~이다", style = "color:#b5838d; font-weight: bold; background-color:#edede9;"), 
        style = "font-family: 'times'; font-size: 1.5em;"),
      tags$img(src = "Sci.jpeg", height = 400, width = 400, 
               alt = "Sth went wrong!", 
               style = "vertical-align:middle;margin:0px 0px")
    )
  )
)

server.interface <- function(input, output){
  
}

## RUN THE APP TO PLOT HISTOGRAM
shinyApp(ui = ui.interface, server = server.interface)
