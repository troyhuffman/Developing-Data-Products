#
# This is a Shiny web application for Developing Data Products Course Project.
# The application requests user input (parent height) and predicts the child's 
# height. 


library(shiny)

# Define UI for Shiny web application
shinyUI(fluidPage(
    
    titlePanel("Predict a child's height"),
    
    # Sidebar with numeric inputs and a radio button
    sidebarLayout(
        sidebarPanel(
            helpText("Predict a child's height by using parent's height
               (in cm) and child's gender."),
            helpText("Input the required values below:"),
            numericInput(inputId = "inFh",
                         label = "Father' height (cm.):",
                         value = 175, # average height of fathers
                         min = 150,
                         max = 200,
                         step = 1),
            numericInput(inputId = "inMh",
                         label = "Mother's height (cm.):",
                         value = 162, # average height of mothers
                         min = 150,
                         max = 200,
                         step = 1),
            radioButtons(inputId = "inGen",
                         label = "Child's gender: ",
                         choices = c("Female"="female", "Male"="male"),
                         inline = TRUE)
        ),
        
        # Display values entered
        mainPanel(
            htmlOutput("parentsText"),
            htmlOutput("prediction"),
            plotOutput("barsPlot"),
            plotOutput("pairsPlot")
        )
    )
))