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

# Energy sub meterings
y1 <- data$Sub_metering_1[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
y2 <- data$Sub_metering_2[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
y3 <- data$Sub_metering_3[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]

# Plot
plot(x, y1, pch=".", xlab="",ylab="Energy sub metering", col="black")
points(x, y2, pch=".", col="red")
points(x, y3, pch=".", col="blue")

lines(x, y1, col="black")
lines(x, y2, col="red")
lines(x, y3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	 lty=1, col=c("black","red","blue"))

# Save to PNG
dev.copy(png, file="plot3.png")
dev.off()
dev.off()