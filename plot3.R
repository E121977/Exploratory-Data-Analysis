## Exploratory Data Analysis Project Assignment Week 1 June 2015
## PLOT 3 Code
## The data was downloaded and stored into my local working directory

# Set the working directory
setwd("C:\\Users\\E121977\\Desktop\\Coursera - Data Science\\(4) Exploratory Data Analysis\\Project 1")

# Load the data file - full data set is ok with memory on this machine. 
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert dates to a date format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data to the date ranges required for assignment
data.subset <- subset(data, (Date == "2007-02-01") | (Date == "2007-02-02"))

# Combine date and time into one column and identify as date/time class
data.subset$DateTime <- as.POSIXct(paste(data.subset$Date, data.subset$Time))

# Open graphics device; Enable write capability; Send plot to a file
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

# Generate Plot. Set the title using main, x labels, y labels and the color. 
plot(x=data.subset$DateTime, y=data.subset[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=data.subset$DateTime,, y=data.subset[,"Sub_metering_2"], col="red")
lines(x=data.subset$DateTime,, y=data.subset[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close Graphics Device
dev.off()
