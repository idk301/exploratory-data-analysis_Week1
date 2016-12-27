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
## Plot 3 ##
############

head(HHP2)
summary(HHP2)


png(filename='plot3.png', width=480, height = 480, units = 'px')
plot(HHP2$DateTime, HHP2$Sub_metering_1, type="l", ylim= c(0,40), xlab="", ylab = "Energy sub metering", col="black") 
lines(HHP2$DateTime, HHP2$Sub_metering_2, col="red")
lines(HHP2$DateTime, HHP2$Sub_metering_3, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'), lty=c(1, 1, 1))
dev.off()

