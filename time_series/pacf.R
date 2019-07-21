set.seed(42)
ar2 = arima.sim(n = 500, list(ar = c(0.5, 0.25)))
ar2 = arima.sim(n = 500, list(ar = c(0.9, -0.6)))
plot(ar2) 
acf(ar2)
acf(ar2, type="partial")


library(isdals)
data(bodyfat)
attach(bodyfat)
pairs(cbind(Fat, Triceps, Thigh, Midarm))

cor(cbind(Fat, Triceps, Thigh, Midarm))

Fat.hat = predict(lm(Fat ~ Thigh))
Triceps.hat = predict(lm(Triceps ~ Thigh))
cor((Fat - Fat.hat), (Triceps - Triceps.hat))

Fat.hat = predict(lm(Fat ~ Thigh+Midarm))
Triceps.hat = predict(lm(Triceps ~ Thigh+Midarm))
cor((Fat - Fat.hat), (Triceps - Triceps.hat))

library(ppcor)
pcor(cbind(Fat, Triceps, Thigh, Midarm))
