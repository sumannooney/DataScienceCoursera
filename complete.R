
complete <- function(directory, id = 1:332){
  data.complete <- data.frame()
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
    
    data.complete <- rbind(data.complete, cbind(i, nrow(data.pollutant[complete.cases(data.pollutant),])))
    
  }
  names(data.complete)=c("id","nobs")
  return(data.complete)
}