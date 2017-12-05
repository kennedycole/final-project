#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage('Student Loans', # Create a tab panel for you map 
                   tabPanel('Graph',# Create sidebar layout                            
                            sidebarLayout(# Side panel for controls                               
                              sidebarPanel(# Input to select variable to map                                 
                                selectInput('dank', 'Loan', names(dataset), names(dataset)[[2]]), 
                                selectInput('y', 'Recipient or Loan amount', names(dataset), names(dataset)[[1]])
                              ),
                              mainPanel(
                                plotOutput('plot')   #plots the data in the main panel                           
                                
                              )
                            )
                   ),
                   tabPanel('About')
))

