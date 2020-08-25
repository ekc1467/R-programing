head(state.x77)
my.data <- data.frame(state.x77)

newdata<-data.frame(my.data$Illiteracy,my.data$Murder)
model<-lm(my.data$Illiteracy~my.data$Murder,newdata)

test.data<-data.frame(cbind(c(0.5,1.0,1.5)))
test.data

model

my.data$Illiteracy

coef(model)[1] # b 값 출력
coef(model)[2] # W 값 출력
b<-coef(model)[1]
w<-coef(model)[2]
pred<-w*test.data+b
pred


