NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

selected = grep("motor.*vehicle",SCC$Short.Name,ignore.case = T)
selected = SCC[selected,'SCC']

bdata=NEI[ NEI$SCC %in% selected & NEI$fips=="24510",]
bdata=aggregate(bdata$Emissions,by=list(bdata$year),FUN = sum)
names(bdata)=c('year','total_emissions')

ldata=NEI[ NEI$SCC %in% selected & NEI$fips=="06037",]
ldata=aggregate(ldata$Emissions,by=list(ldata$year),FUN = sum)
names(ldata)=c('year','total_emissions')


png('plot6.png')
plot(ldata,type='b',ylim=c(10,70),lty=1,col='red',pch=19)
lines(bdata,type='b',lty=2,col='green',pch=19)
legend('bottomleft',legend = c('los angeles','baltimore'),lty=c(1,2),pch=19,col=c('red','green'))

dev.off()
