# Exploratory Data Analysis - Project 1
# This script reproduces plot1
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
# 4. Open a png graphics device
# 5. Generate the histogram plot as required
# 6. Close the graphics device to write out the completed plot image file.
#
fname <- "household_power_consumption.txt"
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
}

fname_subset <- "household_power_consumption_subset.txt"
if(!file.exists(fname_subset))
{
    # read in the big file, subset it and save the subset
    df <- read.table(fname,sep=";",header=T,na.strings="?",stringsAsFactors=F)
    select <- c("1/2/2007", "2/2/2007")
    df <- df[df$Date %in% select,]
    write.table(df, "household_power_consumption_subset.txt", sep=";")
}    

df <- read.table(fname_subset,sep=";",header=T,na.strings="?",stringsAsFactors=F)


png(filename="plot1.png") # height/width defauts are 480px

hdr <- "Global Active Power"
hist(df$Global_active_power,
     col="red",
     xlab=paste(hdr, "(kilowatts)"),
     main=hdr)

dev.off()
