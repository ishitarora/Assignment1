data<-read.table("household_power_consumption.txt", header=T, sep=";")
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
data$Date<-as.Date(data$Date)
data1<-subset(data, data$Date == "2007-02-01" | data$Date=="2007-02-02")

data1$Global_active_power<-as.character(data1$Global_active_power)
data1$Global_active_power<-as.numeric(data1$Global_active_power)

data1$Time <- as.character(data1$Time)

data1$x <- do.call(paste, c(data1[1:2], sep=":"))

data1$y <-  strptime(data1$x,"%Y-%m-%d:%H:%M:%S")

png(filename = "Plot2.png",
    width = 480, height = 480)
plot(data1$y, data1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
