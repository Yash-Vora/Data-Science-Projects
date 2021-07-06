# Malaria Analysis


# Problem Statement : In this project we have to analyze or clean malaria data. Then build machine
# learning classification model to predict whether person is having malaria diseases or not and also
# regression model to predict mortality rate.


# Setting current working directory
setwd('C:/Data Science Docs/R Docs/R Projects/Project 3')


# Load data
df = read.csv('R_ML_Malaria_Analysis.csv')
View(df)


# Data Pre-processing

# Filter the Gujarat, Rajasthan and Maharashtra in state.
filter_state = subset(df,State == c('Gujarat','Rajasthan','Maharashtra'))
View(filter_state)

# Select the data where mortality is High and Very High.
filter_mortality = subset(df,rate == c('High','Very High'))
View(filter_mortality)

# Check null values in each column
for (i in colnames(df)) {
  cat('\n')
  print(i)
  print(table(is.na(df[,i])))
}

# Handling null values in "Mortality_rate" column
df[is.na(df[,"Mortality_rate"]),"Mortality_rate"] = mean(df[,"Mortality_rate"],na.rm = TRUE)
View(df)

# Rename the mortality column to mortality_category.
names(df)[names(df) == "rate"] = "mortality_category"
View(df)


# Working With Model


# Classification on mortality column.

# Check unique values with it's count 
table(df$mortality_category)

# Feature Selection
library(FSelector)
gain = gain.ratio(mortality_category~.,df)
View(gain)
imp_gain = subset(gain,attr_importance>0)
View(imp_gain)
imp_feat = df[,rownames(imp_gain)]
View(imp_feat)
imp_feat$mortality_category = df$mortality_category
new_df = imp_feat
View(new_df)

# Train Test Split
library(dplyr)
train = sample_frac(new_df,0.8)
View(train)
rown = as.numeric(rownames(train))
test = new_df[-rown,]
View(test)

# Decision Tree
library(rpart)
library(rpart.plot)
# Training model with training data
DT = rpart(mortality_category~.,train)
summary(DT)
# Plot Decision Tree
rpart.plot(DT)
# Testing model with testing data
DT_pre = predict(DT,test,type = "class")
View(data.frame(DT_pre))
# Confusion Matrix
DT_cm = table(test$mortality_category,DT_pre)
print(DT_cm)
# Check the accuracy of model
DT_accuracy = mean(test$mortality_category == DT_pre)
print(DT_accuracy)
# Check the error of model
DT_error = mean(test$mortality_category != DT_pre)
print(DT_error)
# or
#error = 1 - accuracy
#print(error)

# Random Forest
library(randomForest)
# Training model with training data
RF = randomForest(as.factor(mortality_category)~.,train)
summary(RF)
# Testing model with testing data
RF_pre = predict(RF,test,type = "class")
View(data.frame(RF_pre))
# Confusion Matrix
RF_cm = table(test$mortality_category,RF_pre)
print(RF_cm)
# Check the accuracy of model
RF_accuracy = mean(test$mortality_category == RF_pre)
print(RF_accuracy)
# Check the error of model
RF_error = mean(test$mortality_category != RF_pre)
print(RF_error)
# or
#error = 1 - accuracy
#print(error)


# Regression on mortality_rate.(drop the mortality column).
# Dropping mortality_category column
new_train = train[,-6]
View(new_train)
new_test = test[,-6]
View(new_test)
# Training model with training data
LM = lm(Mortality_rate~.,new_train)
summary(LM)
# Testing model with testing data
LM_pre = predict(LM,new_test)
View(data.frame(LM_pre))
# Check the accuracy of model
LM_accuracy = mean(new_test$Mortality_rate == LM_pre)
print(LM_accuracy)
# Check the error of model
LM_error = mean(new_test$Mortality_rate != LM_pre)
print(LM_error)
# or
#error = 1 - accuracy
#print(error)
