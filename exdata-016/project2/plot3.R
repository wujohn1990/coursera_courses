NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data=NEI[ NEI$fips=="24510",]
data=aggregate(data$Emissions,by=list(data$year,data$type),FUN = sum)
names(data)=c('year','type','total_emissions')
data$year=as.factor(data$year)

library(ggplot2)
png('plot3.png',width = 800,height = 800)
g<-ggplot(data,aes(year,total_emissions))
g+geom_bar(stat = 'identity')+facet_wrap(~type)
dev.off()
