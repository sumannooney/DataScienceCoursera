
corr <- function(directory, threshold=0){
  data.complete <- data.frame()
  return.data <- NULL
  j <- 1
  file.names <- dir(directory,pattern = ".csv")
  for(i in 1:length(file.names)){
    #print(paste(directory,"\\", file.names[i],sep=""))
    data.pollutant <- read.csv(file = paste(directory,"\\", file.names[i], sep=""),
                               header=TRUE,
                               stringsAsFactors = FALSE)
    
    
    if ((nrow(data.pollutant[complete.cases(data.pollutant),]))> threshold){
      data.pollutant <- data.pollutant[complete.cases(data.pollutant),]
      
      return.data[j]<- cor(x=data.pollutant$sulfate,y=data.pollutant$nitrate)
      #data.complete<- rbind(data.complete, cbind(file.names[i], cor(x=data.pollutant$sulfate,y=data.pollutant$nitrate)))
      j=j+1
    }
    
    #data.complete <- rbind(data.complete, cbind(i, sum(!is.na(data.pollutant))))
    
  }
  #names(data.complete)=c("id","nobs")
  return(return.data)
}