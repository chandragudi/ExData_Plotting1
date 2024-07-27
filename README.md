# Household Energy Consumption Analysis

This project analyzes household energy consumption data over a 2-day period in February 2007. It involves creating four plots using R to visualize different aspects of the energy usage.

## Dataset

The dataset used in this project is the "Individual household electric power consumption Data Set" from the UC Irvine Machine Learning Repository. It contains measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years.

- **Source**: UC Irvine Machine Learning Repository.  It was stored in the working directory.
- **Time period**: 2007-02-01 to 2007-02-02
- **Sampling rate**: 1 minute
- **Variables**: 9 (including date, time, power consumption metrics, and sub-metering values)

## Project Structure

The project consists of the following files:

1. `plot1.R` and `plot1.png`
2. `plot2.R` and `plot2.png`
3. `plot3.R` and `plot3.png`
4. `plot4.R` and `plot4.png`

Each R script (`plot1.R`, `plot2.R`, etc.) contains code to:
- Read the dataset
- Process the data as necessary
- Create the corresponding plot
- Save the plot as a PNG file

## Instructions for Running the Scripts

1. Ensure you have R installed on your system.
2. Download the dataset and place it in the same directory as the R scripts.
3. Run each R script separately. For example:
   ```
   Rscript plot1.R
   ```
4. Each script will generate its corresponding PNG file in the same directory.

## Plot Descriptions

1. **Plot 1**: Histogram of Global Active Power
2. **Plot 2**: Global Active Power over time
3. **Plot 3**: Energy sub-metering over time
4. **Plot 4**: Multiple plots showing various energy consumption metrics

## Notes

- Missing values in the dataset are coded as `?`, and they are handled in the plot scripts by using fread() function.
- The plots are saved as PNG files with a width and height of 480 pixels each
- Make sure your system has enough memory to handle the large dataset (2,075,259 rows and 9 columns)

For more detailed information about the project and its requirements, please refer to the original assignment instructions.
