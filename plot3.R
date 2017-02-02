# Set to folder on local machine holding the code and 
setwd("C:/Users/Home/Documents/- Data Science/ExploratoryDataAnalysis/Week1/ExploratoryDataAnalysisWk1PeerProj")

source("LoadData.R")


ptm <- proc.time()

# LoadData(FALSE) - Data file is downloaded and unziped in memory ( unz() )
# LoadData(TRUE) - Data file need to be manually unziped in code directory (./)
df <- LoadData(FALSE)

# set graph file name and size
png("plot3.png", width = 400, height = 400)

# create multi line plot
# First line
plot(
  df$Time,
  df$Sub_metering_1,
  type = "l",
  ylab = "Energy sub metering",
  xlab = "",
  col = "black"
  )


# Second line
lines(
  df$Time,
  df$Sub_metering_2,
  type = "l",
  col = "red"
)

# Third line
lines(
   df$Time,
    df$Sub_metering_3,
    type = "l",
    col = "blue"
)

# Graph legend of variables
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       col = c("black","blue","red")
       )

print(sprintf("Total Time (elapsed time): %f", (proc.time() - ptm)[3]))

#close plot file
dev.off()
# Remove data frame once done
rm(df)