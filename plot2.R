## Exploratory Data Analysis Project Assignment Week 1 June 2015
## PLOT 2 Code
## The data was downloaded and stored into my local working directory

# Set the working directory
setwd("C:\\Users\\E121977\\Desktop\\Coursera - Data Science\\(4) Exploratory Data Analysis\\Project 1")

# Load the data (full file)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Convert dates to a date format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data to the date ranges required for assignment
data.subset <- subset(data, (Date == "2007-02-01") | (Date == "2007-02-02"))

# Combine date and time into one column and identify as date/time class
data.subset$DateTime <- as.POSIXct(paste(data.subset$Date, data.subset$Time))

# Open graphics device; Enable write capability; Send plot to a file
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

# Generate Plot. Set the title using main, x labels, y labels and the color. 
plot(x=data.subset$DateTime, y=data.subset[,"Global_active_power"], type="l",ylab="Global Active Power (kilowatts)", main="", xlab="")

# Close Graphics Device
dev.off()

