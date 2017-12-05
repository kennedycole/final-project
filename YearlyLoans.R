library(ggplot2)
library(dplyr)

source("FSAdata.R")

# Calculate average loan data for each year and for every loan type
FSAdata <- getData("PortfolioSummary.xls") %>% 
  group_by(federal.fiscal.year) %>% 
  summarise(quarters = n(), avg.direct.dollars = mean(`Direct.DollarsOutstanding(billions)`), 
            avg.direct.recipients = mean(`Direct.Recipients(millions)`),
            avg.FEEL.dollars = mean(`FFEL.DollarsOutstanding(billions)`),
            avg.FEEL.recipients = mean(`FFEL.Recipients(millions)`),
            avg.perkins.dollars = mean(`Perkins.DollarsOutstanding(billions)`),
            avg.perkins.recipients = mean(`Perkins.Recipients(millions)`),
            avg.total.dollars = mean(`Total.DollarsOutstanding(billions)`),
            avg.total.recipients = mean(`Total.UnduplicatedRecipients(millions)`)) 

# Creates line graph of change in outstanding loan dollar amount over the years
ggplot(data = FSAdata) +
  geom_point(aes(x = federal.fiscal.year, y = avg.direct.dollars)) +
  geom_line(aes(x = federal.fiscal.year, y = avg.direct.dollars, group = 1))
 
