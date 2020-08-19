


#6
z<-0
for(i in 1:20)
  z=z+i
z
#9
get.div<-function(x){
  v<-c()
  for(i in 1:x){
    if(x%%i==0){
      v[length(v)+1]<-i
    }
  }
  return(v)
}


myfunc <-function(x,y){
  a<-get.div(x)
  b<-get.div(y)
  return(a[a==b])
}
myfunc(8,8) #
}
result <- myfunc(50,20)
print(result)
#11
weight<-c(69,50,55,71,89,64,59,70,71,80)
which.max(weight)
which.min(weight)
which(weight>61|weight<69)
weight2<-which(weight<60)#인자가 논리형이야만 한다.뒤에 min같은 함수가 안붙어있으면
weight2

###중요! 저장하는 변수의 타입에 따라 달라진다!