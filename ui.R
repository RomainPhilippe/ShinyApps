library(shiny)
library(ISLR)
Hitters<-na.omit(Hitters)
playersNames<-row.names(Hitters)
playersNames<-substr(playersNames, 2, nchar(playersNames))

shinyUI(fluidPage(

  # Application title
  titlePanel("Informations about baseball players"),
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    
    sidebarPanel(
      p("This is an app that allows you to know the features about a player (see below):"),
      
      selectInput("select", label = h3("Choose a player"), 
                  choices = setNames(as.list(1:length(playersNames)), playersNames)),
      p("We emphasise the difference between the chosen player salary and the other"),
      p("We display an histogram with a red line (the chosen player), a green line ( the median of the salaries) and some informations")
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      dataTableOutput("namesPlayer")
    )
  )
))
