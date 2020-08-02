# Read from file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")

# Prepare vectors for the plot
# datetime
dates <- data$Date[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
times <- data$Time[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
x <- strptime(paste(dates,times),"%d/%m/%Y %H:%M:%S")

# Global active power
y <- data$Global_active_power[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]

# Plot
plot(x,y,pch=".", xlab="",ylab="Global Active Power (kilowatts)")
lines(x,y)

# Save to PNG
dev.copy(png, file="plot2.png")
dev.off()
dev.off()