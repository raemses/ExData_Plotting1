#Reading the data file, taking the top row as the name of the columns
data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors = FALSE)
#Converting the data in Date column to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Subsetting the date to the desired date period 
data4 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Forming a column with date and time
data4$Datetime <- as.POSIXct(paste(as.Date(data4$Date), data4$Time))
#Setting for 2 by 2 splitting for the graphs
par(mar=c(4,4,2,1), oma=c(0,0,2,0), mfrow=c(2,2))
#Plotting graphs
with(data, {
  plot(data4$Datetime, data4$Global_active_power, type = "l",  
       ylab="Global Active Power", xlab="")
  plot(data4$Datetime, data4$Voltage,  type="l", 
       ylab="Voltage", xlab="")
  with(data4, {
    plot(data4$Datetime, data4$Sub_metering_1, type = "l",  
         ylab="Energy sub metering", xlab="")
    lines(data4$Datetime, data4$Sub_metering_2, col='Red')
    lines(data4$Datetime, data4$Sub_metering_3, col='Blue')
   })
  legend("topright", lty=1, col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
  plot(data4$Datetime, data4$Global_reactive_power,  type="l", 
       ylab="Global reactive power", xlab="")
})

#Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

