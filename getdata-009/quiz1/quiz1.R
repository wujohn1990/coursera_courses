library(RCurl)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              ,destfile = 'q1data.csv',method='curl')
q1data<-read.csv('q1data.csv')
sum(q1data$VAL==24,na.rm=T)

library(xlsx)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
              ,destfile = 'q3data.xlsx',method='curl')
dat<-read.xlsx('q3data.xlsx',sheetIndex = 1,rowIndex = 18:23,colIndex = 7:15)

library(XML)
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
q4data <- getURL(fileUrl)
q4data<-xmlTreeParse(q4data,useInternalNodes = T)
rootNode<-xmlRoot(q4data)
xmlName(rootNode)
zipcode<-xpathSApply(rootNode,"//zipcode",xmlValue)
sum(zipcode==21231)

library(data.table)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
              ,destfile = 'q5data.csv',method='curl')
DT<-fread('q5data.csv',sep=',')
system.time(DT[,mean(pwgtp15),by=SEX])
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

