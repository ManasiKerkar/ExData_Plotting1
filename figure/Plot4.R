#plot4 multiple plots 
library("data.table")
Date1 <- data.table::fread(input = "household_power_consumption.txt" , na.strings ="?")
Date1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
Date1[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Date1 <- Date1[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#plot1 start
plot(Date1[, dateTime], Date1[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2 start 
plot(Date1[, dateTime],Date1[, Voltage], type="l", xlab="datetime", ylab="Voltage")
# Plot 3 start
plot(Date1[, dateTime], Date1[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(Date1[, dateTime], Date1[, Sub_metering_2], col="red")
lines(Date1[, dateTime], Date1[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")  , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")  , lty=c(1,1)  , bty="n"  , cex=.5) 
# Plot 4 start
plot(Date1[, dateTime], Date1[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
