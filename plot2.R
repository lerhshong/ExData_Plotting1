setwd("C:/Users/lerhshong/Desktop/For Elysium/Coursera/4. Exploratory Data Analysis")
list.files()
test <- read.table(list.files()[2],header=TRUE,sep=";",na.strings ="?",stringsAsFactors = FALSE)

test$Date <- strptime(test$Date, format = "%d/%m/%Y")
# We will only be using data from the dates 2007-02-01 and 2007-02-02
test <- subset(test, Date == "2007-02-01" | Date == "2007-02-02")
test$datetime <- strptime(paste(test$Date,test$Time),format = "%Y-%m-%d %H:%M:%S")



png("plot2.png",480,480)
plot(test$datetime,test$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()


