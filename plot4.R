data<-read.table("C:/Users/wmorton/Documents/Coursera_Data_Science/EDA/household_power_consumption.txt",sep = ";", header = T, stringsAsFactors = F, na.strings = c("NA","?"))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M")
data <- data[,-c(1:2)]
data<-data[c(8,1:7)]
sample.data <- data[which(data$DateTime >="2007-02-1 0:00" & data$DateTime <= "2007-02-02 23:59"),]
png(filename="plot4.png", 
    units="px", 
    width=480, 
    height=480)
par(mfrow = c(2,2))
plot(sample.data$DateTime, sample.data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(sample.data$DateTime, sample.data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(sample.data$DateTime, sample.data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", ylim = c(0, max(sample.data$Sub_metering_1, sample.data$Sub_metering_2, sample.data$Sub_metering_3)))
lines(sample.data$DateTime, sample.data$Sub_metering_2, type = "l", col = "red")
lines(sample.data$DateTime, sample.data$Sub_metering_3, type = "l", col = "blue")
legend("topright",lwd = 1, col = c("black","blue", "red"), bty = "n"  ,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(sample.data$DateTime, sample.data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()