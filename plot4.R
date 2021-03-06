# Exploratory Data Analysis - Project 1
# This R script reproduces plot4
# 
# Synopsis
#
# Prepare the working data
# 1. Retrieve the data from source and unzip it into the
#    working direcory - unless already done
# 2. Read the file, subset on relevant dates and save as
#    the working file - unless already done
# 3. Read the working file. Subsequent invocations of this
#    or any of the other scripts in this project don't need
#    to do steps 1. or 2. unless those files are deleted from
#    the working directory
#
# Action Stations
# 4. Merge the Date and Time columns into a new DateTime variable
#    for the plot x-axes
# 5. Open a png graphics device
# 6. Split the palette into 4 quadrants
# 7. Generate the 4 plots as required
# 8. Close the graphics device to write out the completed plot image file.
#
library(lubridate)
library(plyr)

fname <- "household_power_consumption.txt"
fname_subset <- "household_power_consumption_subset.txt"

if(!file.exists(fname))
{
    # Download the data and unzip 
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipFile <- "dataset.zip"
    print(paste(">>> Downloading original dataset at", date(), ". Please be patient..."))
    download.file(url, destfile=zipFile , mode='wb')
    
    print(">>> Unzipping downloaded file...")
    unzip(zipFile)
    file.remove(zipFile)
    file.remove(fname_subset)
}

if(!file.exists(fname_subset))
{
    # read in the big file
    df <- read.table(fname,sep=";",header=T,na.strings="?",stringsAsFactors=F)

    # Subset it and save the subset as the working dataset
    select <- c("1/2/2007", "2/2/2007")
    df <- df[df$Date %in% select,]
    write.table(df, "household_power_consumption_subset.txt", sep=";")
}    

df <- read.table(fname_subset,sep=";",header=T,na.strings="?",stringsAsFactors=F)

# merge date and time columns into a new dmy_hms column
df <- mutate(df, DateTime = paste(Date, Time))

png(filename="plot4.png") # height/width defauts are 480px

par(mfrow=c(2,2))

plot(dmy_hms(df$DateTime),
     df$Global_active_power,
     type="l",
     ylab="Global Active Power",
     xlab="")

plot(dmy_hms(df$DateTime),
     df$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

plot(dmy_hms(df$DateTime),
     df$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="")
lines(dmy_hms(df$DateTime), df$Sub_metering_2,col="Red")
lines(dmy_hms(df$DateTime), df$Sub_metering_3,col="Blue")
legend("topright", legend=names(df)[7:9], col=c("Black", "Red", "Blue"), lty=1, bty="n")

plot(dmy_hms(df$DateTime),
     df$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()
