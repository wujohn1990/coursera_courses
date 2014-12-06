data<-read.table('household_power_consumption.txt',header=T,sep=';',na.strings = '?')
data$Date = as.Date(data$Date,format='%d/%m/%Y')
data = data[ data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]

png('plot1.png') #defalt is 480x480

hist(data$Global_active_power,main = 'Global Active Power', 
     xlab='Global Active Power (kilowatts)',col='red')

dev.off()
