#loading data
NewData<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
NewData_1<-subset(NewData,Date=="1/2/2007"|Date=="2/2/2007")

#converting Date and Time
NewData_1$Date <- as.Date(NewData_1$Date, format="%d/%m/%Y")
NewData_1$Time <- strptime(NewData_1$Time, format="%H:%M:%S")

#creating a png file
png("Plot2.png",height=480,width=480)
NewData_1[1:1440,"Time"] <- format(NewData_1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
NewData_1[1441:2880,"Time"] <- format(NewData_1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#creating a plot
plot(NewData_1$Time,as.numeric(as.character(NewData_1$Global_active_power)),type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()