## df is the dataframe of all data from the data file
## df2 is the subset of data that is of interest
df <- read.table("./household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
df2 <- subset(df,(Date == "1/2/2007" | Date == "2/2/2007"))

## plot to the png device with size 480x480 as required
png(filename = "./plot3.png",width = 480, height = 480)

datetime <- strptime(paste(df2$Date,df2$Time),"%d/%m/%Y %H:%M:%S")

plot(datetime,df2$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type ="l",col="black")

## add two more lines
lines(datetime,df2$Sub_metering_2,type ="l",col="red")
lines(datetime,df2$Sub_metering_3,type ="l",col="blue")

## add legend
legend("topright", lty=c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()
