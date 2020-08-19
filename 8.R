z <- c(1,2,3,NA,5,NA,8)      
sum(z)                       
is.na(z)                     
sum(is.na(z))                
sum(z, na.rm=TRUE)           
############
z1 <- c(1,2,3,NA,5,NA,8) # 결측값이 포함된 벡터 z1
z2 <- c(5,8,1,NA,3,NA,7) # 결측값이 포함된 벡터 z2
z1[is.na(z1)] <- 0 # NA를 0으로 치환
z1
z3 <- as.vector(na.omit(z2)) # NA를 제거하고 새로운
#벡터 생성
z3
############################
# NA를 포함하는 test 데이터 생성
x <- iris
x[1,2]<- NA; x[1,3]<- NA
x[2,3]<- NA; x[3,4]<- NA
head(x)

############################

# for문을 이용한 방법
for (i in 1:ncol(x)) {
  this.na <- is.na(x[,i])
  cat(colnames(x)[i], "\t", sum(this.na), "\n")
}
# apply를 이용한 방법
col_na <- function(y) {
  return(sum(is.na(y)))
}
na_count <-apply(x, 2, FUN=col_na)
na_count
###################################
rowSums(is.na(x)) # 행별 NA의 개수
sum(rowSums(is.na(x))>0) # NA가 포함된 행의 개수
sum(is.na(x)) # 데이터셋 전체에서 NA 개수
#########################################
head(x)
x[!complete.cases(x),] # NA가 포함된 행들 출력
y <- x[complete.cases(x),] # NA가 포함된 행들 제거
head(y) # 새로운 데이터셋 y의 내용 확인
#####################################
st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out

#######################################
out.val <- boxplot.stats(st$Income)$out # 특이값 추출
st$Income[st$Income %in% out.val] <- NA # 특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),] # NA가 포함된 행 제거
head(newdata) 
##############################
x<-7/3
x
x<-7%/%3
x
x<-7%%3
x

x<-c(1,2,3)
y<-c(4,2,3)
x %in% y #x가 y에 있는지 확인한다.
3 %in% x #3이 x에 있는지 확인한다.
x %in% 3  #x의 안의 값을 3벡터과 비교해서 확인한다. (3,3,3)로 늘려서 확인.
x %in% 4 #x의 안의 값에 4벡터가 있는지 확인한다. (4,4,4)로 늘려서
######################################
v1 <- c(1,7,6,8,4,2,3)
order(v1) #V1이 나열 됐을 때 나열된 숫자들의 원래 위치
v1 <- sort(v1) # 오름차순
v1
v2 <- sort(v1, decreasing=T) # 내림차순
v2
v1[order(v1)]
###############샘플링######################
x <- 1:100
y <- sample(x, size=10, replace = FALSE) # 비복원추출
y #중복 제거 결과
##################
x <- 1:100
y <- sample(x, size=10, replace = T) # 비복원추출
y#즁복 결과

y<-sample(x,size = 10) #값이 매번 달라져 문제를 모를 경우 시드를 준다.

set.seed(24)
for (i in 1:10){
  y<-sample(x, size=10)
  print(y)
  } #seed가 안에 없어서 값이 계속 다르게 나온다.


for (i in 1:10){
  set.seed(24)
  y<-sample(x, size=10)
  print(y)
}

#1에서 100까지 뽑을 때 균일환 분포(확률)을 가지고 뽑힌다.
#하지만 정규분포를 따라야한다.

?rnorm
x <- 0:100
y <-rnorm(x, mean=50, sd =1)#sd는 분산 값값
summary(y)

#############typeof와 str로 항상 확인하자############
head(iris)
order(iris$Sepal.Length) #$는 컬럼 접근 외우기
iris[order(iris$Sepal.Length),] # 오름차순으로 정렬
iris[order(iris$Sepal.Length, decreasing=T),] # 내림차순으로 정렬
iris.new <- iris[order(iris$Sepal.Length),] # 정렬된 데이터를 저장
head(iris.new)

iris[order(iris$Species, -iris$Petal.Length, decreasing=T),] #
#정렬 기준이 2개. -를 붙이면 그 부분은 반대가 된다.


#데이터 분리
sp <- split(iris, iris$Species) # 품종별로 데이터 분리
sp # 분리 결과 확인
summary(sp) # 분리 결과 요약
sp$setosa # setosa 품종의 데이터 확인
#######################

subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 &
         Sepal.Width > 3.9)
subset(iris, Sepal.Length > 7.6,
       select=c(Petal.Length,Petal.Width))

##################################
combn(1:5,3) # 1~5에서 3개를 뽑는 조합
x = c("red","green","blue","black","white")
com <- combn(x,2) # x의 원소를 2개씩 뽑는 조합
com
for(i in 1:ncol(com)) { # 조합을 출력
  cat(com[,i], "\n")
}########그룹바이 계산######################

agg <- aggregate(iris[,-5], by=list(iris$Species), FUN=mean)
agg

################################

agg <- aggregate(iris[,-5], by=list(표준편차=iris$Species),
                 FUN=sd)
agg

#################################
head(mtcars)
agg <- aggregate(mtcars, by=list(cyl=mtcars$cyl,
                                 vs=mtcars$vs),FUN=max)
agg

################데이터 병합#################
x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(name=c("a","b","d"), korean=c(75,60,90))
x
y
#################################
z <- merge(x,y, by=c("name")) # 기준되는 열에서 서로 같은 인덱스만 표시
z
############## 기준열이 맞지않아도 추가하는 법###################
merge(x,y, all.x=T) # 첫 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, all.y=T) # 두 번째 데이터셋의 행들은 모두 표시되도록
merge(x,y, all=T) # 두 데이터셋의 모든 행들이 표시되도록

###############모두 표시################
x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(sname=c("a","b","d"), korean=c(75,60,90))
x # 병합 기준 열의 이름이 name
y # 병합 기준 열의 이름이 sname
merge(x,y, by.x=c("name"), by.y=c("sname"))
