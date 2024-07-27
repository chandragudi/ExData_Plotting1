#Plot3.png code
# Load required package
library(data.table)

# Read the dataset
# fread() is used for efficient data reading. We handle missing values with na.strings="?"
data <- fread("household_power_consumption.txt", sep=";", na.strings="?", 
              colClasses=c("Date"="character", "Time"="character", 
                           "Sub_metering_1"="numeric", 
                           "Sub_metering_2"="numeric", 
                           "Sub_metering_3"="numeric"))

# Filter data for the dates 2007-02-01 and 2007-02-02
# Convert 'Date' column to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data for the required date range
filtered_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# Convert Date and Time to a single datetime column
# Use as.POSIXct() to combine 'Date' and 'Time' columns correctly
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 3: Energy sub-metering data over time
# Set up the PNG device with specified width and height
png("plot3.png", width=480, height=480)

# Plot the first sub-metering data
plot(filtered_data$Datetime, filtered_data$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub metering")

# Add lines for the other two sub-meterings
lines(filtered_data$Datetime, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$Datetime, filtered_data$Sub_metering_3, col="blue")

# Add a legend to the plot
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

# Close the plotting device
dev.off()

# Clean up the environment by removing data to free memory
rm(data, filtered_data)
