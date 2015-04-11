library(utils)
Sys.setlocale("LC_ALL","C")

readdata <- function() {
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
    
    loadAndClean <- function() {
        dataname <- "data/household_power_consumption.txt" 
        cachename <- "data/household_power_consumption_cleaned.rds"
        
        if (!file.exists(cachename)) {
            data <- read.csv(dataname, sep = ";", na.strings = "?", dec = ".")
            data <- transform(data, Date = as.Date(Date, format="%d/%m/%Y"))
            data <- transform(data, Time = as.POSIXlt(as.character(paste(Date, Time, sep = " ")), format="%Y-%m-%d %H:%M:%S"))
            data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
            saveRDS(data, file = cachename)
        } else {
            data <- readRDS(cachename)
        }
        
        data
    }

    getCompressedDataFile()
    decompressDataFile()
    loadAndClean()
}

savePlot <- function (filename, plotFunction) {
    png(filename, width=480, height=480, res=120)
    plotFunction()
    dev.off()
}
