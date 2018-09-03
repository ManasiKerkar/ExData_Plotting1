#Plot3
library("data.table")
Date1 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?"
)
Date1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
Date1[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Date1 <- Date1[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot3.png", width=480, height=480)
plot(Date1[, dateTime], Date1[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(Date1[, dateTime], Date1[, Sub_metering_2],col="red")
lines(Date1[, dateTime], Date1[, Sub_metering_3],col="blue")
legend("topright" , col=c("black","red","blue")   , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")  ,lty=c(1,1), lwd=c(1,1))
dev.off()
#plot3 end 
