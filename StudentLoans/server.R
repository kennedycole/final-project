#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)


shinyServer(function(input, output) {
  source("graphs/YearlyLoans.R")
  
  # Plot loan amount averages per year with line chart
  output$amountChart <- renderPlotly({
    graphLine(as.character(input$loan), "Dollars Outstanding (in billions)")
  })
  
  # Plot average number of recipients for loans per year with line chart
  output$recipientChart <- renderPlotly({
    graphLine(as.character(input$loan), "Recipients (in millions)")
  })
  
})

