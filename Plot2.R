#Plot2.png code
# Load required package
library(data.table)

# Read the dataset
# Use fread() to read the data quickly; specify column types and handle missing values
data <- fread("household_power_consumption.txt", sep=";", na.strings="?", 
              colClasses=c("Date"="character", "Time"="character", 
                           "Global_active_power"="numeric"))

# Filter data for the dates 2007-02-01 and 2007-02-02
# Convert 'Date' column from character to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data for the required date range
filtered_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# Convert Date and Time to a single datetime column
# Combine 'Date' and 'Time' columns and convert to POSIXct class for date-time
filtered_data$Datetime <- as.POSIXct(paste(filtered_data$Date, filtered_data$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 2: Time series of Global Active Power
# Create a PNG file for the plot with specified width and height
png("plot2.png", width=480, height=480)

# Plot Global Active Power over time
plot(filtered_data$Datetime, filtered_data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)", 
     main="Global Active Power over Time")

# Close the plotting device
dev.off()

# Clean up the environment by removing data to free memory
rm(data, filtered_data)
