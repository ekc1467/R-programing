x<-c(1,2,3)
y<-c("a","b","c")
z<-c(TRUE,TRUE,FALSE,1L)
x
y
z

typeof(x)
typeof(y)
typeof(z)

V1<-50:90
V1
V2<-c(1,2,5,50:90)
V2
v3<-c(100:1)
v3
v4<-100:1
v4
v5<-seq(1,101,3)
v5
v6<-seq(0.1,1.0,0.1)
v6
v7<-rep(1,times=5)
v7
v8<-rep(1:5,times=3)
v8
v9<-rep(c(1,5,9),times=3)
v9
v10<-rep(c(seq(1,10,2)),times=100)
v10

score<-c(90,80,70)
score
names(score)
names(score)<-c("john","tom","jane")
names(score)
score

d<-c(1,4,3,7,8)

v1<-c(1,5,7,8,9)
v1
v1[2]
v1[2]<-3
v1
v1[c(1,5)]<-c(10,20)
v1<-1:5
v1[c(1:5)]<-c(4:8)
v1
