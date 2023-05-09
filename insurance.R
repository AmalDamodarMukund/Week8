insurance_data <- read.csv('insurance.csv')

str(insurance_data)

#convert Sex, smoker, region variables to factors

insurance_data$sex <- factor(insurance_data$sex) 
str(insurance_data)

insurance_data$smoker <- factor(insurance_data$smoker) 
str(insurance_data)

insurance_data$region <- factor(insurance_data$region)
str(insurance_data)

#Balance of the categorical variables
table(insurance_data$sex)
#female   male 
#662    676 

table(insurance_data$smoker)
#yes   no 
#274 1064 

table(insurance_data$region)
#southeast southwest northwest northeast 
#364       325       325       324 

#initial investigation of data
pairs(insurance_data)


install.packages("psych")
library(psych)
pairs.panels(insurance_data,
             smooth = FALSE,
             density = TRUE,
             method = "spearman",
             pch = 21,
             cor = TRUE,
             factor = TRUE)

#set the randomness - randomness will be same for everyone who set seed to same number
set.seed(1)

#model creation
#formula = dependent ~ independent, independent
attach(insurance_data)
model <- lm(formula = charges ~ ., data = insurance_data)
#selected columns
model <- lm(formula = charges ~ 
              age +
              sex +
              bmi +
              children +
              smoker +
              region,
              data = insurance_data)
model

summary(model)








