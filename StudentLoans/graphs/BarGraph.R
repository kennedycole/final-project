graphBar <- function(measure) {
  library(ggplot2)
  library(dplyr)
  
  source("data/FSAdata.R")
  
  # Calculate average loan data for each year and for every loan type
  FSAdata <- getData("data/PortfolioSummary.xls") %>% 
    group_by(federal.fiscal.year) %>% 
    summarise(quarters = n(), avg.total.dollars = mean(`Total.DollarsOutstanding(billions)`),
              avg.total.recipients = mean(`Total.UnduplicatedRecipients(millions)`))
  

  graph.title <- "Outstanding Dollars"
  loan.data <- "avg.total.dollars"
  bar.color <- "red"
  if (measure == "Recipients (in millions)") {
    graph.title <- "Recipients"
    loan.data <- "avg.total.recipients"
    bar.color <- "blue"
  }
  
  
  # Creates bar graph of change in total outstanding loan dollar amount over the years
  line.bar <- ggplot(data = FSAdata, aes(x = federal.fiscal.year, y = eval(as.name(loan.data)))) +
    geom_bar(stat = "identity", fill = bar.color) +
    geom_line(aes(group = 1)) +
    labs(title = paste("Total Average", graph.title, "of Loan"), x = "Federal Fiscal Year", y = paste(graph.title, measure)) +
    theme(plot.title=element_text(family="Georgia"), plot.background = element_rect(fill = "transparent"),panel.background = element_rect(fill = "transparent"),title = element_text(size = 15), axis.text = element_text(size = 8), axis.title = element_text(size = 10,face = "bold"))
    
  return(line.bar)
}
