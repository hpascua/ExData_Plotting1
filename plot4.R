# Read from file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")

# Prepare vectors for the plots
# datetime
dates <- data$Date[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
times <- data$Time[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
x <- strptime(paste(dates,times),"%d/%m/%Y %H:%M:%S")

# Global active power
y_a <- data$Global_active_power[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]

# Voltage
y_b <- data$Voltage[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]

# Energy sub meterings
y_c1 <- data$Sub_metering_1[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
y_c2 <- data$Sub_metering_2[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]
y_c3 <- data$Sub_metering_3[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]

# Global reactive power
y_d <- data$Global_reactive_power[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]

# Fix parameters
par(mfrow=c(2,2))

# First plot
plot(x,y_a,pch=".", xlab="",ylab="Global Active Power (kilowatts)")
lines(x,y_a)

# Second plot
plot(x,y_b,pch=".", xlab="datetime",ylab="Voltage")
lines(x,y_b)

# Third plot
plot(x, y1, pch=".", xlab="",ylab="Energy sub metering", col="black")
points(x, y2, pch=".", col="red")
points(x, y3, pch=".", col="blue")

lines(x, y1, col="black")
lines(x, y2, col="red")
lines(x, y3, col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	 lty=1, col=c("black","red","blue"), bty="n")

# Fourth plot
plot(x,y_d,pch=".", xlab="datetime",ylab="Global_reactive_power")
lines(x,y_d)

# Save to PNG
dev.copy(png, file="plot4.png")
dev.off()
dev.off()