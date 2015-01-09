source("getData.R")

plot4 <- function(){
    #From the data retrieved from the getData function, this function creates 4
    #plots in a 2x2 grid filled column wise: Global Active Power vs Time, 
    #Submetering vs Time, Voltage vs Time, and Global Reactive Power vs Time.
    
    powerData <- getData()
    png(filename = "plot4.png", bg = "transparent")
    par(mfcol = c(2,2))
    
    #Create the first graph
    with(powerData, plot(Time, Global_active_power, type = "l",
                         ylab = "Global Active Power"))
    
    #Create the second graph
    with(powerData, plot(Time, Sub_metering_1, type = "l", 
                         ylab = "Energy sub metering", xlab = ""))
         with(powerData, lines(x = Time, y = Sub_metering_2, col = "red"))
         with(powerData, lines(x = Time, y = Sub_metering_3, col = "blue"))
         legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), 
                bty = "n")
    
    #Create the third graph
    with(powerData, plot(Time, Voltage, type = "l", xlab = "datetime"))
    
    #Create the fourth graph
    with(powerData, plot(Time, Global_reactive_power, type = "l", 
                         xlab = "datetime"))
    
    dev.off()
    
}