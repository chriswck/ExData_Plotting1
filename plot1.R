vars <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header = TRUE, nrows = 1)
power <- read.table("household_power_consumption.txt", na.strings = "?", sep=";", header = FALSE, skip=66637, nrow=2880)
colnames(power) <- colnames(vars)
library(lubridate)
power$Date <- dmy(power$Date)


par(cex.lab=0.8, cex.axis=0.8, cex.main=0.8)
with(power, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.copy(png, file="plot1.png")
dev.off()
