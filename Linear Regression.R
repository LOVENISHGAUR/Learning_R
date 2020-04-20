#******************************************************************************
#*                                                                            *    
#*                          Linear Regression                                 *
#******************************************************************************

# Regression: Predict a numerical outcome ("dependent variable") from a set 
# of inputs ("independent variables").The relationship can be linear or non-linear.

# The basic function of regression is to identify statistically significant 
# independent variables and estimate the model parameters.

# How many units will we sell? (Regression)
# Will this customer buy our product (yes/no)? (Classification)
# What price will the customer pay for our product? (Regression)

#Example:
    
#    Y = A + Bx +e

# Here, Y is a dependent variable, whereas A. B are independent variables 
# and e is the error.

#******************************************************************************
# TYPES OF REGRESSION
#   >. SIMPLE REGRESSION(One independent variable)
#       1 . Linear
#       2 . Non Linear
#   >. Multiple REGRESSION(More than one independent variable)
#       1 . Linear
#         1.1 Simple Linear
#         1.2 Method of least square
#         1.3 Coefficient of multiple determination
#         1.4 Standard error of the estimate
#         1.5 Dummy Variable
#         1.6 Interaction
#       2 . Non Linear
#         2.1 Polynomial
#         2.2 Logarithmic
#         2.3 Square root
#         2.4 Reciprocal
#         2.5 Exponential

#******************************************************************************

# Hypothesis for linear regression

# In the Linear regression, dependent variable Y is linear combination of 
# the independent variables. Here regression function is known as hypothesis 

#******************************************************************************


x <- c(12,20,20,46,48,92,91,94,102,117,122,142,142,178,180,197,224,234,239,244,323)
y <- c(0.27, 0.14,0.33, 0.81, 0.84, 1.08, 1.87, 1.21,1.09,1.72,1.18, 1.01,1.90,1.98,1.53,2.71,2.41,1.61,2.51,2.15,3.16)

plot(x,y)

# Since the relationship is linear , let's predict Y based on X
lm.out <- lm(y~x)
lm.out
abline(lm.out)

# We can now create a test dataset and predict the value
test <- data.frame(x= c(120,130,140))
predict(lm.out,test)

# We can check the above result manually also
0.331070 + 0.008566 * 120
0.331070 + 0.008566 * 130
0.331070 + 0.008566 * 140

summary(lm.out)

#******************************************************************************

# MULTIPLE LINER REGRESSION
x1 <- c(45,41,47,39,41,43)
x2 <- c(27,27,25,24,22,23)
x3 <- c(42,37,37,28,18,18)
y <- c(90,84,90,80,86,84)


# x1 <- c(80,80,75,62,62,62)
# x2 <- c(27,27,25,24,22,23)
# x3 <- c(89,88,90,87,87,87)
# y <- c(42,37,37,28,18,18)

score <- data.frame(x1,x2,x3,y)
str(score)
head(score)

lm.out <- lm(y~x1+x2+x3,data = score)
summary(lm.out)

#predict
predicted <- predict(lm.out, data = score, type = "response")
predicted

#******************************************************************************

library(MASS)
data("mtcars")
str(mtcars)

lm.out1 <- lm(mtcars$mpg~., data = mtcars)
summary(lm.out1)

lm.out2 <- lm(mtcars$mpg~ am+wt+hp+disp+cyl, data = mtcars)
summary(lm.out2)

lm.out3 <- lm(mpg ~ wt + hp, data = mtcars)
summary(lm.out3)


#******************************************************************************

# CALCULATE ERROR
# 1. In sample error
# 2. out of sample error


# 1. In sample error
data("mtcars")
model <- lm(mpg ~ hp,mtcars[1:20,])
summary(model)

predicted <- predict(model, mtcars[1:20,], type = "response")
summary(predicted)
predicted

# Calculate RMSE
actual <- mtcars[1:20, "mpg"]
actual
sqrt(mean((predicted - actual)^2))

# 1. Out sample error
data("mtcars")
model <- lm(mpg ~ hp, data = mtcars[1:20,])
summary(model)

predicted <- predict(model, mtcars[21:32,], type = "response")
predicted

actual <- mtcars[21:32, "mpg"]
actual
sqrt(mean((predicted - actual)^2))


# Over fitting and Under fitting
# High Bias (under fitting)
# High Variance ( over fitting)
# Bias : How much on an average are the predicted values different from the actual values.
# Variance : How different were the prediction of model be at the same point if different samples are taken from the population.
# How to get optimum model complexity?
#   1. Get more training data : Fix High variance
#   2. Try smaller set of features : FIx High variance
#   3. Adding Features : Fix high bias
#   4. Adding polynomial Features : Fix High Bias
#   5. Regularize model parameters : Fix high variance.

# K FOLD CROSS VALIDATION : IT get rid of the over fitting and under fitting problem
#   1.  In K fold cross validation we divide the data set into K sets rather than dividing it 
#       into test and train data set. Then we keep one fold as test data set and train the model
#       on K-1 sets.
#   2.  repeat the process K times and note the error in each cycle.
#   3.  Take the average of error from all K trails.
#   4.  Build the model with whole data nd state the error  computed in last state

# Cross validation
install.packages("caret")
library(caret)  # Automate the training and testing process
library(lattice)
library(ggplot2)
data("mtcars")
set.seed(427)

# Fit linear model

model <- train(mpg ~ hp, data = mtcars,
               method = "lm",
               trControl = trainControl(
                   method = "cv", # Cross validation method
                   number = 10,# Number of Iterations
                   verboseIter = TRUE # Write each step in console for better understanding
               )
            )

predicted <- predict(model, mtcars[21:32,])

actual <- mtcars[21:32, "mpg"]
sqrt(mean(predicted - actual)^2)

#******************************************************************************
# Assumptions of linear regression
# 1. Linear functional form
# 2. Independent observation
# 3. Normality of the residuals or errors.
# 4. Homogeneity of residual error.
# 5. no Multicolinearity
# 6. No auto correlation
# 7. no outlier distortion.

#******************************************************************************

# CORRELATION
#   It is defined as the examination of linear relationship between independent and dependent variable
# Correlarion is only measured on numerical data.
# Formula    r = cov(xy)/(sd(x)*sd(y))

# Correlation and regression
data("mtcars")
cor(mtcars)

install.packages("corrplot")
library(corrplot)

str(mtcars)
corrplot(cor(mtcars))

#******************************************************************************

# coefficient of determination or correlation

# R2 is another important measure of linear association between x and y.
# R2 measure the proportion of the total variation in y which is explained by x.
# For example R2 = .8751, indicates that 87.51 % of variation in Y is explained by the independent variable x.

# Formula  R^2 = 1 - (SSE/SST)  = 1 - ((var(e)/var(y)))

#******************************************************************************

# variance Inflation factor (VIF) is a relative measure of the increase in the variance because of collinearity.
# The Higher the value, the higher the collinearity.

# If the VIF is in the range more than >5 then it indicates that collinearity exist.
# If A VIF for a single explanatory variable is obtained using the R-squared value of the regression of that variable against all other explanatory variables:

# Interpretation: The square root of the variance inflation factor indicates how much larger the standard error is, compared with what it would be if that variable are uncorrelated with the other predictor variables in the model.
# that predictor variable is 2.3 times as large as it would be if that predictor

# Example: If the variance inflation factor of a predictor variable were 5.27 (V5.27 = 2.3) this means that the standard error for the coefficient of variable are uncorrelated with the other predictor variables.

install.packages("car")
library(car)

data("mtcars")
model <- lm(mpg~. , data = mtcars)
vif(model)


# Removing multicolinearity. using VIF
model1 <- lm(mpg~. , data = mtcars)
vif(model1)

model2 <- lm(mpg~cyl+hp+drat+wt+qsec+vs+am+gear+carb, data = mtcars)
vif(model2)

model3 <- lm(mpg~+hp+drat+wt+qsec+vs+am+gear+carb, data = mtcars)
vif(model3)

model4<- lm(mpg~+hp+wt+vs+am+gear+carb, data = mtcars)
vif(model4)


final_model <- model4
summary(final_model)


# There must be linear relationship between independent and dependent variables.
# Multiple regression suffers from multi collinearity, autocorrelation, heteroskedasticity.
# Linear Regression is very sensitive to Outliers. It can terribly affect the regression line and eventually the forecasted values.
# Multi-collinearity can increase the variance of the coefficient estimates and make the estimates very sensitive to minor changes in the model. The result is that the coefficient estimates are unstable
# In case of multiple independent variables, we can go with forward selection, backward elimination and step wise approach for selection of most significant independent variables.
# Regression regularization methods(Lasso, Ridge and ElasticNet) works well in case of high dimensionality and multi-collinearity among the variables in the data set.

#******************************************************************************


# R2 can be interpreted as the proportion of the variance in y explained by the regression.
# Every time a new explanatory variable is added to a model, the R 2 increases.
# Adjusted R2 is an attempt to account for additional variables.
# The model with the best adjusted R 2 is best.
# But this method is flawed with overfitting So, R2 and adjusted R2 measure closeness of fit, but are poor selection.

#******************************************************************************

# Model selection

# AIC and BIC are widely used in model selection criteria.
# AIC : Akaike’s Information Criteria
# BIC : Bayesian Information Criteria
# AIC and BIC penalize additional parameter.
# Lesser the AIC and BIC better the model.
#******************************************************************************

# Variable selection

# Looking at individual p-values can be misleading.if you have variables that are 
# collinear(have high correlation), you will have high P-value. this does not means 
# that the variables are useless.

# As quick rule of thumb, selecting your model with AIC value is better than looking 
# at the p-value.

# Note that model selection and prediction accuracy are distinct problems. If your goal
# is to get accurate prediction it is suggested to cross validate your model by selecting 
# our data in a training and testing set.

#******************************************************************************

# Stepwise Regression Variable selection

# Stepwise Regression is a variable selection procedure for independent variables.
# In this technique, the selection of independent variables is done with the help 
# of an automatic process, which Involves no human intervention.
# This feat is achieved by observing statistical values like R-square, t-stats and 
# AIC metric to discern significant variables.
# Stepwise regression basically fits the regression model by adding/dropping covariates 
# one at a time based on a specified criterion. 
# Some of the most commonly used Stepwise regression methods are listed below:
#   1. Standard stepwise regression does two things. It adds and removes predictors 
#       as needed for each step.
#   2. Forward selection : starts with most significant predictor in the model and adds 
#       variable for each step.
#   3. Backward elimination : starts with all predictors in the model and removes the 
#       least significant variable for each step
# The aim of this modeling technique is to maximize the prediction power with minimum 
#  number of predictor variables.
# It is one of the method to handle higher dimensionality of data set.

#******************************************************************************

install.packages("MASS")
library(MASS)
data(mtcars)

# Compare all the possible models.
no_data <- lm(mpg~1, data = mtcars) # Testing with only intercept
summary(no_data)
extractAIC(no_data)

full_data <- lm(mpg~., data = mtcars) # testing with all the parameters
summary(full_data)
extractAIC(full_data)

# Backward elimination : starts with all predictors in the model and removes the 
# least significant variable for each step.
# It decide final set of variables based on their AIC value

stepAIC(full_data, direction = "backward")

# Check result and get the final set of predictors
finalModel <- lm(mpg~am+wt+qsec, data = mtcars)
summary(finalModel)

# Forward selection : starts with most significant predictor in the model and adds 
# variable for each step.


stepAIC(no_data, scope = list(lower = no_data, upper = full_data), direction = "forward")

# Check result and get the final set of predictors
finalModel1 <- lm(mpg~wt + cyl + hp, data = mtcars)
summary(finalModel1)


# both
stepAIC(no_data, scope = list(lower = no_data, upper = full_data), direction = "both")
extractAIC(finalModel1)

#******************************************************************************

#   stepwise regression Vs multi collinearity

# Remove multi collinearity using VIF
install.packages("car")
library(car)

model1 <- lm(mpg ~., data = mtcars)
vif(model1)

# removing disp
model2 <- lm(mpg ~cyl+hp+wt+qsec+vs+am+gear+carb, data = mtcars)
vif(model2)

# removing cyl
model3 <- lm(mpg ~hp+wt+qsec+vs+am+gear+carb, data = mtcars)
vif(model3)

# removing qsec
model4 <- lm(mpg ~hp+wt+vs+am+gear+carb, data = mtcars)
vif(model4)

final_model <- model4
summary(final_model)

#******************************************************************************

# Once the multi collinearity has bee removed e can do stepwise regression for final variable
# selection

stepAIC(final_model, direction = "backward")

finalModel <- lm(mpg~hp + wt + vs + am, data = mtcars)
summary(finalModel)

#******************************************************************************

# DUMMY Variable
install.packages("readxl")
library(readxl)
?readxl
library(car)
getwd()
setwd("/Users/lovenishgaur/Documents/DataAnalyst/Learning_R/Dataset/")
LungCapData <- read_excel("LungCap.xls")

str(LungCapData)

# Checking the missing value
table(is.na(LungCapData))

# Creating a model
model1 <- lm(LungCapData$`LungCap(cc)`~ LungCapData$Smoke, data = LungCapData)
summary(model1)

model2 <- lm(LungCapData$`LungCap(cc)`~ LungCapData$Gender, data = LungCapData)
summary(model2)

model3 <- lm(LungCapData$`LungCap(cc)`~ ., data = LungCapData)
summary(model3)
