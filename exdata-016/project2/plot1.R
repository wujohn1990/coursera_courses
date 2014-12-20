NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data=aggregate(NEI$Emissions,by=list(NEI$year),FUN = sum)
names(data)=c('year','total_emissions')
png('plot1.png')
barplot(data$total_emissions,names.arg = data$year,xlab='year',
        ylab='total_emissions',main='total emission for each year')
dev.off()