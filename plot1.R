data<-read.table("household_power_consumption.txt", header=T, sep=";")
data$Date <- strptime(as.character(data$Date), "%d/%m/%Y")
data$Date<-as.Date(data$Date)
data1<-subset(data, data$Date == "2007-02-01" | data$Date=="2007-02-02")

data1$Global_active_power<-as.character(data1$Global_active_power)
data1$Global_active_power<-as.numeric(data1$Global_active_power)

png(filename = "Plot1.png",
    width = 480, height = 480)

hist(data1$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")
dev.off()
