# Ensure data is in your working directory

# Read data and subset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
specific_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# Convert Global_active_power data to numeric
specific_data$Global_active_power <- as.numeric(specific_data$Global_active_power)

# Open PNG graphics device
png("plot1.png", width = 480, height = 480)

# Generate histogram
hist(specific_data$Global_active_power, main = "Global Actove Power" , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency", col = "red" )

#Close PNG device
dev.off()