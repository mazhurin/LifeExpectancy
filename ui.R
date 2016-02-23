library(shiny)

# Life expectancy calculator.

#http://apps.who.int/gho/data/node.main.688?lang=en

# load the data
x <- read.csv("data.csv", header = TRUE)

# factorize Country column
x$Country <- as.factor(x$Country)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Life expectancy calculator."),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    selectizeInput("country", label = h3("Select your country"), 
                choices = as.character(levels(x$Country)), selected = 33),
    
    sliderInput("year", 
                "Your were born in :", 
                min = 1960,
                max = 1999, 
                value = 1971),
    radioButtons("sex", label = h3("Your sex is:"),
                 choices = list("Male" = 1, 
                                "Female" = 2),selected = 2)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h3("Life expectancy is a statistical measure of how long an organism may live, based on the year of their birth, their current age and other demographic factors including sex."),
    h4("This Life expectancy calculator is base on the data published by World Health Organization"),
    h4("You can find the dataset ", a("here.", href="http://apps.who.int/gho/data/node.main.688?lang=en")),
    h4("The source code repository for this calculator is ", a("here.", href="https://github.com/mazhurin/LifeExpectancy")),
    
    h2("Your life expectancy is : "),
    div(h3(strong(textOutput("result"))), style = "color:red"),
    h2(" "),
    h2("The expected value of your last year is : "),
    div(h3(textOutput("resultYear")), style = "color:red"),
    h2(" "),
    h2("The expected value of years left : "),
    div(h3(textOutput("resultLeft")), style = "color:red")
  )
))