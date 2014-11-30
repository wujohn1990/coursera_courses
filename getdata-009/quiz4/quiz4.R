download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              ,destfile = 'q1data.csv',method='curl')
q1data<-read.csv("q1data.csv")
strsplit(names(q1data),split = "wgtp")[[123]]

q2data<-read.csv('getdata-data-GDP.csv')
q2data<-q2data$X.3[5:194]
q2data<-gsub(',','',q2data)
q2data<-as.numeric(q2data)
mean(q2data)

q3data<-read.csv('getdata-data-GDP.csv')
countryNames<-q3data$X.2[5:194]
grep("^United",countryNames)


q4data1<-read.csv('getdata-data-GDP.csv')
q4data1<-q4data1[5:194,]
q4data2<-read.csv('getdata-data-EDSTATS_Country.csv')
rownames(q4data1)=q4data1$X
rownames(q4data2)=q4data2$CountryCode
q4data<-merge(q4data1,q4data2,by.x="X",by.y="CountryCode")
length(grep("Fiscal year end: June 30",q4data$Special.Notes))

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
library(lubridate)
sum(year(sampleTimes)==2012)
sum((year(sampleTimes)==2012 & wday(sampleTimes)==2) )
