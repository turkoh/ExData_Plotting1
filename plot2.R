# Read and subset data to include Dates = 2007-02-01 - 2007-02-02.
# Combine Date plus Time and change date format to POSIXlt.
  df <- read.csv("household_power_consumption.txt", sep=";",na.strings="?")
  df <- subset(df, df$Date %in% c("1/2/2007","2/2/2007"))
  CombineDateTime <- strptime(paste(df[,1]," ",df[,2]),"%d/%m/%Y %H:%M:%S", tz = "")
  df <- data.frame(df,CombineDateTime=CombineDateTime)

# set variables from character to numeric.
  for (i in 3:9) {
    df[,i] <- as.numeric(df[,i])
  }

# Write data to plot2.
# Begin graphic device - PNG file.
  png("plot2.png", height = 480, width = 480, bg = "transparent")
# Write axis.
  plot(df$CombineDateTime, df$Global_active_power, pch = NA, xlab = " ", ylab = "Global Active Power (kilowatts)")
# Write line.
  lines(df$CombineDateTime, df$Global_active_power)
# Close graphic device - PNG file.
  dev.off()