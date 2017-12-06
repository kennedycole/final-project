#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(navbarPage('Student Loans', # Create a tab panel for you map
                   tabPanel('About'),
                   
                   tabPanel('Graph',# Create sidebar layout                            
                            sidebarLayout(# Side panel for controls                               
                              sidebarPanel(# Input to select variable to map                                 
                                #selectInput('dank', 'Loan', names(dataset), names(dataset)[[2]]), 
                                #selectInput('y', 'Recipient or Loan amount', names(dataset), names(dataset)[[1]])
                              ),
                              mainPanel(
                                plotOutput('plot')   #plots the data in the main panel                           
                                
                              )
                            )
                   ),
                   
                   # Display interactive data for average loan amounts and recipients
                   tabPanel('Amounts & Recipients',
                            h2("Changes in Loan Recipients and Amounts from 2013 to 2017"),
                            sidebarLayout(
                              sidebarPanel(
                                selectInput('loan', "Loan Type", 
                                            c("Direct", "Federal Family Education (FEEL)", "Perkins", "Total"))
                              ),
                              mainPanel(
                                plotlyOutput('amountChart'),
                                br(),
                                plotlyOutput('recipientChart')
                              )
                            ))
                   
))

