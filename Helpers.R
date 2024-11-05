# ExData_Plotting1 - helper functions
#
# o getData(dataSource)
#   Retrieve the data from source into the working direcory
#   Prepare the data for processing
#
# o createPlot2
#   Reuse: called fromn Plot2 and Plot4
# o createPlot3
#   Reuse: called fromn Plot3 and Plot4
#
# o getRange(dts)
#   Returns the range of dates within scope. Used for formatting the x-axis
#
#

getData <- function(sourceUrl, sourceFile, target,
                    from = '2007-02-01', to = '2007-02-02') {

    print(paste("> getData() (download/read/prepare) at", date(), "."))
    print(paste("> fromDate:", from, "toDate:", to))
    
    wDir <- getwd()
    dataDir <- paste(wDir, "Data", sep='/')
    localFile <- "household_power_consumption.txt"

    if (!dir.exists(dataDir)) dir.create(dataDir)
    setwd(dataDir)
    if(!file.exists(target)) {
        print(paste(">>> Downloading original dataset at", date(), "..."))
        download.file(paste(sourceUrl, sourceFile, sep = "/"),
                      destfile=target , mode='wb')
    }
    print(paste(">>> Loading data into data frame at", date(), ". Please be patient..."))

    setClass("myDate")
    setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
    consumption <- read.table(unz(target,localFile), sep=';', header=TRUE,
                              colClasses = c("Date" = "myDate"),
                              na.strings = '?')

    setwd(wDir)

    # remove incomplete cases
    consumption <- consumption[complete.cases(consumption),]

    # filter out all dates except 1 and 2 Feb 2007
    consumption <- filter(consumption, between(Date, from, to))
    
    # free unused memory
    gc()

    # add a datetime variable
    consumption <- mutate(consumption, DateTime = ymd_hms(paste(as.character(Date), Time)))

}

createPlot2 <- function() { 

    # used to create both Plot2 and Plot4
    rng <- getRange(consumption$DateTime)
    with(consumption, {
        plot(Global_active_power ~ DateTime, 
             type="l",
             ylab = 'Global Active Power (kilowatts)',
             xlab = NA,
             xaxt='n'
        )
        axis.POSIXct(1, at = seq(rng[1], rng[2], by = "day"), format = "%a")
    })
}

createPlot3 <- function() {

    # used to create both Plot3 and Plot4        
    rng <- getRange(consumption$DateTime)
    with(consumption, {
        plot(DateTime, Sub_metering_1,
             ylab = 'Energy sub metering',
             xlab = NA,
             type='n',
             xaxt='n'
        )
        axis.POSIXct(1, at = seq(rng[1], rng[2], by = "day"), format = "%a")
        lines(DateTime, Sub_metering_1)
        lines(DateTime, Sub_metering_2, col = 'red')
        lines(DateTime, Sub_metering_3, col = 'blue')
        legend('topright', lwd = 2, col = c('black', 'red', 'blue'), 
               legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    })
}

getRange <- function(dts) {

    # returns the date range of a datetime vector
    return(as.POSIXct(round(range(dts), "days")))   

}