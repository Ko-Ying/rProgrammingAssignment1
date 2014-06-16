pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  # Get a list of files in the directory
  filesList <- list.files(directory)
  
  # Get the subset of filenames specified by id
  selectedFiles <- filesList[id]
  
  
  # Initialize data
  data <- data.frame(Date=as.Date(character()),
                   File=character(), 
                   User=character(), 
                   stringsAsFactors=FALSE) 
  
  # Get the data from the files
  for (file in selectedFiles){
    
    #construct the filename 
    fileName <- paste(directory, "/", file, sep="")
    
    # Load the data from the file
    dataTemp <- read.csv(fileName)
    
    # Append the data to the end of the data frame
    data <- rbind(data, dataTemp)
    
    
  }
  
  # Get the data from the specified pollutant
  selectedPollutantData = subset(data, select = pollutant)
  
  # Take the mean
  dataMean <- mean(selectedPollutantData, na.rm=TRUE)
  
  
  return(dataMean)
}