
library(shiny)
library(UsingR)

shinyServer(function(input, output) {
    model <- lm(child ~ parent, data = galton)
    Prediction <- reactive({
        parentheightInput <- input$sliderParentHeight
        predict(model, newdata = data.frame(parent = parentheightInput))
    })
    output$Plot <- renderPlot({
        parentheightInput <- input$sliderParentHeight
        
        plot(galton$parent, galton$child, xlab = "parent's height", 
             ylab = "child's height", bty = "n", pch = 16,
             xlim = c(50, 90), ylim = c(50, 90))
        abline(model, col = "red", lwd = 2)
    })
    output$Prediction <- renderText({
        Prediction()
    })

})
