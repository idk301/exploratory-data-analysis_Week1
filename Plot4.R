###############
## Load Data ##
###############
setwd("/Users/danae/Desktop") 

HHP <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?",
                  colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')) #loads all data

HHP$Date1 <- as.Date(HHP$Date, format = "%d/%m/%Y") # convert to Y-M-D format
HHP$DateTime <- strptime(paste(HHP$Date, HHP$Time), format="%d/%m/%Y %H:%M:%S") # add in the date time items 

HHP2<- subset(HHP,Date1 >= as.Date("2007-02-01") & Date1 <= as.Date("2007-02-02")) # Filter for what you want
head(HHP2)

############
## Plot 4 ##
############

head(HHP2)
png(filename='plot4.png', width=480, height = 480, units = 'px')
par(mfrow = c(2,2))
plot(HHP2$DateTime, HHP2$Global_active_power,type="l", xlab="", ylab = "Global Active Power (kilowatts)")
plot(HHP2$DateTime, HHP2$Voltage,type="l", xlab="DateTime", ylab = "Voltage")
plot(HHP2$DateTime, HHP2$Sub_metering_1, type="l", ylim= c(0,40), xlab="", ylab = "Energy sub metering", col="black") 
lines(HHP2$DateTime, HHP2$Sub_metering_2, col="red")
lines(HHP2$DateTime, HHP2$Sub_metering_3, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'), lty=c(1, 1, 1))
plot(HHP2$DateTime, HHP2$Global_reactive_power,type="l", xlab="DateTime", ylab = "Global_reactive_power")
dev.off()

