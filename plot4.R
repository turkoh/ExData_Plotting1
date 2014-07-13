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

# Write data to plot4.
# Begin graphic device - PNG file.
  png("plot4.png", height = 480, width = 480, bg = "transparent")
# Four multiple figures (mf) quadrants.
  par(mfrow = c(2, 2))

# Multiple figure 1 (mf).
# Write axis.
  plot(df$CombineDateTime, df$Global_active_power, pch = NA, xlab = " ", ylab = "Global Active Power")
# Write line.
  lines(df$CombineDateTime, df$Global_active_power)

# Multiple figure 2 (mf).
# Write axis.
  plot(df$CombineDateTime, df$Voltage, pch = NA, xlab = "datetime", ylab = "Voltage")
# Write line.
  lines(df$CombineDateTime, df$Voltage, lwd=0)

# Multiple figure 3 (mf).
# Write axis.
  plot(df$CombineDateTime, df$Sub_metering_1, pch = NA, xlab = " ", ylab = "Energy sub metering")
# Write line.
  lines(df$CombineDateTime, df$Sub_metering_1)
  lines(df$CombineDateTime, df$Sub_metering_2, col = "red")
  lines(df$CombineDateTime, df$Sub_metering_3, col = "blue")
# Write legend.
  legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1),
       col = c("black", "red", "blue"),
       bty = "n")

# Multiple figure 4 (mf).
# Write axis.
  plot(df$CombineDateTime, df$Global_reactive_power, pch = NA, xlab = "datetime", ylab = names(df)[4])
# Write line.
  lines(df$CombineDateTime, df$Global_reactive_power, lwd=0)

# Close graphic device - PNG file.
  dev.off()