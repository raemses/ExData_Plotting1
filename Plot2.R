#Reading the data file, taking the top row as the name of the columns
data <- read.table("household_power_consumption.txt", sep = ";",
                   dec = ".", header = TRUE, stringsAsFactors = FALSE)
#Converting the data in Date column to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Subsetting the date to the desired date period 
data2 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Forming a column with date and time
data2$Datetime <- as.POSIXct(paste(as.Date(data2$Date), data2$Time))
#Plot the curve
plot(data2$Datetime, data2$Global_active_power, type = "l",
     ylab="Global Active Power (kilowatts)", xlab="")
#Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
