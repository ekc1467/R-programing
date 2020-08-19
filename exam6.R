#1
wt<iris$sepal.Length
mpg<iris$Sepal.Width
plot(wt,mpg,
     main="iris 데이터셋",
     xlab="꽃받침 길이",
     ylab="꽃받침 넓이",
     col="red",
     pch=19)

#2
library(mlbench)
data("Glass")
myds<-Glass
str(myds)
head(myds)

vars<-()