# Set Working Directory
setwd("C:/Data Science Docs/R Docs/R Files")

# Import Library
library(readxl)

# Load Data
data =read_excel("100 Sales Records.xlsx")
View(data)


# T-test Logic
ttest <- function(c1, c2, col1_name, col2_name) {
  
  ttest_rel = t.test(c1 ~ c2)
  ttest_pvalue = ttest_rel$p.value
  cat("P-value after applying T-test is :",ttest_pvalue,"\n")
  
  if(ttest_pvalue < 0.05) {
    cat("There is significance difference between",col1_name,"and",col2_name)
  } else {
    cat("There is no significance difference between",col1_name,"and",col2_name)
  }
  
}

# Anova Logic
annova <- function(c1, c2, col1_name, col2_name) {
  
  anova_rel = aov(c1 ~ c2)
  anova_pvalue = anova(anova_rel)$'Pr(>F)'[1]
  cat("P-value after applying anova test is :",anova_pvalue,"\n")
  
  if(anova_pvalue < 0.05) {
    cat("There is significance difference between",col1_name,"and",col2_name)
  } else {
    cat("There is no significance difference between",col1_name,"and",col2_name)
  }
  
}

# Chi-Square Logic
chisquare <- function(c1, c2, col1_name, col2_name) {
  
  chi_rel = chisq.test(c1, c2)
  chi_pvalue = chi_rel$p.value
  cat("P-value after applying chi-square test is :",chi_pvalue,"\n")
  
  if(chi_pvalue < 0.05) {
    cat("There is significance difference between",col1_name,"and",col1_name)
  } else {
    cat("There is no significance difference between",col1_name,"and",col2_name)
  }
  
}

# Correlation Logic
correlation <- function(c1, c2, col1_name, col2_name) {
  
  CR = cor(c1, c2)
  cat("Correlation value is :",CR,"\n")
  
  if(CR > 0.5) {
    cat("There is strong positive correlation between",col1_name,"and",col2_name)
  } else if(CR > 0) {
    cat("There is weak positive correlation between",col1_name,"and",col2_name)
  } else if(CR < -0.5) {
    cat("There is strong negative correlation between",col1_name,"and",col2_name)
  } else {
    cat("There is weak negative correlation between",col1_name,"and",col2_name)
  }
  
}

# Hypothesis Automation Logic
HypothesisAutomation <- function(col1, col2, col1_name, col2_name) {
  
  if(is.character(col1)) {
    if(is.character(col2)) {
      print("Apply Chi Square Test")
      chisquare(col1,col2,col1_name,col2_name)
    } else {
      if(length(unique(col1)) > 2) {
        print("Applying Anova Test")
        annova(col1,col2,col1_name,col2_name)
      } else {
        print("Applying T-test")
        ttest(col1,col2,col1_name,col2_name)
      }
    }
  } else {
    if (is.character(col2)) {
      if(length(unique(col2)) > 2) {
        print("Applying Anova Test")
        annova(col1,col2,col1_name,col2_name)
      } else {
        print("Applying T-test")
        ttest(col1,col2,col1_name,col2_name)
      }
    } else {
      print('Applying Correlation')
      correlation(col1,col2,col1_name,col2_name)
    }
  }
  
}


# Setting values and calling function to get output
col1_name = colnames(data)[9]
col2_name = colnames(data)[4]
HypothesisAutomation(data$Total_Profit,data$Sales_Channel,col1_name,col2_name)
