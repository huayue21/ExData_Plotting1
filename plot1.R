## df is the dataframe of all data from the data file
## df2 is the subset of data that is of interest
df <- read.table("./household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
df2 <- subset(df,(Date == "1/2/2007" | Date == "2/2/2007"))

## plot to the png device with size 480x480 as required
png(filename = "./plot1.png",width = 480, height = 480)

hist(df2$Global_active_power, 
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.off()
