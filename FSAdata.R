#setwd("/home/kennedy/Documents/UW/INFO\ 201/final-project")
#FSA.data <- read_excel("PortfolioSummary.xls")

getData <- function(file.xls) {
  FSA.data <- read_excel(file.xls)
  
  # read in neccesary libraries
  library(readxl)
  library(dplyr)
  library(stringr)
  library(tidyr)
  
  loan.types <- unname(unlist(FSA.data[4,]))
  loan.types <- loan.types[!is.na(loan.types)]
  loan.types <- gsub(" Loans", "", loan.types)
  loan.types[2] <- "FFEL" 
  loan.types[4] <- "Total"
  
  data.types <- unname(unlist(FSA.data[5,3:length(FSA.data)]))
  data.types <- gsub("in ", "", data.types)
  data.types <- gsub("\\s+", "", data.types)
  data.types[2] <- "Recipients(millions)"
  
  finance.data <- drop_na(FSA.data[6:nrow(FSA.data), 3:length(FSA.data)])
  colnames(finance.data) <- paste0(rep(loan.types, each = 2), ".", data.types)
  
  finance.data$federal.fiscal.year <- unname(unlist(FSA.data[6:30, 1]))
  years.subset <- finance.data$federal.fiscal.year[!is.na(finance.data$federal.fiscal.year)]
  years.subset <- years.subset[7:length(years.subset)]
  years.subset <- head(rep(years.subset, each = 4), -1)
  
  finance.data$federal.fiscal.year[7:nrow(finance.data)] <- years.subset
  
  return(finance.data)

}

