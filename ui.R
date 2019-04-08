#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that calculates the cost of wedding catering
# Given the number of guests of each age and the selected bar package
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Wedding catering cost calculation"),
  
  # Sidebar with number of guests, bar package 
  sidebarLayout(
    sidebarPanel(
      helpText("Select the number of guests in each age range:"),
      numericInput("num.Adult",
                   "Adults (21+)",
                   value = 0),
      numericInput("num.Teen",
                   "Teens (14-20)",
                   value = 0),
      numericInput("num.Child",
                   "Children (3-13)",
                   value = 0),
      numericInput("num.Baby",
                   "Infants (0-2)",
                   value = 0),
      helpText("Select the drinks package:"),
      radioButtons("drinks","Options",choices=list("Full bar ($25)"=1,
                                         "Beer and wine ($20)"=2,
                                         "No alcohol ($5)"=3)),
      submitButton()
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("Adults are charged for meal ($50) and alcohol. 
         Teens and children are charged a soda fee ($5),
         and children are charged a reduced meal price ($15). 
         Children under 3 are free."),
      h1("Total cost:"),
      textOutput("cost")
    )
  )
))
