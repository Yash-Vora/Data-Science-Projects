# Employee Attrition Analysis


# Problem Statement : In this project we have to analyze or clean employee attrition data. Then build
# machine learning model to predict whether employee will retire or resign from the company or not.


# Setting current working directory
setwd('C:/Data Science Docs/R Docs/R Projects/Project 2')


# Load data
df = read.csv('R_ML_Employee_Attrition_Analysis.csv')
View(df)


# Data Pre-processing

# Check null values in each column
for (i in colnames(df)) {
  cat('\n')
  print(i)
  print(table(is.na(df[,i])))
}


# Working With Model

# Prepare a classification model with attrition as target
table(df$Attrition)
# Train Test Split
library(dplyr)
train = sample_frac(df,0.8)
View(train)
rown = as.numeric(rownames(train))
test = df[-rown,]
View(test)
# Logistic Regression
train$Attrition = ifelse(train$Attrition == "Yes",1,0)
LR = glm(Attrition~.,train,family = binomial(link = "logit"))
summary(LR)

# Identify & Predict the result class for given data
pre = predict(LR,newdata = test,type = "response")
View(data.frame(pre))
pred = ifelse(pre > 0.5,1,0)
View(data.frame(pred))

# Confusion Matrix
cm = table(test$Attrition,pred)
print(cm)

# Check the accuracy of model
accuracy = mean(test$Attrition == pred)
print(accuracy)

# Check the error of model
error = mean(test$Attrition != pred)
print(error)
# or
#error = 1 - accuracy
#print(error)
