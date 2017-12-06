

library(shiny)
library(shinydashboard)
library(plotly)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(navbarPage(theme="bootstrap.css",
                   'Student Loans', # Create a tab panel for you map
                   tabPanel('About',
                            includeMarkdown("about.md")),
                   
                   # Display interactive data for average loan amounts and recipients
                   tabPanel('Loan Amounts & Recipients',
                            includeMarkdown("YearlyLoans.md"),
                            h2("Changes in Loan Recipients and Amounts from 2013 to 2017"),
                            sidebarLayout(
                              sidebarPanel(
                                selectInput('loan', "Loan Type", 
                                            c("Direct", "Federal Family Education (FFEL)", "Perkins"))
                              ),
                              mainPanel(
                                plotlyOutput('amountChart'),
                                br(),
                                plotlyOutput('recipientChart')
                              )
                            
                            )),
                   
                   # Display interactive bar chart for total average laon amounts and recipients
                   tabPanel('Total Averages',
                            includeMarkdown("BarGraph.md"),
                            h2("Total Average Amounts of Outstanding Dollars and Recipients of Loans"),
                            sidebarLayout(
                              sidebarPanel(
                                radioButtons('measure', "Measure by:", 
                                            c("Oustanding Dollars (in billions)", "Recipients (in millions)"))
                              ),
                              mainPanel(
                                plotlyOutput('totalBar'),
                                br(),
                                br(),
                                plotlyOutput('combinedBar')
                              )
                             
                              ))
                   
))

