source("getData.R")

plot1 <- function(){
    #This function will create a Global Active Power histogram from the data set 
    #obtained from the getData function. The plot will display the frequency of 
    #the global active power (in 0.5kW increments) during the time span from 
    #2/1/2007 to 2/2/2007.
     
    #Get the data, launch a png device
    powerData <- getData()
    png(filename = "plot1.png", bg = "transparent")
    
    #Create the graph
    with(powerData, hist(Global_active_power, col = "red", 
                         main = "Global Active Power", 
                         xlab = "Global Active Power (kilowatts)", 
                         ylim = c(0, 1250)))
    
    #Close the png graphics device
    dev.off()   
}