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


#subset
elect <- subset(elect, elect$Date2 >= as.Date("2007-02-01"))
elect <- subset(elect, elect$Date2 <= as.Date("2007-02-02"))

# check data
str(elect)
head(elect)


# Plot
png("plot2.png", width=480, height=480)
plot(elect$datetime, elect$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

