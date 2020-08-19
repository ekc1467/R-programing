#else까지 붙여야한다.
#조건문 대신 좀 더 줄여 사용할 수 있는 방법들

for(i in 1:5){
  print("*")
}

for(i in 1:9){
  for(x in 1:9)
  cat(i,'*',x,'=',x*i,'\n')
}

for(i in 1:20){
  if(i%%2==0){
    print(i)
    }
}
y<-matrix(nrow=9,ncol=9)
for(i in 1:9){
  for(x in 1:9){
    z<-matrix(nrow=10,ncol=1)
    z<-cat(i,'*',x,'=',x*i,'\n')
    y<-cbind(y,z)
}
}
n<-10
m<-100
sum<-0
for(i in n:m){
  sum<-sum+i
}
print(sum)

sum(1:100)

nu<-0
k<-0
#연습문제 1
for(i in 1:100){
  if(i%%3==0){
  nu<-nu+1
  k<-k+i
  }
}
print(k)
#2
for(i in 101:200){
  if(i%%3==0|i%%4==0){
    print(i)
  }
}
#3
x<-(1:24)
x
y<-(x[24%%x==0])
print(y)
#4

z<-0
y<-1
for(i in 10:1){
  z=z*i
  y=y+z
}
print(y)
#######################################
mymax<-function(x,y){#힘수명에 함수를 대입한다.
}

###############
mydiv <- function(x,y=2) {
  result <- x/y
  return(result)
}
mydiv(x=10,y=3) # 매개변수 이름과 매개변수값을 쌍으로 입력
mydiv(10,3) # 매개변수값만 입력
mydiv(10) # x에 대한 값만 입력(y 값이 생략됨)

v<-100:200
v
which(v%%3==0)
sum(v[which(v%%3==0)])#이런 식으로 조건문 사용하기 보다 줄여써야한다.

#함수를 변수에 저장할 수 있으므로 매개변수로도 사용 가능하다.
apply(iris[,1:4],1, mean)
#apply:데이터 프레임의 특정 부분에 쉽게 함수적용