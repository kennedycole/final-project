library(shiny)
#source("FSAdata.R")
dataset <- getRatio("~/Downloads/PortfolioSummary.xls")


# Define UI for application that draws a histogram
shinyUI(navbarPage('Student Loan Data', # Create a tab panel for you map 
                   tabPanel('Graph',# Create sidebar layout                            
                            sidebarLayout(# Side panel for controls                               
                              sidebarPanel(# Input to select variable to map                                 
                                selectInput('loan', 'Loan Category', names(dataset), names(dataset))
                              #  selectInput('y', 'Recipient or Loan amount', names(dataset), names(dataset)[[1]])
                              ),
                              mainPanel(
                                plotOutput('plot')   #plots the data in the main panel                           
                              )
                            )
                   ),
                   tabPanel('Table of Data',
                            mainPanel(
                              tableOutput('table')
                            )
                   ),
                   tabPanel('About')
))