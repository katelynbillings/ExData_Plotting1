source("getData.R")

plot3 <- function(){
    #This function creates a plot of the different Energy Sub Meterings as a 
    #function of the time of day from the data obtained from the getData
    #function. Each sub metering is color coded and the final plot is saved as 
    #plot3.png
    
    #Get the data and open the png graphics device
    powerData <- getData()
    png("plot3.png", bg = "transparent")
    
    #Create the graph
    with(powerData, plot(Time, Sub_metering_1, type = "l", 
                         ylab = "Energy sub metering", xlab = ""))
    with(powerData, lines(x = Time, y = Sub_metering_2, col = "red"))
    with(powerData, lines(x = Time, y = Sub_metering_3, col = "blue"))
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
           "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
    
    #Close the connection to the png graphics device
    dev.off()
    
}