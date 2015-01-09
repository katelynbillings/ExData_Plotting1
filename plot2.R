source("getData.R")

plot2 <- function(){
    #This function creates a plot of the Global Active Power as a function 
    #of the time of day from the data obtained from the getData function.
    #The data is displayed as a line plot and the plot is saved as plot2.png
    
    #Get the data and open the png graphics device
    powerData <- getData()
    png(filename = "plot2.png", bg = "transparent")
    
    #Create the graph
    with(powerData, plot(Time, Global_active_power, type = "l",
                         ylab = "Global Active Power (kilowatts)"))
    
    #Close the connection to the png graphics device
    dev.off()
}
