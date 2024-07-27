#Plot1.png code
# Load required packages
library(data.table)

# Read the dataset
## fread() is used for efficient data reading. We handle missing values with na.strings="?"
data <- fread("household_power_consumption.txt", sep=";", na.strings="?", 
              colClasses=c("Date"="character", "Time"="character", 
                           "Global_active_power"="numeric"))

# Filter data for the dates 2007-02-01 and 2007-02-02
# Convert 'Date' column from character to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
filtered_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# Convert Date and Time to datetime
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 1: Histogram of Global Active Power
png("plot1.png", width=480, height=480)
hist(filtered_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

# Clean up
rm(data, filtered_data)
