## df is the dataframe of all data from the data file
## df2 is the subset of data that is of interest
df <- read.table("./household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
df2 <- subset(df,(Date == "1/2/2007" | Date == "2/2/2007"))

## plot to the png device with size 480x480 as required
png(filename = "./plot4.png",width = 480, height = 480)

## sets up a plot with 2 row 2 columns, sets the margin and outer margins
old.par <- par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

datetime <- strptime(paste(df2$Date,df2$Time),"%d/%m/%Y %H:%M:%S")

## plot (1,1)
plot(datetime, df2$Global_active_power, xlab = "",ylab = "Global Active Power",type ='l')

## plot (1,2)
plot(datetime, df2$Voltage, ylab = "Voltage",type ='l')

## plot (2,1)
plot(datetime, df2$Sub_metering_1, xlab = "",ylab = "Energy sub metering",type ="l")
lines(datetime,df2$Sub_metering_2,type ="l",col="red")
lines(datetime,df2$Sub_metering_3,type ="l",col="blue")
legend("topright", lty=c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## plot (2,2)
plot(datetime, df2$Global_reactive_power, ylab = "Global_reactive_power",type ='l')

## restore the old par
par(old.par)

dev.off()
