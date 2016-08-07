setwd("C:/Users/lerhshong/Desktop/For Elysium/Coursera/4. Exploratory Data Analysis")
list.files()
test <- read.table(list.files()[2],header=TRUE,sep=";",na.strings ="?",stringsAsFactors = FALSE)
test$Date <- as.Date(test$Date, format = "%d/%m/%Y")
# We will only be using data from the dates 2007-02-01 and 2007-02-02
test <- subset(test, Date == "2007-02-01" | Date == "2007-02-02")
png("plot1.png",480,480)
with(test, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red"))
dev.off()


