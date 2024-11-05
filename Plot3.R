# Exploratory Data Analysis - Project 1
# This script reproduces Plot2
#
# Synopsis
#
# - Load and prepare the working data (helper function getData())
# - Generate the plot and wrie it out as a png file
#

library(dplyr)
library(data.table)
library(lubridate)
source("Helpers.R")

#
# Load and prepare data
#

sourceUrl <- "https://d396qusza40orc.cloudfront.net"
sourceFile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
target <- "data.zip"
plotFile <- "plot3.png"

consumption <- getData(sourceUrl, sourceFile, target)

#
# Generate the plot and save it as a png file in the working directory
#

png(filename = plotFile) # height/width defaults are 480px

with(consumption, {
     plot(DateTime, Sub_metering_1,
          ylab = 'Energy sub metering',
          xlab = NA,
          type='n',
          xaxt='n'
          )
     axis.POSIXct(1, DateTime, format = "%a")
     lines(DateTime, Sub_metering_1)
     lines(DateTime, Sub_metering_2, col = 'red')
     lines(DateTime, Sub_metering_3, col = 'blue')
     legend('topright', lwd = 2, col = c('black', 'red', 'blue'), 
            legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
     })

dev.off()
