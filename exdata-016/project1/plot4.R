data<-read.table('household_power_consumption.txt',header=T,sep=';',na.strings = '?')
data$Date = as.Date(data$Date,format='%d/%m/%Y')
data = data[ data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]
# convert datetime
data$datetime = paste(as.character(data$Date),data$Time,sep = ' ')
data$datetime = strptime(data$datetime,format='%Y-%m-%d %H:%M:%S')

png('plot4.png') #defalt is 480x480
par(mfrow=c(2,2))

# 1
plot(data$datetime,data$Global_active_power,type='l',
     ylab='Global Active Power',xlab='')
# 2
plot(data$datetime,data$Voltage,type='l',
     ylab='Voltage',xlab='datetime')
# 3
plot(data$datetime,data$Sub_metering_1,type='n',
     ylab='Energy sub metering',xlab='')
lines(data$datetime,data$Sub_metering_1)
lines(data$datetime,data$Sub_metering_2,col='red')
lines(data$datetime,data$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),lty=1,bty='n')
# 4
plot(data$datetime,data$Global_reactive_power,type='l',
     ylab='Global_reactive_power',xlab='datetime')

dev.off()
