#Reading the data file, taking the top row as the name of the columns
data <- read.table("household_power_consumption.txt", sep = ";", 
                   dec = ".", header = TRUE, stringsAsFactors = FALSE)
#Converting the data in Date column to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Subsetting the date to the desired date period 
data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#Plotting the histogram
hist(as.numeric(as.character(data1$Global_active_power)),
     col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#Saving the plot to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()