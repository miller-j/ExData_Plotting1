library(readr)

LoadData <- function(fileMode) {
  
  ptm <- proc.time()
  
  if(fileMode)
  { 
    # local file file unZipped in code directory
    powerdata <-read_delim("./household_power_consumption.txt",delim = ";",
                           col_types = "ccddddddd",
                           na = c("", "NA","?"))#, n_max = 10)
  }
  else
  {
    # set data file path
    URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    temp <- tempfile()
    # download xlsx file to  "data" directory in Working directory, Using Binary mode to write the file
    download.file(URL, temp, mode="wb")
    
    #read file to a Dataframe
    powerdata <-read_delim(unz(temp,"household_power_consumption.txt"),delim = ";",
                           col_types = "ccddddddd",
                           na = c("", "NA","?"))#, n_max = 10)
    unlink(temp)
  }
  print(sprintf("Time to load file (elapsed time): %f", (proc.time() - ptm))[3])
  
  ptm <- proc.time()
  # Convert Date & Time strings to Date-Time string
  powerdata$Time <- strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S")
  powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
  
  # Filter to two days Feb, 1 & 2 of 2007
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  PowdataSet <- subset(powerdata, Date %in% dates)
  print(sprintf("Time to combine dates and times (elapsed time): %f", (proc.time() - ptm))[3])
  return (PowdataSet)
}
