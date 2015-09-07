data<-read.table("C:/Users/wmorton/Documents/Coursera_Data_Science/EDA/household_power_consumption.txt",sep = ";", header = T, stringsAsFactors = F, na.strings = c("NA","?"))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M")
data <- data[,-c(1:2)]
data<-data[c(8,1:7)]
sample.data <- data[which(data$DateTime >="2007-02-1 0:00" & data$DateTime <= "2007-02-02 23:59"),]
png(filename="plot1.png", 
    units="px", 
    width=480, 
    height=480)
hist(sample.data$Global_active_power, col = "red", breaks = 15, main = "Global Active Power",ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()