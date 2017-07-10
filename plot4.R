## Make sure files are downloaded and unzipped in working directory.
data <- read.table("household_power_consumption.txt", 
                   header = T, na.strings = "?", sep = ";")
## Subset out Feb. 1 and 2 of 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Paste Date and Time columns and convert.  Note: This is not used in plot1.png
    ## and may be commented out
data$timeanddate <- paste(data$Date,data$Time)
data$timeanddate <- strptime(data$timeanddate, "%d/%m/%Y %H:%M:%S")

## Create plot, filled by row
png("plot4.png")
par(mfrow = c(2,2), mar = c(3, 4, 1, 2), oma = c(0,0,3,0))
with(data, {plot(timeanddate, Global_active_power, 
                xlab = "",  
                ylab = "Global Active Power",
                type = "l")
            plot(timeanddate,Voltage, xlab = "",
                 ylab = "Voltage", type = "l")
            plot(timeanddate, Sub_metering_1, xlab = "",
                 ylab = "Energy sub metering", type = "l")
                      lines(timeanddate, Sub_metering_2, col = "red")
                      lines(timeanddate, Sub_metering_3, col = "blue")
                      legend("topright", lty=1, bty = "n",
                              col = c("black", "red", "blue"),
                              legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            plot(timeanddate, Global_reactive_power, xlab = "",
                 ylab = "Global Reactive Power", type = "l")
})
mtext("Plots of Electircal Usage on Feb. 1 and 2, 2007", outer = T)
dev.off() 
