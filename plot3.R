energy <- read.csv("household_power_consumption.txt", sep=";")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")
esub <- energy[energy$Date=="2007-02-01"|energy$Date=="2007-02-02",]

esub$sm1 <- as.numeric(as.character(esub$Sub_metering_1))
esub$sm2 <- as.numeric(as.character(esub$Sub_metering_2))
plot(esub$sm1, pch = ".", ylab = "Energy sub metering", axes = FALSE, xlab= "")
axis(side = 1, at = c(0, fri, sum(complete.cases(esub$gap))), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(0, 10, 20, 30), labels = c("0", "10", "20", "30"))
lines(esub$sm1,col = "black")
points(esub$sm2, pch = ".")
lines(esub$sm2,col = "red")
points(esub$Sub_metering_3, pch = ".")
lines(esub$Sub_metering_3,col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
box()

dev.copy(png,"plot3.png")
dev.off()
