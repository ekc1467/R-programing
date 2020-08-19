#1
st<- data.frame(state.x77) #객체 타입이라서 데이터 프레임.
#
col_na <- function(y) {
  return(boxplot.stats(y$out)
}
na_count <-apply(st, 1, FUN=col_na)
na_count
#3
st[st %in% out.val]<-NA
#4
st2<-st[complete.cases(st),]
#5
st3<-sort(st2$Population,decreasing = T)
#6
st4<-sort(st2$Income,decreasing = F)
#7
st5<-sort(st2$Illiteracy,decreasing = T)
head(st5,n=10)


boxplot(st) #2번. 알고보니 데이터 프레임이라 apply가 불가능하다.
boxplot.stats(st$Area)
idx <- boxplot.stats(st$Area)$out
idx
st[st$Area %in% idx,]$Area <- NA
head(st)



