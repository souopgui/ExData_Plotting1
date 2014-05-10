################################################################################
##Read the household electric data and plot pannel plot of all
################################################################################
fName = "household_power_consumption.txt"
##Reading the column names
cNames = read.csv(fName,header=FALSE, sep = ";", nrows=1, colClasses = "character")
##Reading the appropriate section of data
##After data calculation based on the frsit row in the file and the first data
## to process, the good range starts at row 66637 and has two days of data:
## 2*24*60, which is 2880 rows
hData = read.csv( fName,header=FALSE, sep = ";",
                  skip=66637,nrows=2880,
                  na.strings=c("?"),
                  col.names=cNames[1,] )

par(mfcol=c(1,1))
png("plot4.png")
par(mfcol=c(2,2))
##1,1
plot(hData$dt, hData$Global_active_power, type="l",
     ylab="Global Active Power", xlab="", main="")
##2,1
plot(hData$dt, hData$Sub_metering_1, type="l",
     ylab="Energy sub-metering", xlab="", main="")
lines(hData$dt, hData$Sub_metering_2, type="l", col="red")
lines(hData$dt, hData$Sub_metering_3, type="l", col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=c(1,1,1),
       bty="n")
##1,2
plot(hData$dt, hData$Voltage, type="l",
     ylab="Voltage", xlab="datetime", main="")
##2,2
plot(hData$dt, hData$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime", main="")
dev.off()

