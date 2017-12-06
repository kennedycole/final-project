
graphLine <- function(loan, measure) {
  library(ggplot2)
  library(dplyr)
  
  source("data/FSAdata.R")
  
  # Calculate average loan data for each year and for every loan type
  FSAdata <- getData("data/PortfolioSummary.xls") %>% 
    group_by(federal.fiscal.year) %>% 
    summarise(quarters = n(), avg.direct.dollars = mean(`Direct.DollarsOutstanding(billions)`), 
              avg.direct.recipients = mean(`Direct.Recipients(millions)`),
              avg.FFEL.dollars = mean(`FFEL.DollarsOutstanding(billions)`),
              avg.FFEL.recipients = mean(`FFEL.Recipients(millions)`),
              avg.perkins.dollars = mean(`Perkins.DollarsOutstanding(billions)`),
              avg.perkins.recipients = mean(`Perkins.Recipients(millions)`))
  
  # Rename loan for use in graphing functions
  var.loan <- tolower(loan)
  var.measure <- tolower(measure)
  if (var.loan == "federal family education (ffel)") {
    var.loan <- "FFEL"
  }
  
  # Rename outstanding dollar amounts for use in graphing functions
  # Ensure correct axis titles are used for graph
  # Ensure correct color is used for line graph
  graph.title <- "Recipients"
  line.color <- "blue"
  if (var.measure == "dollars outstanding (in billions)") {
    var.measure <- "dollars"
    graph.title <- "Amounts"
    line.color <- "red"
  } else {
    var.measure <- "recipients"
  }
  
  # Create loan recipient/outstanding dollar variable name from loan type and measure inputs
  loan.data <- paste0("avg.", var.loan, ".", var.measure) 
  
  # Creates line graph of change in outstanding loan dollar amount over the years
  line.chart <- ggplot(data = FSAdata) +
    geom_point(aes(x = federal.fiscal.year, y = eval(as.name(loan.data))), color = line.color, size = 3) +
    geom_line(aes(x = federal.fiscal.year, y = eval(as.name(loan.data)), group = 1), color = line.color) +
    labs(title = paste(loan, "Loan", graph.title), x = "Federal Fiscal Year", y = paste("Average", measure)) +
    theme(title = element_text(size = 15), axis.text = element_text(size = 8), axis.title = element_text(size = 10,face = "bold"))
  
  return(line.chart)
}


