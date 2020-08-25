library(class)
# 훈련용 데이터와 테스트용 데이터 준비
tr.idx <- c(1:25,51:75, 101:125) # 훈련용 데이터의 인덱스
ds.tr <- iris[tr.idx, 1:4] # 훈련용 데이터셋
ds.ts <- iris[-tr.idx, 1:4] # 테스트용 데이터셋
cl.tr <- factor(iris[tr.idx, 5]) # 훈련용 데이터셋의 그룹(품종) 정보
cl.ts <- factor(iris[-tr.idx, 5]) # 테스트용 데이터셋의 그룹(품종) 정보
pred <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE)
pred
acc <- mean(pred==cl.ts) # 예측 정확도
Acc
table(pred,cl.ts) # 예측값과 실제값 비교 통계

#k의 값이 너무 커지면 먼 이웃까지 포함되서 적당한 k를 찾아야한다.(연구에 의하면 대략 250명)