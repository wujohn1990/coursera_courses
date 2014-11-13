library(datasets)
data(iris)

tapply(iris$Sepal.Length,iris$Species,mean)

data(mtcars)
?mtcars
with(mtcars, tapply(mpg, cyl, mean))
