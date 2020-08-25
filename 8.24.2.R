#훈련
iris.new<-iris
iris.new$Species<-as.integer(iris.new$Species)
head(iris.new)
mod.iris <- glm(Species ~., data= iris.new)
summary(mod.iris)
#예측
unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
unknown 
pred <- predict(mod.iris, unknown) 
pred 
round(pred,0)
pred <- round(pred,0)
pred
levels(iris$Species)
levels(iris$Species)[pred]

test.data<-data.frame(rbind(c(5.1,3.5,1.4,0.2),c(4.1,3.7,2.4,1.0)))
test.data
names(test.data)<-names(iris[1:4]) #이름을 넣는다.?
test.data
#mod에 넣어 예측을 하고 species라는 새로운 열에 만들어 넣는다.
test.data$Species<-round(predict(mod.iris,test.data)) #이렇게하면 바로옆에 붙어지는구나; 
test.data