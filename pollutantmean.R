pollutantmean <- function(directory, pollutant, id = 1:332){
  files_all <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  values <- numeric()
  for(i in id){
    data <- read.csv(files_all[i])
    values <- c(values, data[[pollutant]])
  }
  mean(values, na.rm = TRUE)
}