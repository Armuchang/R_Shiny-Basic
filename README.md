# R_Shiny-Basic
Step-by-step of fundamental Shiny concepts ✨🌟

# How to share your shiny apps?

**1. Share as an R script**

- Copy all files (app.R, helper.R, etc.) and folders (www folder for image files) to the working directory.
- Call Shiny package by using library(shiny) function.
- Run this command `runApp(“folder name”)` to show the app.
Note: The folder name is the folder collecting all involved files and folders.

**2. Share as a webpage**

- Shinyapps.io 
	- Install rsconnect package by using this command, `install.packages(“rsconnect”)`.
	- Call the library
	- Run the below code line to connect RStudio and your Shinyapps.io hosting service.
	
	`rsconnect::setAccountInfo(name = "armuchang", token = "TOKEN", secret = "SECRET")`
	
	- Deploy the web application by this below command.
	
	`rsconnect::deployApp("Nanme of Shiny App")`

Good luck 🍀🌈

Jantappapa Chanthercrob
