## Quiz 3

## q1
subsetValue <- subset(iris, iris$Species == "virginica")
round(mean(subsetValue$Sepal.Length))

## q2
apply(iris[, 1:4], 2, mean)

## q3
with(mtcars, tapply(mpg, cyl, mean))

sapply(split(mtcars$mpg, mtcars$cyl), mean)

tapply(mtcars$mpg, mtcars$cyl, mean)

## q4
values <- sapply(split(mtcars$hp, mtcars$cyl), mean)
round(abs(values[3] - values[1]))

## q5
Execution suspends and browser opens.