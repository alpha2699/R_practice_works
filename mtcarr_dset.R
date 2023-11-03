intall.packages("ggplot2")
library(ggplot2)

data(mtcars)
head(mtcars)

trAutom <-mtcars$mpg[mtcars$am==0]
trAutom
summary(trAutom)

trMVAR <-lm(mp~.,data = mtcars)
summary(trMVAR)
summary(trMVAR)$coeffiecients

trMVAR1 <- lm(mpg ~ cyl+disp+carb+vs+am, data = mtcars)
summary(trMVAR1)


# Prediction
aa <- data.frame(cyl=4,carb=2,vs=0,disp=120, am=0)
result <-  predict(trMVAR1,aa)
print(result)

# Prediction
aa1 <- data.frame(cyl=4,carb=2,vs=1,disp=120, am=1)
result <-  predict(trMVAR1,aa1)
print(result)

plot(mpg ~ am, data = mtcars, col="red")
abline(trLM,col="blue",lwd=2)

plot(mpg ~ carb, data = mtcars, col="red")
abline(trLM,col="blue",lwd=2)


