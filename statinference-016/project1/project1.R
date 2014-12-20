# Q1

set.seed(0)
simdata<-NULL
for ( i in 1:1000){
  simdata<-c(simdata,mean(rexp(40,0.2)))
}
hist(simdata)
abline(v=5,lty=2,col='blue')
abline(v=mean(simdata),lty=2,col='red')
legend('topright',c('theretical','simulated'),lty=2,col=c('blue','red'))


qqnorm(simdata)
qqline(simdata)


hist(rexp(1000,0.2))


# Q2
library(datasets)
data(ToothGrowth)
summary(ToothGrowth)
par(mfrow = c(2,2))
hist(ToothGrowth$len[ToothGrowth$supp=='OJ'])
hist(ToothGrowth$len[ToothGrowth$supp=='VC'])
hist(ToothGrowth$dose[ToothGrowth$supp=='OJ'])
hist(ToothGrowth$dose[ToothGrowth$supp=='OJ'])

ToothGrowth$supp=as.factor(ToothGrowth$supp)
t.test(len~supp,ToothGrowth)
t.test(dose~supp,ToothGrowth)

