rm(list = ls())

# Let's read the dataset
framingham = read.csv("framingham.csv")
summary(framingham)


# Load the library caTools
library(caTools)

set.seed(5)
# split1 = sample.split(framingham,SplitRatio = 0.8) #Random sampling of columns
split2 = sample.split(framingham$TenYearCHD,SplitRatio = 0.8) #Random sampling of rows

# Split our dataset into train and test
train = subset(framingham, split2==TRUE)
test = subset(framingham, split2==FALSE)

# Run the logistic regression
model1 = glm(TenYearCHD ~ .,data = train,family = binomial)
summary(model1)

# Create a more accurate model
model2 = glm(TenYearCHD ~ male+age +cigsPerDay+prevalentHyp+sysBP+glucose,data = train,family = binomial)
summary(model2)
