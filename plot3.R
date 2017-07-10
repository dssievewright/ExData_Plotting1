## Make sure files are downloaded and unzipped in working directory.
data <- read.table("household_power_consumption.txt", 
                   header = T, na.strings = "?", sep = ";")
## Subset out Feb. 1 and 2 of 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Paste Date and Time columns and convert.  Note: This is not used in plot1.png
    ## and may be commented out
data$timeanddate <- paste(data$Date,data$Time)
data$timeanddate <- strptime(data$timeanddate, "%d/%m/%Y %H:%M:%S")

## Create plot: Use par(new = T) to keep adding to first plot.
png("plot3.png")
with(data, plot(timeanddate, Sub_metering_1, 
                xlab = "",  
                ylab = "Energy sub metering",
                type = "l")
    )
with(data, lines(timeanddate, Sub_metering_2, col = "red"))
with(data, lines(timeanddate, Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"),
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
