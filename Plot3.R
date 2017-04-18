#Reading the data file, taking the top row as the name of the columns
data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors = FALSE)
#Converting the data in Date column to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Subsetting the date to the desired date period 
data3 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Forming a column with date and time
data3$Datetime <- as.POSIXct(paste(as.Date(data3$Date), data3$Time))
#Plotting three lines
with(data3, {
      plot(data3$Datetime, data3$Sub_metering_1, type = "l",  
           ylab="Energy sub metering", xlab="")
      lines(data3$Datetime, data3$Sub_metering_2, col='Red')
      lines(data3$Datetime, data3$Sub_metering_3, col='Blue')
})
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
