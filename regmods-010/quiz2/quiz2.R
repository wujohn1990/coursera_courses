# Q1
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
m = lm(y~x)
summary(m)

# Q3
library(datasets)
data(mtcars)
m=lm(mpg~wt,mtcars)
mean(mtcars$mpg) - qnorm(0.975) * summary(m)$sigma*sqrt(1+1/nrow(mtcars))
newdata=as.data.frame(mean(mtcars$wt))
names(newdata)='wt'
predict(m, newdata,interval='prediction',level=0.95)

# Q5
newdata[1,1]=3
predict(m, newdata,interval='prediction',level=0.95)

# Q6
b1 = summary(m)$coefficients[2,1]
se = summary(m)$coefficients[2,2]
b1 - qt(0.975,nrow(mtcars)-1)*se

# Q9
1-summary(m)$r.squared




