library(dplyr)
library(lubridate)

getData <- function(){
#This function is designed for the first course project for exploratory data
#analysis. It will perform the following:
# 1. Check if the household power consumption data is in the working directory 
#    and retrieve it if it is not present. 
# 2. After being read in, select only the data for the time frame from the 
#    beginning of 2/1/2007 to the end of 2/2/2007. 
# 3. Collapse the Date and Time Column into one column (Time) and convert it to 
#    POSIXct class. 
# 4. Return the processed data set.
    
    if(!file.exists("household_power_consumption.txt")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "./downloadedData", method = "curl")
        dateDownloaded <- Date()
        print(c("File downloaded on", dateDownloaded))
        unzip("./downloadedData")
    }
    
    #If the processed data doesn't exist, read in data. Collapse Date and Time 
    #column to one value (Time) and convert to POSIXct class. Convert remaining
    #values into numerics and select the data from the desired time frame.
    if(!exists("powerData")){
        powerData <- read.csv("household_power_consumption.txt", as.is = TRUE, 
                              sep = ";", na.strings = c("?", "")) %>%
                     filter(Date == ("1/2/2007") | Date == ("2/2/2007"))
        powerData$Time <- paste(powerData$Date, powerData$Time, sep = " ")
        powerData$Time <- dmy_hms(powerData$Time)
        powerData <- select(powerData, - Date)
    }
    
    #return the data
    powerData
}