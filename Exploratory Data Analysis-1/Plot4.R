#loading data
NewData<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
NewData_1<-subset(NewData,Date=="1/2/2007"|Date=="2/2/2007")

#Converting Date and Time
NewData_1$Date <- as.Date(NewData_1$Date, format="%d/%m/%Y")
NewData_1$Time <- strptime(NewData_1$Time, format="%H:%M:%S")

#creating a png file
png("Plot4.png",height=480,width=480)

NewData_1[1:1440,"Time"] <- format(NewData_1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
NewData_1[1441:2880,"Time"] <- format(NewData_1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#creating plot
par(mfrow=c(2,2))
with(NewData_1,{
  plot(NewData_1$Time,as.numeric(as.character(NewData_1$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(NewData_1$Time,as.numeric(as.character(NewData_1$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(NewData_1$Time,NewData_1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(NewData_1,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(NewData_1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(NewData_1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(NewData_1$Time,as.numeric(as.character(NewData_1$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()