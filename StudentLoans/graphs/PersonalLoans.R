graphSingleLoan <- function() {
  library(ggplot2)
  library(dplyr)
  
  source("data/FSAdata.R")
  
  # Calculate average loan data for each year and for every loan type
  FSAdata <- getData("data/PortfolioSummary.xls") %>% 
    group_by(federal.fiscal.year) %>% 
    summarise(quarters = n(), 
              avg.total.dollars = mean(`Total.DollarsOutstanding(billions)`) * 1000000000,
              avg.total.recipients = mean(`Total.UnduplicatedRecipients(millions)`) * 1000000)
  
  
  # Creates bar graph of change in total outstanding loan dollar amount over the years
  bar.loans <- ggplot(data = FSAdata, aes(x = federal.fiscal.year, y = avg.total.dollars / (avg.total.recipients))) +
    geom_bar(stat = "identity", fill = "mediumpurple4") +
    geom_line(aes(group = 1)) +
    labs(title = "Total Average Loan Dollar Amount Per Recipient", x = "Federal Fiscal Year", y = "Loan Dollar Amount (per person)") +
    theme(title = element_text(size = 15), axis.text = element_text(size = 8), axis.title = element_text(size = 10,face = "bold"))
  
  return(bar.loans)
}
