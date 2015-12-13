
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(ISLR)
library(shiny)
library(shinyapps)
library(caret)
shinyapps::setAccountInfo(name='hitterssalarycoursera',
                          token='93A65A3ECD1ADAF3593F91A9EC1F7F2C',
                          secret='djkaMS8PpbbXQmZzIR2tBkIULJ8oY0o1mY6JoHwk')

Hitters<-na.omit(Hitters)

shinyServer(function(input, output) {

  x <- reactive({
    as.numeric(input$select)
  })
  
  output$distPlot <- renderPlot({

    # draw the histogram with the specified number of bins
    hist(Hitters$Salary, col = 'darkgray', border = 'white')
    
    lines(c(Hitters[x(),]$Salary, Hitters[x(),]$Salary), c(0, 200),col="red",lwd=5)
    lines(c(median(Hitters$Salary), median(Hitters$Salary)), c(0, 200),col="green",lwd=5)

  })
  x <- reactive({
    as.numeric(input$select)
  })
  print(x)
  output$namesPlayer <- renderDataTable({  Hitters[x(),c(2,3,4,6,14,15,19)]  })
  

})
