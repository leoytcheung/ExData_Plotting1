energy <- read.csv("household_power_consumption.txt", sep=";")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")
esub <- energy[energy$Date=="2007-02-01"|energy$Date=="2007-02-02",]
esub$grp<-as.numeric(as.character(esub$Global_active_power))

fri <- min(which(esub$Date == "2007-02-02")) 
esub$weekday <- weekdays(esub$Date, abbreviate = TRUE)

esub$gap <- as.numeric(as.character(esub$Global_active_power))
plot(esub$gap, pch = ".", type = "n", axes = FALSE, xlab= "", ylab = "Global Active Power (kilowatts)") 
axis(side = 1, at = c(0, fri, sum(complete.cases(esub$gap))), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(0, 2, 4, 6), labels = c("0", "2", "4", "6"))
lines(esub$gap)
box()

dev.copy(png,"plot2.png")
dev.off()
