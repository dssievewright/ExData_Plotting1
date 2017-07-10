## Make sure files are downloaded and unzipped in working directory.
data <- read.table("household_power_consumption.txt", 
                   header = T, na.strings = "?", sep = ";")
## Subset out Feb. 1 and 2 of 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Paste Date and Time columns and convert.  Note: This is not used in plot1.png
    ## and may be commented out
data$timeanddate <- paste(data$Date,data$Time)
data$timeanddate <- strptime(data$timeanddate, "%d/%m/%Y %H:%M:%S")

png("plot1.png")
hist(data$Global_active_power, col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
