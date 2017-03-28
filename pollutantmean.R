pollutantmean <- function(directory, pollutant, id = 1:332){
  data.Read <- data.frame()
  for(i in id){
    if (nchar(i)==1) {
      fileName <- paste("00", i , ".csv", sep = "")
    } else if (nchar(i)==2){
      fileName <- paste("0", i , ".csv", sep = "")
    } else {
      fileName <- paste(i , ".csv", sep = "")
    }
    filePath <- paste(directory,"\\",fileName,sep="")
    data.pollutant <- read.csv(file = filePath,
                               header=TRUE,
                               stringsAsFactors = FALSE)
    
    data.Read <- rbind(data.Read,data.pollutant)
    
  }
  return(mean(data.Read[,pollutant],na.rm = TRUE))
}