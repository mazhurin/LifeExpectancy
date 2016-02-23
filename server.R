library(shiny)

# Life expectancy calculator.

#http://apps.who.int/gho/data/node.main.688?lang=en

# load the data
x <- read.csv("data.csv", header = TRUE)

# factorize Country column
x$Country <- as.factor(x$Country)

calculate_expectancy <- function(country, year, sex) 
{
  if(! country %in% levels(x$Country))
    return (0)
  f <- x[x$Country == country,]
  if(length(f) <= 0)
    return (0.0)
  if (sex == 1)
    fit <- lm(Male~Year, data = f)
  else 
    fit <- lm(Female~Year, data = f)
  
  new <- data.frame(Year = year)
  return (predict(fit, newdata = new))
}

shinyServer(function(input, output) {

    expectancy <- reactive({
      calculate_expectancy(input$country, as.numeric(input$year), as.numeric(input$sex))
    })
    
    output$result <- renderText({ 
      paste(format(round(expectancy(), 1), nsmall = 1), " years." )
      #expectancy
    })
  
    output$resultYear <- renderText({ 
      paste(format(round(input$year + expectancy(),0), nsmall = 0))
    })
    
    output$resultLeft <- renderText({ 
      paste(format(round(input$year + expectancy() - as.numeric(format(Sys.Date(), "%Y")), 1), nsmall = 1),
            " years.")
    })
    
})