#Plot4.png code
# Load required package
library(data.table)

# Read the dataset
# fread() is efficient for large data and allows specification of column classes and handling of missing values
data <- fread("household_power_consumption.txt", sep=";", na.strings="?", 
              colClasses=c("Date"="character", "Time"="character", 
                           "Global_active_power"="numeric", 
                           "Global_reactive_power"="numeric", 
                           "Voltage"="numeric", 
                           "Sub_metering_1"="numeric", 
                           "Sub_metering_2"="numeric", 
                           "Sub_metering_3"="numeric"))

# Filter data for the dates 2007-02-01 and 2007-02-02
# Convert 'Date' column to Date class for proper date filtering
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data for the required date range
filtered_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# Convert Date and Time to a single datetime column
# Combine 'Date' and 'Time' columns into 'Datetime' using as.POSIXct()
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 4: Multiple plots in one figure
# Set up a 2x2 plotting area using par(mfrow=c(2,2))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Sub-plot 1: Global Active Power
plot(filtered_data$Datetime, filtered_data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power", 
     main="Global Active Power over Time")

# Sub-plot 2: Voltage
plot(filtered_data$Datetime, filtered_data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage", 
     main="Voltage over Time")

# Sub-plot 3: Energy sub-metering
plot(filtered_data$Datetime, filtered_data$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub metering")
lines(filtered_data$Datetime, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$Datetime, filtered_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n")

# Sub-plot 4: Global Reactive Power
plot(filtered_data$Datetime, filtered_data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global Reactive Power", 
     main="Global Reactive Power over Time")

# Close the plotting device
dev.off()

# Clean up the environment by removing data to free memory
rm(data, filtered_data)
