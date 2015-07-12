data<-read.table("household_power_consumption.txt", header=T, sep=";")
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
data$Date<-as.Date(data$Date)
data1<-subset(data, data$Date == "2007-02-01" | data$Date=="2007-02-02")

data1$Time <- as.character(data1$Time)

data1$x <- do.call(paste, c(data1[1:2], sep=":"))

data1$y <-  strptime(data1$x,"%Y-%m-%d:%H:%M:%S")

data1$Sub_metering_1<-as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2<-as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3<-as.numeric(as.character(data1$Sub_metering_3))


png(filename = "Plot3.png",
    width = 480, height = 480)
plot(data1$y, data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data1$y, data1$Sub_metering_2, col="red")
lines(data1$y, data1$Sub_metering_3, col="blue")
legend("topright",lty=1, col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
