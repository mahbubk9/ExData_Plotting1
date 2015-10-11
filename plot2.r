
file <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings = "?")
file$Date<-as.Date(file$Date,"%d/%m/%Y")
subdat1<-file[file$Date=="2007-02-01",]
subdat2<-file[file$Date=="2007-02-02",]
pwrdf<-rbind(subdat1,subdat2)
Pwrdata<-pwrdf[complete.cases(pwrdf),]
Pwrdata$timetemp <- paste(Pwrdata$Date, Pwrdata$Time)
Pwrdata$datetime <- strptime(Pwrdata$timetemp, format = "%Y-%m-%d %H:%M:%S")
with(Pwrdata, plot(datetime,Global_active_power,type = "l"))
dev.copy(png,file="plot2.png")
dev.off()