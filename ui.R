library(shiny)
library(ISLR)
Hitters<-na.omit(Hitters)
playersNames<-row.names(Hitters)
playersNames<-substr(playersNames, 2, nchar(playersNames))

shinyUI(fluidPage(

  # Application title
  titlePanel("Informations about baseball player"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label = h3("Choose a player"), 
                  choices = setNames(as.list(1:length(playersNames)), playersNames))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      dataTableOutput("namesPlayer")
    )
  )
))
