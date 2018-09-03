#Plot2 
library("data.table")
Date1 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
Date1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
Date1[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Date1 <- Date1[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x = Date1[, dateTime]  , y = Date1[, Global_active_power] , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

