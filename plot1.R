################################################################################
##Read the household electric data and plot the histogram of Global Active Power
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

png("plot1.png")
hist(hData$Global_active_power,col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

