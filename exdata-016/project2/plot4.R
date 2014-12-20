NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

selected = grep("Comb.*Coal",SCC$Short.Name)
selected = SCC[selected,'SCC']

data=NEI[ NEI$SCC %in% selected,]
data=aggregate(data$Emissions,by=list(data$year),FUN = sum)
names(data)=c('year','total_emissions')
data$year=as.factor(data$year)

png('plot4.png')
barplot(data$total_emissions,names.arg = data$year,xlab='year',
        ylab='total_emissions',main='total emission for each year')
dev.off()
