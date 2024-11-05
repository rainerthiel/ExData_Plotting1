# Prepare the working data
# 1. Retrieve the data from source and unzip it into the
#    working direcory - unless already done
# 2. Read the file, subset on relevant dates and save as
#    the working file - unless already done
# 3. Read the working file. Subsequent invocations of this
#    or any of the other scripts in this project don't need
#    to do steps 1. or 2. unless those files are deleted from
#    the working directory

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
consumption <- getData(sourceUrl, sourceFile, target)

#
# Generate the plot and save it as a png file in the working directory
#

png(filename="plot1.png") # height/width defaults are 480px

hist(consumption$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     col = 'red')

dev.off()