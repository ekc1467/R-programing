#A<B,A<=B,A>B,A>=B,A==B,A!=B,A|B,A&B
d<-c(1:9)
d>=5
d[d>5]
sum(d>5)#5보다 큰 수의 개수. 부등호식이 boolean형식을 도출해서.(TRUE의 값은 1이다.)
sum(d[d>5])#boolean이 TRUE, 즉 5보다 큰 수의 합
d==5
d<-c(TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,TRUE,FALSE,TRUE)
sum(d)

condi <-d>5&d<8
d[condi]

#list
ds<-c(90,85,70,84)
my.info<-list(name="TOM",age=60,status=TRUE,score=ds)
my.info
my.info[[1]]
my.info$name
my.info[[4]]

#factor
bt<-c('a','b','b','c','c','d')
bt.new<-factor(bt)
bt
bt.new
bt[5]
bt.new[5]
levels(bt.new)
as.integer(bt.new)
bt.new[7]<-'b'
bt.new[8]<-'c'
bt.new

z<-matrix(1:20,nrow=4,ncol=5) #행렬을 정할 수 있다.
z
z2<-matrix(1:20,nrow=4,ncol=5,byrow = T) #행 위주로 나열한다.
z2

x<-1:4
y<-5:8
z<-matrix(1:20,nrow=4,ncol=5)

m1 <-cbind(x,y)
m2 <-rbind(x,y)
m3 <-rbind(m2,x)
m4 <-cbind(z,x)
m1
m2
m3
m4
m4[2,1:3]
m4[1,c(1,2)]
m4[1:2,]
m4[,c(1,4)]

#num, log, char 같은 벡터들이 모이면 리스트, 더 사용하기 편하게 만든 것이 데이터 프레임
#차원 축소(모든 데이터는 합침으로서 2차원 데이터로 축소 가능)

?iris
str(iris)
iris
head(iris)
tail(iris)

dim(iris)
nrow(iris)
ncol(iris)
colnames(iris)

iris[,c(1:2)]
iris[,c(1,3,5)]
iris[,c("Sepal.lenth","Species")]
iris[1:5,]
iris[1:5,c(1:3)]

class(iris)
is.matrix(iris)
is.data.frame(iris)
is.logical("TRUE") #LOGICAL이 아니라 CHAR이다
is.logical("T")
is.numeric(3.14)
is.numeric("3.14")
#as함수로 형변환
#같은 칼럼은 형이 같으나 칼럼끼리는 다르다.(벡터)