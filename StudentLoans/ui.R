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

ui <- dashboardPage(
  dashboardHeader(title = "Student Loan Data"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Loan_Amounts_Recipients", tabName = "Loan_Amounts_Recipients"),
      menuItem("second_app", tabName = "second_app")
    )
  ),
  dashboardBody(
    tabItems(
      # Display interactive data for average loan amounts and recipients
      tabItem(tabName = "Loan_Amounts_Recipients",
              h2("Changes in Loan Recipients and Amounts from 2013 to 2017"),
              sidebarLayout(
                sidebarPanel(
                  selectInput('loan', "Loan Type", 
                              c("Direct", "Federal Family Education (FEEL)", "Perkins", "Total"))
                ),
                mainPanel(
                  plotlyOutput('amountChart'),
                  plotlyOutput('recipientChart')
                )
              )
      ),
      # Display interactive data for ...
      tabItem(tabName = "second_app",
              h2("Second App Content"))
    )
  )
)

shinyUI(ui)
