corr <- function(directory, threshold = 0) {
  
  # Get the list of files
  filesList <- list.files(directory)
  
  # Create the vector to hold the result
  correlations <- numeric(0)
  
  # Loop through the files in the directory
  for (file in filesList){
    
    # Build the file name string
    fileName <- paste(directory, "/", file, sep="")
    
    # Load in the data from the file
    dataTemp <- read.csv(fileName)
    
    # Remove the NAs
    completeData <- na.omit(dataTemp)
    
    # Count the number of observations
    completeObservations = nrow(completeData)
    
    # If the complete observations are greater than the threshold
    # get the correlation between the pollutants and append to the vector
    if (completeObservations > threshold){
      
      correlations <- append(correlations, cor(completeData$sulfate, completeData$nitrate))
      
    }
    
  }
  
  return(correlations)
}