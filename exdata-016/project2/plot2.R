NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data=NEI[ NEI$fips=="24510",]
data=aggregate(data$Emissions,by=list(data$year),FUN = sum)
names(data)=c('year','total_emissions')

png('plot2.png')
barplot(data$total_emissions,names.arg = data$year,xlab='year',
        ylab='total_emissions',main='total emission for each year in Baltimore')
dev.off()