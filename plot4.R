source('base.R')

plot4 <- function() {
    data <- readdata()
    
    myplot <- function() {
        par(mfrow = c(2, 2))
        
        par(cex=.5)
        with(data, plot(
            Time,
            Global_active_power, 
            type = "l",
            xlab = "", 
            ylab = "Global Active Power",
            main = NULL
        ))

        par(cex=.5)
        with(data, plot(
            Time,
            Voltage, 
            type = "l",
            xlab = "datetime", 
            ylab = "Voltage",
            main = NULL
        ))
    
        par(cex=.5)
        with(data, plot(
            Time,
            Sub_metering_1, 
            type = "l",
            xlab = "", 
            ylab = "Energy sub metering",
            col = "black",
            main = NULL
        ))
        with(data, lines(
            Time,
            Sub_metering_2, 
            col = "red"
        ))
        with(data, lines(
            Time,
            Sub_metering_3, 
            col = "blue"
        ))
        par(cex=.45)
        legend(
            "topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            lty = c(1,1,1),
            col = c("black", "red", "blue"),
            bty = "n"
        )
        
        par(cex=.5)
        with(data, plot(
            Time,
            Global_reactive_power, 
            type = "l",
            xlab = "datetime", 
            ylab = "Global_reactive_power",
            main = NULL
        ))
    }
    
    savePlot("plot4.png", myplot)
    myplot()
}
