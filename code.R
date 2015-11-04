setwd("/Users/romain/Google\ Drive/stats_proba/exos/exploratory/W1")
nrj <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

dateAndTime <- paste(nrj$Date,nrj$Time)
nrj$dateAndTime <- strptime(dateAndTime, "%d/%m/%Y %H:%M:%S")
nrjSm <- subset(nrj, 
  as.numeric(difftime(as.Date(nrj$dateAndTime), as.Date("2007-02-01"), units = "days")) >= 0 
  & as.numeric(difftime(as.Date(nrj$dateAndTime), as.Date("2007-02-02"), units = "days")) <= 0)

png(file = "plot1.png", bg = "transparent")
with(nrjSm,hist(Global_active_power,xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))
dev.off()

png(file = "plot2.png", bg = "transparent")
with(nrjSm, plot(dateAndTime,Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.off()

png(file = "plot3.png", bg = "transparent")
with(nrjSm,{
  plot(dateAndTime,Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "")
  lines(dateAndTime,Sub_metering_2,col="red")
  lines(dateAndTime,Sub_metering_3,col = "blue" )
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=2)
})
dev.off()

png(file = "plot4.png", bg = "transparent")
par(mfcol = c(2,2),cex = 0.7)
#1st plot
with(nrjSm, plot(dateAndTime,Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)",xlab = ""))
#2nd plot
with(nrjSm,{
  plot(dateAndTime,Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "")
  lines(dateAndTime,Sub_metering_2,col="red")
  lines(dateAndTime,Sub_metering_3,col = "blue" )
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd=2,box.lwd = 0)
})

#3rd plot
with(nrjSm,plot(dateAndTime,Voltage,type = "l", ylab = "Voltage",xlab = "datetime"))
#4th plot
with(nrjSm, plot(dateAndTime,Global_reactive_power,type = "l", ylab = "Global_reactive_power",xlab = "datetime"))

dev.off()