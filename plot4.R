setwd("C:/Users/lerhshong/Desktop/For Elysium/Coursera/4. Exploratory Data Analysis")
list.files()
test <- read.table(list.files()[2],header=TRUE,sep=";",na.strings ="?",stringsAsFactors = FALSE)

test$Date <- strptime(test$Date, format = "%d/%m/%Y")
# We will only be using data from the dates 2007-02-01 and 2007-02-02
test <- subset(test, Date == "2007-02-01" | Date == "2007-02-02")
test$datetime <- strptime(paste(test$Date,test$Time),format = "%Y-%m-%d %H:%M:%S")

png("plot4.png",480,480)
par(mfrow=c(2,2),mar = c(4,4,2,2))
plot(test$datetime,test$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
plot(test$datetime,test$Voltage,type = "l",xlab="datetime",ylab = "Voltage")
plot(test$datetime,test$Sub_metering_1,type="l", ylab = "Energy sub metering", xlab = "")
lines(test$datetime,test$Sub_metering_2,type = "l",col = "red")
lines(test$datetime,test$Sub_metering_3,type = "l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
with(test,plot(datetime,Global_reactive_power,type = "l"))

dev.off()


