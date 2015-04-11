source('base.R')

plot1 <- function() {
    plot <- function() {
        with(data, hist(
            Global_active_power, 
            main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)", 
            ylab = "Frequency", 
            col = "red"))
    }

    savePlot("plot1.png", plot)
    plot()
}
