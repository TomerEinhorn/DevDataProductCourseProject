library(shiny)
shinyUI(fluidPage(
    titlePanel("Predicting child's hieght from parent's height"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderParentHeight",
                        "What is the father's height?",
                        min = 50,
                        max = 90,
                        value = 65)
        ),
        mainPanel(
            plotOutput("Plot"),
            h3("Predicted child's height from regression model"),
            textOutput("Prediction")
        )
    )
))
