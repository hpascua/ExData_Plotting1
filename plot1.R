# Read from file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")

# Prepare vector for the plot
gap <- data$Global_active_power[as.Date(strptime(data$Date,"%d/%m/%Y")) >= start 
	& as.Date(strptime(data$Date,"%d/%m/%Y"))<= end]

# Plot
hist(as.numeric(gap), main="Global Active Power", 
	xlab="Global Active Power (in kilowatts)", col="red")

# Save to PNG
dev.copy(png, file="plot1.png")
dev.off()
dev.off()