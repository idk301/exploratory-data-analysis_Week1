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
## Plot 2 ##
############

head(HHP2)
summary(HHP2)


png(filename='plot2.png', width=480, height = 480, units = 'px')
plot(HHP2$DateTime, 
     HHP2$Global_active_power,
     type="l", 
     xlab="", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
