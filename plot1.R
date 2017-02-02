# Set to folder on local machine holding the code and 
setwd("C:/Users/Home/Documents/- Data Science/ExploratoryDataAnalysis/Week1/ExploratoryDataAnalysisWk1PeerProj")

source("LoadData.R")


ptm <- proc.time()

# LoadData(FALSE) - Data file is downloaded and unziped in memory ( unz() )
# LoadData(TRUE) - Data file need to be manually unziped in code directory (./)
df <- LoadData(FALSE)

# set graph file name and size
png("plot1.png", width = 400, height = 400)

# create Histogram plot
hist(
  df$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (in kilowatts)",
  ylab = "Frequrency"
)

print(sprintf("Total Time (elapsed time): %f", (proc.time() - ptm)[3]))

#close plot file
dev.off()
# Remove data frame once done
rm(df)