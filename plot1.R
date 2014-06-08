energy <- read.csv("household_power_consumption.txt", sep=";")
energy$Date <- as.Date(energy$Date, "%d/%m/%Y")
esub <- energy[energy$Date=="2007-02-01"|energy$Date=="2007-02-02",]
esub$grp<-as.numeric(as.character(esub$Global_active_power))

hist(esub$grp, breaks = 15 , main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

dev.copy(png,"plot1.png")
dev.off()