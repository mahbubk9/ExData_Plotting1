
file <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings = "?")
file$Date<-as.Date(file$Date,"%d/%m/%Y")
subdat1<-file[file$Date=="2007-02-01",]
subdat2<-file[file$Date=="2007-02-02",]
pwrdf<-rbind(subdat1,subdat2)
Pwrdata<-pwrdf[complete.cases(pwrdf),]
Pwrdata$timetemp <- paste(Pwrdata$Date, Pwrdata$Time)
Pwrdata$datetime <- strptime(Pwrdata$timetemp, format = "%Y-%m-%d %H:%M:%S")
hist(Pwrdata$Global_active_power,main= "Global Active Power",col = "red")
dev.copy(png,file="plot1.png")
dev.off()