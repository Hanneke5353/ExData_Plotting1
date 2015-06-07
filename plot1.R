# set the working directory
setwd("/Users/hanneke/Documents/knowledge/training_data_scientist/explore_analysis")
getwd()

# load the data
elec <- read.csv("household_power_consumption.txt", sep = ";", dec=".")
elect <- data.frame(elec)


# data manipulation
elect$Date2 <- as.Date(elect$Date, "%d/%m/%Y")
elect$Global_active_power <- as.numeric(paste(elect$Global_active_power))

#subset
elect <- subset(elect, elect$Date2 >= as.Date("2007-02-01"))
elect <- subset(elect, elect$Date2 <= as.Date("2007-02-02"))

# check data
str(elect)
head(elect)


# Plot
png("plot1.png", width=480, height=480)
hist(elect$Global_active_power, col = "red", 
     main = "Global Active Power" , 
     xlab = "Global active Power (kilowatts)")
dev.off()

