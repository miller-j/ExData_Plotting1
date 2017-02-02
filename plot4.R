# Set to folder on local machine holding the code and 
setwd("C:/Users/Home/Documents/- Data Science/ExploratoryDataAnalysis/Week1/ExploratoryDataAnalysisWk1PeerProj")

source("LoadData.R")


ptm <- proc.time()

# LoadData(FALSE) - Data file is downloaded and unziped in memory ( unz() )
# LoadData(TRUE) - Data file need to be manually unziped in code directory (./)
df <- LoadData(FALSE)

# set graph file name and size
png("plot4.png", width = 400, height = 400)

# Create a multi-paneled plotting window (2 x 2) 
par(
  mfrow = c(2,2),
    mar =c( 5,4,2,2)
    )

# create line plot (from plot2.R) upper left (row 1, col 1)
plot(
  df$Time,
  df$Global_active_power,
  type = "l",
  ylab = "Global Active Power (in kilowatts)",
  xlab = ""
)


# Create line plot of voltage, upper right  (row 1, col 2)
plot(
  df$Time,
  df$Voltage,
  type = "l",
  ylab = "Voltage",
  xlab = "datetime"
)

# create multi line plot (from plot3.R) lower left (row 2, col 1)
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

# Graph legend of variables (Scale 80%)
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       cex=0.8,
       col = c("black","blue","red"),
       bty = "n"
)


# Create line plot of Global_reactive_power, lower right  (row 2, col 2)
plot(
  df$Time,
  df$Global_reactive_power,
  type = "l",
  ylab = "Global_reactive_power",
  xlab = "datetime"
)

print(sprintf("Total Time (elapsed time): %f", (proc.time() - ptm)[3]))

#close plot file
dev.off()
# Remove data frame once done
rm(df)