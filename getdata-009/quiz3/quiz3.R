# Q1
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              ,destfile = 'q1data.csv',method='curl')
q1data=read.csv('q1data.csv',header=T)
agricultureLogical<- (q1data$AGS==6) & (q1data$ACR==3)
head(which(agricultureLogical))

# Q2
library(jpeg)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
              ,destfile = 'q2pic.jpg',method='curl')
q2data=readJPEG('q2pic.jpg',native = T)
quantile(q2data,probs = c(0.3,0.8))

# Q3
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
              ,destfile = 'q3a.csv',method='curl')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv '
              ,destfile = 'q3b.csv',method='curl')
q3a=read.csv('q3a.csv',header=F,skip=5,nrow=190)
q3b=read.csv('q3b.csv',header=T)
length(intersect(q3a$V1,q3b$CountryCode))
q3data=merge(q3a,q3b,by.x = "V1",by.y = "CountryCode",all = T)
q3data=q3data[order(q3data$V2,decreasing = T),]
q3data[1:20,'V4']

aggregate(q3data$V2,by=list(q3data$Income.Group),mean,na.rm=T)

library(Hmisc)
q3data$group = cut2(q3data$V2,g = 5)
table(q3data$Income.Group,q3data$group)

