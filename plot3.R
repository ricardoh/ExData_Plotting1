source('base.R')

plot3 <- function() {
    data <- readdata()
    
    myplot <- function() {
        par(cex=.7)
        
        with(data, plot(
            Time,
            Sub_metering_1, 
            type = "l",
            xlab = "", 
            ylab = "Energy sub metering",
            col = "black"
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
        legend(
            "topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            lty = c(1,1,1),
            col = c("black", "red", "blue")
        )
    }
    
    savePlot("plot3.png", myplot)
    myplot()
}
