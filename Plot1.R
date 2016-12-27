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
## Plot 1 ##
############

head(HHP2)
str(HHP2)
summary(HHP2)

png(filename='plot1.png', width=480, height = 480, units = 'px')
hist(as.numeric(HHP2$Global_active_power)/500, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
