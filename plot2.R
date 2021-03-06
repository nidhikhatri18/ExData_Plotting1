library("dplyr")
data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
finalData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

plot(finalData$Global_active_power~finalData$SetTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()