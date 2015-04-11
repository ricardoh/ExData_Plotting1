library(utils)

readdata <- function() {
    getCompressedDataFile()
    decompressDataFile()
    "aqui"
}

getCompressedDataFile <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipname <- "data/household_power_consumption.zip"
    
    if (!file.exists(zipname)) {
        ret <- download.file(url, zipname, quiet=T)
        if (ret != 0) {
            stop("Download error. Check internet connection.")
        }
    }
}

decompressDataFile <- function() {
    zipname <- "data/household_power_consumption.zip"
    dataname <- "data/household_power_consumption.txt" 
    filenames <- c("household_power_consumption.txt")
    
    if (!file.exists(dataname)) {
        unzip(zipname, filenames, exdir= "./data")
    }
}