vars <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header = TRUE, nrows = 1)
power <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header = FALSE, skip=66637, nrow=2881)
colnames(power) <- colnames(vars)
library(lubridate)
power$Date_Time <- paste(power$Date, power$Time, sep="_")
power$Date_Time <- dmy_hms(power$Date_Time) 

plot(power$Date_Time, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$Date_Time, power$Sub_metering_2, type="l", col="red")
lines(power$Date_Time, power$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=c(1,1,1), cex=0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=550, width=580)
dev.off()
