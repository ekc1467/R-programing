vector()
factor()
list()
matrix()
data.frame()

v1<-vector(length=2)
v1
v1[1]<-T
v1[1]
v1[2]<-3
v1[3]<-"hello"
v1

v2<-c(1:3,"M","F","M","M","F")
v2
v3<factor(v2) #원소의 분류로 치기 때문에 5개가 된다.

lst<-list(name="joonion",age=20,height=180)
lst$name

m1<-matrix(nrow = 3,ncol=4)
m1
m2<-matrix(1:12, nrow=3, ncol=4)
m2
m3<-matrix(1:12, nrow=3, ncol=4, byrow=T)
m3

v1<-c(1,2,3)
v2<-c("홍길동","전우치","주니온")
v3<-factor("m","m","f")
df1<-data.frame(id=v1, name=v2, gender=v3)
df1

setwd("D:/")
write.csv(df1, "test.csv")
write.csv(df1, "test2.csv",row.names = FALSE)#칼럼네임이 사라짐.

df2<-read.csv("test2.csv", header = T)
df2
#복소수
c1<-3+4i
c1
c2<-4+2i
c2
c1+c2
c1*c2

m1<-matrix(1:4,2,2)
m1
m2<-matrix(4:1,2,2)
m2
m1+m2
m1*m2
#행렬 연산산
m1%%m2
v1<-1:5
v2<-1:2
v1+v2
v3<-(1:5)*5
v3

seq(1,100,2) #홀수수
v1<-1:100
v[seq(1,100,2)]#r은 벡터안에 벡터를 넣을 수 있다.
v%%2
v%%2 ==1
v[v%%2==1]#true인 벡터들만 뽑아낸다.

df2
df2[c(1,3),] #원하는 데이터 프레임을 뽑는법
df2[-c(1,3),] #제외하고 뽑는법
df2[,c(1,3)] #로우와 달리 칼럼은 뽑으면 벡터 또는 팩터가 된다.
df2[,-c(1,3)]

x<c(1,2,3,4,5)
ifelse(x%%2 == 1,T,F)

v<-c(1,3,5,7,9)
sum(v)
max(v)
sapply(v,mean)

sqrd<-function(x)x*x
sqrd #함수가 저장된다.

cubed<-function(x, my.sqrd)x*sqrd(x)
cubed(3,sqrd)
cubed<-function(x,f)x*f(x)
cubed(3,sqrd)

pentagon<-function(x,y)y(x)
pentagon(2,function(z)(z**))
#이 함수는 y와 같고 위의 함수와 서로 다른 매개변수로 들어간 익명 함수이다.
plot(iris)
