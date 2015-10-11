file <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings = "?")
file$Date<-as.Date(file$Date,"%d/%m/%Y")
subdat1<-file[file$Date=="2007-02-01",]
subdat2<-file[file$Date=="2007-02-02",]
pwrdf<-rbind(subdat1,subdat2)
Pwrdata<-pwrdf[complete.cases(pwrdf),]
Pwrdata$timetemp <- paste(Pwrdata$Date, Pwrdata$Time)
Pwrdata$datetime <- strptime(Pwrdata$timetemp, format = "%Y-%m-%d %H:%M:%S")
par(mfrow=c(2,2))
with(Pwrdata, plot(datetime,Global_active_power,type = "l"))
with(Pwrdata, plot(datetime,Voltage,type = "l"))
plot(Pwrdata$datetime,Pwrdata$Sub_metering_1,main="Energy_Sub_metereing/datetime",xlab="datetime",ylab="Energy Sub metering", ylim=range(Pwrdata[c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]),type="l",col="black")
lines(Pwrdata$datetime,Pwrdata$Sub_metering_2,type="l",pch=2,col="red")
lines(Pwrdata$datetime,Pwrdata$Sub_metering_3,type="l",pch=3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
with(Pwrdata, plot(datetime,Global_reactive_power,type = "l"))
dev.copy(png,file="plot4.png")
dev.off()