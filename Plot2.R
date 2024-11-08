# Exploratory Data Analysis - Project 1
# This script reproduces Plot2
#
# Synopsis
#
# - Load and prepare the working data
# - Generate the plot and write it out as a png file
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
plotFile <- "plot2.png"

consumption <- getData(sourceUrl, sourceFile, target)

#
# Generate the plot and save it as a png file in the working directory
#

png(filename = plotFile) # height/width defaults are 480px

createPlot2()

dev.off()

#
# End
#