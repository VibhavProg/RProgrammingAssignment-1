corr <- function(directory, threshold = 0){
  source("complete.R")
  allCases <- complete(directory)
  casesGreaterThanThreshold <- allCases[allCases$nobs > threshold, 1]
  files_all <- list.files(path = directory, full.names = TRUE)
  correlations <- rep(NA, length(casesGreaterThanThreshold))
  for(i in casesGreaterThanThreshold){
    data <- read.csv(files_all[i])
    allCases <- complete.cases(data)
    validSData <- data[allCases, 2]
    validNData <- data[allCases, 3]
    correlations[i] <- cor(x = validSData, y = validNData)
  }
  correlations <- correlations[complete.cases(correlations)]
}