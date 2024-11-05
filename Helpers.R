# ExData_Plotting1 - helper functions
# o getData(dataSource)
#   Retrieve the data from source into the working direcory
#   Prepare the data for processing


getData <- function(sourceUrl, sourceFile, target) {

    print(paste("> getData() (download/read/prepare) at", date(), "."))

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
    consumption <- read.table(unz(target,
                                  localFile),
                              sep=';',
                              header=TRUE,
                              na.strings = '?')

    setwd(wDir)

    # remove incomplete cases
    consumption <- consumption[complete.cases(consumption),]

    # filter out all dates except 1 and 2 Feb 2007
    consumption <- filter(consumption, Date == '1/2/2007' | Date == '2/2/2007')

    # free unused memory
    gc()

    # add a datetime variable

    consumption <- mutate(consumption, DateTime = dmy_hms(paste(Date, Time)))

}
