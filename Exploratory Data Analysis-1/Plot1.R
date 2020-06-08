#loading data
NewData<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?")
NewData_1<-subset(NewData,Date=="1/2/2007"|Date=="2/2/2007")

#creating a png fille
png("Plot1.png",width=480,height=480)

#creating the plot
hist(as.numeric(as.character(NewData_1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
