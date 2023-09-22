# Ensure data is in your working directory

# Read data and subset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
specific_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# Convert Date data to date format 
specific_data$Date <- as.Date(specific_data$Date, format="%d/%m/%Y")

# Merge Date and Time columns and format as POSIXct
specific_data$DateTime <- paste(specific_data$Date, specific_data$Time)
specific_data$DateTime <- as.POSIXct(specific_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Convert Global_active_power data to numeric
specific_data$Global_active_power <- as.numeric(specific_data$Global_active_power)

# Open PNG graphics device
png("plot2.png", width = 480, height = 480)

# Generate plot
plot(specific_data$DateTime, specific_data$Global_active_power, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")

#Close PNG device
dev.off()