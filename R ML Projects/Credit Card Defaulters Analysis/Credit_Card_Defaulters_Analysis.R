# Credit Card Defaulters Analysis


# Problem Statement : In this project we have to analyze or clean credit card defaulters data. Here
# we are performing task like replacing null values & some data manipulation.


# Setting current working directory
setwd('C:/Data Science Docs/R Docs/R Projects/Project 1')


# Load data
df = read.csv('R_ML_Credit_Card_Defaulters_Analysis.csv')
View(df)

# Data Pre-processing

# Replace missing value with mean
for (i in 1:ncol(df)) {
  if (is.numeric(df[,i])) {
     df[is.na(df[,i]),i] = mean(df[,i],na.rm = TRUE)
  }
}
is.na(df)

# Drop default status column
df = df[,-16]
View(df)

# Select top 2000 rows
a1 = df[1:2000,]
View(a1)

# Select this column LIMIT_BAL, AGE, BILL_AMT1, PAY_AMT1
a2 = df[,c('LIMIT_BAL','AGE','BILL_AMT1','PAY_AMT1')]
View(a2)

# Select those data only who has , BILL_AMT1 more then 50000
a3 = subset(df,BILL_AMT1 > 50000,select = c('BILL_AMT1'))
View(a3)

# Check the correlation on BILL_AMT1 vs PAY_AMT1
a4 = cor(df$BILL_AMT1,df$PAY_AMT1)
cat("Correlation between",colnames(df)[4],"and",colnames(df)[10],"is :",a4)

# Rename the column BILL_AMT1 as Bill_amount and PAY_AMT1 as pay_amount
library(dplyr)
a5 = rename(df,Bill_amount = BILL_AMT1,pay_amount = PAY_AMT1)
View(a5)
