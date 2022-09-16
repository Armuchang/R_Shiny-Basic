# R_Shiny-Basic
Step-by-step of fundamental Shiny concepts ✨🌟

# How to share my shiny apps?

1. Share as an R script

- Copy all files (app.R, helper.R, etc.) and folders (www folder for image files) to the working directory.
- Call Shiny package by using library(shiny) function.
- Run this command – runApp(“folder name”). 
Note: The folder name is the folder collecting all involved files and folders.

2. Share as a webpage

- Shinyapps.io 
	- Install rsconnect package by using this command – install.packages(“rsconnect”)
	- Call the library
	- Connect RStudio and my Shinyapps.io.
	- Deploy web application to the io by rsconnect::deployApp(Nanme of Shiny App)
