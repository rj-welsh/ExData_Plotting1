fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileUrl,destfile = temp)
unzip(temp)
unlink(temp)
fileName <- "household_power_consumption.txt"
DF <- read.table(fileName,header=TRUE,sep=";",na.strings="?",nrows=69517)
DF$Time <- strptime(paste(DF$Date, DF$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
DF$Date <- as.Date(DF$Date,format="%d/%m/%Y")
DF <- DF[(DF$Date >= as.Date("2007-02-01")) & (DF$Date < as.Date("2007-02-03")), ]

hist(DF$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
png(file="plot1.png")
hist(DF$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
