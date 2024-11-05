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

source <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
target <- "data.zip"
consumption <- getData(source, target)
