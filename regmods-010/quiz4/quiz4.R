# Q1

library(MASS)
data(shuttle)
glmfit = glm(use~wind+magn,data=shuttle,family='binomial')
summary(glmfit)
exp(glmfit$coefficients)


# Q4
data(InsectSprays)
poissonfit = glm(count~spray,data=InsectSprays,family='poisson')
summary(poissonfit)
exp(poissonfit$coefficients)


# Q6
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
plot(x,y)
knot=c(0)
splineTerms = sapply(knot,function(knot) (x>knot)*(x-knot))
fit = lm(y~x+splineTerms)
plot(fit)
