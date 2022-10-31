rm = (list = ls())
framingham = read.csv("framingham.csv")
summary(framingham)
str(framingham)

#install.packages("caTools")

library(caTools)

set.seed(5)
split1 = sample.split(framingham,SplitRatio = 0.8)
split2 = sample.split(framingham$TenYearCHD,SplitRatio = 0.8)

Train = subset(framingham, split2==TRUE)
Test = subset(framingham, split2==FALSE)

model1 = glm(TenYearCHD ~ ., data = Train, family=binomial)
summary(model1)

model2 = glm(TenYearCHD ~ male+age+cigsPerDay+prevalentHyp+sysBP+glucose  , data = Train, family=binomial)
summary(model2)
