library(shiny)
library(ggplot2)

function(input, output) {
  loans <- getRatio("~/Downloads/PortfolioSummary.xls")
  dataset <- reactive({loans})
  output$plot <- renderPlot({
    
   renderedPlot <- ggplot(dataset(), aes_string(x = dataset()$Year, y = input$loan )) + geom_point() 
    
    print(renderedPlot) #prints the plot out
    
  }) 
  
  
  output$table <- renderTable({
    renderedTable <- loans
    print(renderedTable)
  })
}
