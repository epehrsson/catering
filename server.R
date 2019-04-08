#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to calculate cost
shinyServer(function(input, output) {
   
  output$cost <- renderText({
    
    # Define meal costs
    meal <- 50
    meal.child <- 15
  
    # Define drink cost
    soda <- 5
    alcohol = ifelse(input$drinks == 1,25,
                     ifelse(input$drinks == 2,20,
                            ifelse(input$drinks == 3,5,NA)))
    
    # Calculate cost given number of guests and drinks package
    cost = (input$num.Adult*(meal+alcohol)) + 
      (input$num.Teen*(meal+soda)) + 
      (input$num.Child*(meal.child+soda)) +
      (input$num.Baby*0)
    cost = paste("$",format(cost,big.mark=",",scientific=FALSE),sep="")
  })
  
})
