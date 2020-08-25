#(1)
mod <- lm(mpg~., data=mtcars)
summary(mod)
# 회귀식
mpg = 12.30337
-0.11144 * cyl
+0.01334 * disp
-0.02148 * hp
+0.78711 * drat
-3.7153 * wt
+0.82104 * qsec
+0.31776 * vs
+2.52023 * am
+0.65541 * gear
-0.19942 * carb
-0.19942 * carb
#(2)
library(MASS) # stepAIC() 함수 제공
mod2 <- stepAIC(mod) # 변수 선택 진행
summary(mod2)
# 회귀식
mpg = 9.6178
-3.9165 * wt
+1.2259 * qsec
2.9358 * am