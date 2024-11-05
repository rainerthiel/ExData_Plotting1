# Exploratory Data Analysis - Project 1
# This script reproduces Plot4
#
# Synopsis
#
# - Load and prepare the working data
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
plotFile <- "plot4.png"

consumption <- getData(sourceUrl, sourceFile, target)

#
# Generate the plot and save it as a png file in the working directory
#

png(filename = plotFile) # height/width defaults are 480px

par(mfcol = c(2,2)) # just leaving margins to default

createPlot2()
createPlot3()

rng <- getRange(consumption$DateTime)
with(consumption, {
    plot(Voltage ~ DateTime, 
         type="l",
         ylab = 'Voltage',
         xlab = 'datetime',
         xaxt='n'
    )
    axis.POSIXct(1, at = seq(rng[1], rng[2], by = "day"), format = "%a")
})

with(consumption, {
    plot(Global_reactive_power ~ DateTime, 
         type="l",
#         ylab = 'Voltage',
         xlab = 'datetime',
         xaxt='n'
    )
    axis.POSIXct(1, at = seq(rng[1], rng[2], by = "day"), format = "%a")
})

dev.off()

#
# End
#