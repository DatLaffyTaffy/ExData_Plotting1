# Ensure data is in your working directory

# Read data and subset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
specific_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# Convert Date data to date format 
specific_data$Date <- as.Date(specific_data$Date, format="%d/%m/%Y")

# Merge Date and Time columns and format as POSIXct
specific_data$DateTime <- paste(specific_data$Date, specific_data$Time)
specific_data$DateTime <- as.POSIXct(specific_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Convert Sub_metering data to numeric
specific_data$Sub_metering_1 <- as.numeric(specific_data$Sub_metering_1)
specific_data$Sub_metering_2 <- as.numeric(specific_data$Sub_metering_2)
specific_data$Sub_metering_3 <- as.numeric(specific_data$Sub_metering_3)

# Open PNG graphics device
png("plot3.png", width = 480, height = 480)

# Generate plot
with(specific_data, {
    plot(Sub_metering_1~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
    })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close PNG device
dev.off()