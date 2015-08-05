vars <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header = TRUE, nrows = 1)
power <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header = FALSE, skip=66637, nrow=2881)
colnames(power) <- colnames(vars)
library(lubridate)
power$Date_Time <- paste(power$Date, power$Time, sep="_")
power$Date_Time <- dmy_hms(power$Date_Time) 

par(mar=c(4.1, 4.1, 2.1, 2.1), mfcol=c(2,2), cex.lab=0.8, cex.axis=0.75, cex.main=0.75)
plot(power$Date_Time, power$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(power$Date_Time, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power$Date_Time, power$Sub_metering_2, type="l", col="red")
lines(power$Date_Time, power$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=c(1,1,1), cex=0.75, bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power$Date_Time, power$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(power$Date_Time, power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=570)
dev.off()