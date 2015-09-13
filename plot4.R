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

png(file="plot4.png")
par(mfrow = c(2,2))
with(DF, plot(Time,Global_active_power,type="l", ylab="Global Active Power", xlab=""))

with(DF, plot(Time,Voltage,type="l", ylab="Voltage", xlab="datetime"))

plot(DF$Time,DF$Sub_metering_1,type="l", ylab="Energy sub metering", xlab="")
lines(DF$Time,DF$Sub_metering_2,type="l",col="red")
lines(DF$Time,DF$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(DF, plot(Time,Global_reactive_power,type="l", ylab="Global_reactive_power", xlab="datetime"))
dev.off()
