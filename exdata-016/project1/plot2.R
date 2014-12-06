data<-read.table('household_power_consumption.txt',header=T,sep=';',na.strings = '?')
data$Date = as.Date(data$Date,format='%d/%m/%Y')
data = data[ data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]
# convert datetime
data$datetime = paste(as.character(data$Date),data$Time,sep = ' ')
data$datetime = strptime(data$datetime,format='%Y-%m-%d %H:%M:%S')

png('plot2.png') #defalt is 480x480

plot(data$datetime,data$Global_active_power,type='l',
     ylab='Global Active Power (kilowatts)',xlab='')

dev.off()
