source('base.R')

plot1 <- function() {
    data <- readdata()
    
    myplot <- function() {
        par(cex=.7)

        with(data, hist(
            Global_active_power, 
            main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)", 
            ylab = "Frequency", 
            col = "red"
        ))
    }

    savePlot("plot1.png", myplot)
    myplot()
}
