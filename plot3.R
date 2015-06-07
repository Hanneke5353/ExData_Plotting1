# set the working directory
setwd("/Users/hanneke/Documents/knowledge/training_data_scientist/explore_analysis")
getwd()

# load the data
elec <- read.csv("household_power_consumption.txt", sep = ";", dec=".")
elect <- data.frame(elec)


# data manipulation
elect$Date2 <- as.Date(elect$Date, "%d/%m/%Y")
elect$Global_active_power <- as.numeric(paste(elect$Global_active_power))
elect$datetime <- strptime(paste(elect$Date, elect$Time, sep=" ")
                     , "%d/%m/%Y %H:%M:%S") 
elect$Sub_metering_1 <- as.numeric(elect$Sub_metering_1)
elect$Sub_metering_2 <- as.numeric(elect$Sub_metering_2)
elect$Sub_metering_3 <- as.numeric(elect$Sub_metering_3)


#subset
elect <- subset(elect, elect$Date2 >= as.Date("2007-02-01"))
elect <- subset(elect, elect$Date2 <= as.Date("2007-02-02"))

# check data
str(elect)
head(elect)


# Plot
png("plot3.png", width=480, height=480)
plot(elect$datetime, elect$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(elect$datetime, elect$Sub_metering_2, type="l", col="red")
lines(elect$datetime, elect$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", 
                      "Sub_metering_2", 
                      "Sub_metering_3") , lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

