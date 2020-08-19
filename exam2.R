
#1
x<-c(10,40,60,20)
y<-c(21,60,70,30)
score<-cbind(x,y)
score
score[,2]
score[3,2]

#2
class(mtcars)
#3
dim(mtcars)
#4
class(ncol(mtcars))
#5
?mtcars
#6
MAXmpg<-subset(mtcars,mpg==max(mtcars[,1]))
rownames(MAXmpg)
#7
rownames(subset(mtcars,gear==4&&min(mtcars[,1])))

mpg.min <- min(mtcars[,1])
mpg.min 

rowgear<-rownames(mtcars,gear==4)

rownames(subset(mtcars, gear==4 && mpg==min(mtcars[,1])) )


#8
mtcars["Honda Civic",c("mpg","gear")]
