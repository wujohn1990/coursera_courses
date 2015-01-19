data(mtcars)
fit<-lm(mtcars$mpg~mtcars$wt+I(as.factor(mtcars$cyl)))
fit

fit1<-lm(mtcars$mpg~I(as.factor(mtcars$cyl)))
fit1


fit2<-lm(mtcars$mpg~mtcars$wt+I(as.factor(mtcars$cyl))*mtcars$wt)
summary(fit2)

lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)


x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
hatvalues(lm(y~x))


x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
dfbetas(lm(y~x))

