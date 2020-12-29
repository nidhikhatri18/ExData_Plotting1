library("dplyr")
data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(finalData, {
  plot(Global_active_power~SetTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~SetTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~SetTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~SetTime,col='Red')
  lines(Sub_metering_3~SetTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~SetTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


dev.copy(png,"plot4.png", width=480, height=480)
dev.off()