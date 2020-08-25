#학습
head(cars)
plot(dist~speed, data=cars) # 산점도를 통해 선형 관계 확인
model <- lm(dist~speed, cars) # 회귀모델 구하기(학습)
model
abline(model) # 회귀선을 산점도 위에 표시
coef(model)[1] # b 값 출력 #intercrpt 절편
coef(model)[2] # W 값 출력 #speed 기울기

#예측
#R squard:모든 오차의 제곱 합
#P-Value:위의 제곱근
#위의 것들로 신뢰성 예측
b <- coef(model)[1]
W <- coef(model)[2]
speed <- 30 # 주행속도
dist <- W*speed + b
dist # 제동거리
speed <- 35 # 주행속도
dist <- W*speed + b
dist # 제동거리
speed <- 40 # 주행속도
dist <- W*speed + b
dist # 제동거리


spped<-cars[,1]
pred<-W*speed+b
pred

compare <- data.frame(pred, cars[,2], pred-cars[,2])
colnames(compare) <- c('예상','실제','오차')
head(compare)
#다중선형 회귀분석
library(car)
head(Prestige)
newdata <- Prestige[,c(1:4)] # 회귀식 작성을 위한 데이터 준비
plot(newdata, pch=16, col="blue", # 산점도를 통해 변수 간 관계 확인
     main="Matrix Scatterplot")
mod1 <- lm(income ~ education + prestige + # 회귀식 도출
             women, data=newdata)
summary(mod1)

#iris 예시
newdata2=Sepal.Length(0:3)
mod1 <- lm(Sepal.Width ~ Sepal.Length, data=iris)
summary(mod1)

#stepAIC
library(MASS) # stepAIC( ) 함수 제공
newdata2 <- Prestige[,c(1:5)] # 모델 구축에 사용할 데이터셋 생성
head(newdata2)
mod2 <- lm(income ~ education + prestige +
             women + census, data= newdata2)
mod3 <- stepAIC(mod2) # 변수 선택 진행
mod3 # 변수 선택 후 결과 확인
summary(mod3) # 회귀모델 상세 내용 확인

