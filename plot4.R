energy <- read.csv("household_power_consumption.txt", sep=";")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")
esub <- energy[energy$Date=="2007-02-01"|energy$Date=="2007-02-02",]

esub$volt <- as.numeric(as.character(esub$Voltage))
esub$grp <- as.numeric(as.character(esub$Global_reactive_power))

par(mfcol = c(2,2))

plot(esub$gap, pch = ".", type = "n", axes = FALSE, xlab = "", ylab = "Global Active Power (kilowatts)") 
axis(side = 1, lty=1, at = c(0, fri, sum(complete.cases(esub$gap))), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, lty=1, at = c(0, 2, 4, 6), labels = c("0", "2", "4", "6"))
lines(esub$gap)
box()

plot(esub$sm1, pch = ".", ylab = "Energy sub metering", axes = FALSE, xlab = "")
axis(side = 1, lty=1, at = c(0, fri, sum(complete.cases(esub$gap))), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, lty=1, at = c(0, 10, 20, 30), labels = c("0", "10", "20", "30"))
lines(esub$sm1,col = "black")
points(esub$sm2, pch = ".")
lines(esub$sm2,col = "red")
points(esub$Sub_metering_3, pch = ".")
lines(esub$Sub_metering_3,col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
box()

plot(esub$volt, pch = ".", type = "n", axes = FALSE, xlab = "datetime", ylab = "Voltage")
axis(side = 1, lty=1, at = c(0, fri, sum(complete.cases(esub$gap))), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(234,236,238,240,242,244,246), labels = c("234","","238","","242","","246"))
lines(esub$volt,col = "black")
box()

plot(esub$grp, pch = ".", type = "n", axes = FALSE, xlab = "datetime", ylab = "Global_reactive_power")
axis(side = 1, lty=1, at = c(0, fri, sum(complete.cases(esub$gap))), labels = c("Thu", "Fri", "Sat"))
axis(side = 2)
lines(esub$grp,col = "black")
box()

dev.copy(png,"plot4.png")
dev.off()
