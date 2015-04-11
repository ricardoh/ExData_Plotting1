source('base.R')

plot2 <- function() {
    data <- readdata()

    myplot <- function() {
        par(cex=.7)

        with(data, plot(
            Time,
            Global_active_power, 
            type = "l",
            xlab = "", 
            ylab = "Global Active Power (kilowatts)" 
        ))
    }

    savePlot("plot2.png", myplot)
    myplot()
}

