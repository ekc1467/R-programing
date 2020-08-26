# Feature Engineering

# Load preprocessed data
processed <- read.csv('./titanic/full.processed.csv')
processed
head(processed)
train <- processed[!is.na(Survived), ]

# Logistic Regression
?glm
attach(train)
formul <- factor(Survived) ~ 
          Pclass + Title + NumFamily + Gender + Fare
fit_logit <- glm(formula = formul,
                 data = train, 
                 family = binomial)
fit_logit

?round
pred <- round(fit_logit$fitted.values)
pred
mean(train$Survived == pred)
table(train$Survived) #atucal 값
table(pred) #예측값

#위의 값으로 혼돈행렬 만들기
TP <- sum(train$Survived == 1 & pred == 1)
TN <- sum(train$Survived == 1 & pred == 0)
FP <- sum(train$Survived == 0 & pred == 1)
FN <- sum(train$Survived == 0 & pred == 0)
conf_matrix <- data.frame(c(TN, FN), c(FP, TP), 
                          row.names = c('Truth.F', 'Truth.T'))
names(conf_matrix) <- c('Predict.N', 'Predict.P')
conf_matrix

# 정확도
accuracy <- (TP + TN) / (TP + FP + TN + FN)
# 정밀도
precision <- TP / (TP + FP)
# 민감도(재현율)
recall <- TP / (TP + FN)
sensitivity <- recall
# 특정율
specificity <- TN / (TN + FP)
# F1 점수
F1_score <- 2 * precision * recall / (precision + recall)

#다양한 알고리즘을 이용해 f1점수 낮춰보기
#값의 모양이 산모양이면 선형 직선은 추축값이 낮을텐데 선형선 2개로 산만드는 것도 별로이며
#모든 값을 넣은 과적화로 구불구불한 선을 만들어 모든 점을 따라 오버피팅을 하면
#예측률은 높게 나오지만 정확도는 있는 데이터를 너무 피팅해서 오히려 낮게 나온다.

#cross validation