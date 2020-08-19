wt <-mtcars$wt # 중량 자료
mpg <- mtcars$mpg # 연비 자료
plot(wt, mpg, # 2개 변수(x축, y축)
     main="중량-연비 그래프", # 제목
     xlab="중량", # x축 레이블
     ylab="연비(MPG)", # y축 레이블
     col="red", # point의 color
     pch=19) # point의 종류


vars <- c("mpg","disp","drat","wt") # 대상 변수
target <- mtcars[,vars]
head(target)
pairs(target, # 대상 데이터
      main="Multi Plots")


iris.2 <- iris[,3:4] # 데이터 준비
point <- as.numeric(iris$Species) # 점의 모양
point # point 내용 출력
color <- c("red","green","blue") # 점의 컬러
plot(iris.2,
     main="Iris plot",
     pch=c(point),
     col=color[point])

####################################################
beers = c(5,2,9,8,3,7,3,5,3,5) # 자료 입력
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07, # 자료 입력
         0.06,0.02,0.05)
tbl <- data.frame(beers,bal) # 데이터프레임 생성
tbl
plot(bal~beers,data=tbl) # 산점도
res <- lm(bal~beers,data=tbl) # 회귀식 도출
abline(res) # 회귀선 그리기
cor(beers,bal) # 상관계수 계산

###################################### 아웃라이어 빼기;
beers = c(5,2,9,8,3,3,5,3,5) # 자료 입력
bal <- c(0.1,0.03,0.19,0.12,0.04,0.07, # 자료 입력
         0.06,0.02,0.05)
tbl <- data.frame(beers,bal) # 데이터프레임 생성
tbl
plot(bal~beers,data=tbl) # 산점도
res <- lm(bal~beers,data=tbl) # 회귀식 도출
abline(res) # 회귀선 그리기
cor(beers,bal) # 상관계수 계산

#########################################
install.packages("mlbench")
library(mlbench) #라이브러리 로딩
?BostonHousing
data("BostonHousing")
str(BostonHousing)
summary(BostonHousing)
head(BostonHousing)

plot(iris)
###########################################

summary(BostonHousing$medv)
########################################
myds<-BostonHousing[,c("crim","rm","dis","tax","medv")]
grp<-c()
for(i in 1:nrow(myds)){
  if(myds$medv[i]>=25.0){
    grp[i]<-"H"
  }else if(myds$medv[i]<=17.0){
    grp[i]<-"L"
  }else{
    grp[i]<-"M"
  }
}
grp<-factor(grp)
grp<-factor(grp,levels=c("H","M","L"))

myds<-data.frame(myds,grp)
myds
str(myds)
head

#############################
my.df<-BostonHousing[,c("crim","rm","dis","tax","medv")]
head(my.df)
grp<-ifelse(my.df$medv>25,"H", ifelse(my.df$medv<17,"L","M"))
grp #줄이는 방식
##################################################
my.df<-BostonHousing[,c("crim","rm","dis","tax","medv")]
my.df$grp<-ifelse(my.df$medv>25,"H", ifelse(my.df$medv<17,"L","M"))
my.df$grp<-factor(my.df$grp, levels=c("H","M","L"))
my.df$grp #더 줄이는 방식

#데시벨, 진도 등은 로그 배의 차이가 난다. 즉 지수배를 로그 취하면 인간의 감각과 선형이 된다.
#상관 관계가 높으면 인과관계가 있을 수는 있지만 인과관계라고 단정 지으면 안된다.
#다음 시간에 빈 값이 있는 결측치나 아웃라이더를처리하여 사용하는 방법을 배운다.