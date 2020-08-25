state.x77

mydata<-state.x77

a<- kmeans(x=mydata, centers=5)
a
a$cluster
a$centers

std <- function(X) { 
  return((X-min(X)) /(max(X)-min(X)))
}


mydata<-apply(mydata,2,std)

a<-kmeans(x=mydata,centers=5)
a


#install.packages ("mlbench")
library(mlbench)
data("Sonar")
tr.idx<-c()
for(i in 1:200){
  if(i%%2==1){
   tr.idx[i]<-i
    }
  }#이것은 안된다. 왜냐하면 짝수의 벡터에 NA가 들어간다. 즉 벡터에 짝수 벡터들이 생겨져있는것. 따로 분리해야할듯
tr.idx
ds.tr<-Sonar[tr.idx,1:60]
ds.ts<-Sonar[-tr.idx,1:60]
cl.tr<-factor(Sonar[tr.idx,"Class"])#tr.idx안의 클래스라는 뜻으로 문장열로 집어넣어야함.
cl.ts<-factor(Sonar[-tr.idx,"Class"])
pred<-knn(ds.tr,ds.ts,cl.tr,k=3,prob=TRUE)
pred
cl.tr
