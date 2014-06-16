complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  # Set the working directory to the folder containing the data
  #setwd(directory)
  
  # Get the list of files
  filesList <- list.files(directory)
  
  # Keep only the specified files
  selectedFiles <- filesList[id]
  
  # Create the data frame
  nobs <- data.frame(id = integer(0), nobs = integer(0))
  
  # Loop through the files
  for (file in selectedFiles){
    
    fileName <- paste(directory, "/", file, sep="")
    
    # Load in the data from the file
    dataTemp <- read.csv(fileName)
    
    # Remove the NAs
    completeData <- na.omit(dataTemp)
    
    # Count the number of observations
    completeObservations = nrow(completeData)
    
    tempFrame <- data.frame(id= completeData$ID[1],
                            nobs = completeObservations)
    
    # Append the data to the nobs frame
    nobs <- rbind(nobs, tempFrame)
    
    
  }
  
  return(nobs)

}