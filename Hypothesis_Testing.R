#AUTHOR : Lovenish Gaur

#HYPOTHESIS TESTING
#   A claim or statement about a parameter of a population.
#   Each hypothesis implies it's contradiction or alternative hypothesis.
#   It is either true or false
#   It can be rejected on the basis of trial testimony, evidence and sample data.

#1. NULL HYPOTHESIS
#   IT IS THE FIRST STEP IN HYPOTHESIS TESTING
#   H0: the null hypothesis;
#   IS USUALLY A HYPOTHEISIS OF "NO DIFFERENCE"
#   IS PERFORMED FOR 2 POSSIBLE REJECTION UNDER A TRUE ASSUMPTION.
#   IT IS HELD TRUE UNLESS SOME TEST RESULT IN IT'S REJECTION


#ALTERNATE HYPOTHESIS
#   COMPLEMENTARY TO NULL HYPOTHESIS
#   H1: the alternate hypothesis.
#   USED TO DECIDE WHETHER TO EMPLOY A SINGLE TAILED TEST OT TWO TAILED TEST.

#Hypothesis testing is formulated in terms of two hypotheses:
#   The hypothesis we want to test is if H1 is “likely” true.
#   So, there are two possible outcomes:
#    -> Reject H0 and accept H1 because of sufficient evidence in
#       the sample in favor or H1;
#    -> Do not reject H0 because of insufficient evidence to
#       support H1.

#   Note that failure to reject H0 does not mean the null
#   hypothesis is true. There is no formal outcome that says
#   “accept H0.” It only means that we do not have sufficient
#   evidence to support H1.

# ERROR IN SAMPLING
#   THE SAMPLING THEORY DRAWS ALID INFERENCES BOUT THE POPULATION PARAMETER 
#   ON THE BASIS OF SAMPLE RESULTS. IN PRACTICE, A LOT IS ACCEPTED OR REJECTED 
#   AFTER EXAMINING THE SAMPLE. Because we are making a decision based on a finite sample,


# TYPES OF ERROR 
#   The acceptance of H1 when H0 is true is called a Type I error.
#   The probability of committing a type I error is called the level
#   of significance and is denoted by α.
#   The lower significance level α, the less likely we are to commit
#   a type I error. Generally, we would like small values of α;
#   typically, 0.05 or smaller.

#   Failure to reject H0 when H1 is true is called a Type II error.
#   The probability of committing a type II error is denoted by β.
#   It is impossible to compute β unless we have a specific
#   alternate hypothesis.

# TYPES OF HYPOTHESIS TESTING
#   ONE TAILED
#       RIGHT TAILED
#       LEFT TAILED
#   TWO TALIED


# Steps of Hypothesis testing 
#   Set hypothesis and determine the level of significance
#       setup null hypothesis H0 from population parameter
#       setup alternate hypothesis H1
#       setup appropriate significance level.

# Compute test statistics


#*******************************************************************************
# Question : A chips company claims that maximum saturated fat content in the chips packet
# is 2 grams with std of .25.
# A test on a sample of 35 packets reveal that mean saturated fat is 2.1 grams
# Should the claims of Chips company be rejected.


#STEP1
# setup null hypothesis and Alternate hypothesis
#H0 : mu <= 2 : null hypothesis
#H1 : mu > 2 : Alternate hypothesis : upper tailed test.

#level of significance
alpha = .05

#STEP 2: compute the statistics
#Alternate hypothesis

#sample size is more than 30 so we need to calculate z statistics.
mu = 2 #population mean
xbar = 2.1 #sample mean
sigma = .25 #Population standard deviation
n = 35 # sample size
SE = sigma/sqrt(n) # sample standard deviation
z = (xbar - mu)/SE # z score
z

#STEP 3 : Compute the critical value for significance level =.05 or confidence interval = 95%
zalpha = qnorm(1 - alpha)
zalpha # critical value for 95% confidence interval


# STEP 4 : Compare the test statistics with critical value and conclude the test
#   Decision
#   if | z |  < zalpha ,z is of significant nd the null hypothesis  may, therefore be accepted.
#   if | z |  >= zalpha , z is significant and the null hypothesis will be rejected

z > zalpha
#conclusion
# with 95% confidence he claim that of at most 2 grams of saturated fat 
#in chips packet should be rejected. 

#*******************************************************************************


# Critical Values
# Determine the critical values zaplha of the test based on level of significance alpha
# Upper Tailed test
qnorm(0.90 , mean = 0, sd = 1 , lower.tail = TRUE)
qnorm(0.95 , mean = 0, sd = 1 , lower.tail = TRUE)
qnorm(0.99 , mean = 0, sd = 1 , lower.tail = TRUE)

# lower tailed test
qnorm(0.90 , mean = 0, sd = 1 , lower.tail = FALSE)
qnorm(0.95 , mean = 0, sd = 1 , lower.tail = FALSE)
qnorm(0.99 , mean = 0, sd = 1 , lower.tail = FALSE)

#*******************************************************************************

#HYPOTHESIS FOR POPULATION MEAN 

# If population mean is known, and population standard deviation is also known then we take Z statistics
# If population mean is known, and population standard deviation is unknown then we take t statistics

# Question : An automatic machine fills an aerated drink in 2000cc bottles. A tester needs
#       to test H0 that the average mount being filled in  bottle is atleast 2000cc.
#       He selects a random ample of 40 bottles and record the exact content of the bottles.
#       and found the sample mean to be 1999.6cc
#   Consider the population standard deviation as 1.30 cc.
#  We need to test the null hypothesis at the significance level of 5%.

# SOLUTION
# Step 1 :State the hypothesis.
# H0 :  mu >= 2000
# H1 : mu < 2000
# alpha = .05
# n = 40

# Step 2 : since the sample size s greater then 30 we need to calculate Z-statistics

mu = 2000
xbar = 1999.6
sigma = 1.30
alpha = .05
n = 40
SE = sigma/sqrt(n)
z = (xbar - mu)/SE

# step 3 : Calculate the critical value

zalpha = qnorm(1 - alpha, lower.tail = FALSE)
zalpha

#STEP 4 : Conclusion
p <- (zalpha > z) # the null hypothesis is rejected.
p

#*******************************************************************************

# Two Tailed test
# QUESTION : Suppose the mean weight of king penguins found in Antartica colony last year
#           was 15.4 Kg. In a sample of 35 penguins sametime this year in the same colony
#           the mean penguin weight is 14.6 Kg. Asssume the population standard deviation
#           is 2.5 Kg. At .05 significance level, Can we reject the null hypothesis hat the
#           mean penguin weight does not differ from last year.

# SOLUTION
# Step 1 :State the hypothesis.
# H0 :  mu = 15.4
# H1 : xbar = 14.6
# sigma = 2.5
# alpha = .05
# n = 35

# Step 2 : since the sample size is greater then 30 we need to calculate Z-statistics

mu = 15.4
xbar = 14.6
sigma = 2.5
alpha = .05 # significance level
n = 35
SE = sigma/sqrt(n)
z = (xbar - mu)/SE

# step 3 : Calculate the z critical value

zalpha = qnorm(1 - alpha/2)
zalpha

#STEP 4 : Conclusion
#since the value of z falls between (-zalpha, zalpha), which is our confidence interval so we  cannot reject the null hypothesis.


#*******************************************************************************


# Question : A high school athletic director is asked if football players are doing well
# academically as other student athletes. We know from a previous study that average GPA for 
# the student athlete is 3.10.After an initiative to help improve the GPA of student athlete
# the athletic director randomly samples 20 football players  finds that the average GPA of the 
# sample is 3.18 with a sample standard deviation of .54 . is there any significant improvement
# use a significance level of .05.

# SOLUTION
# Step 1 :State the hypothesis.
# H0 :  mu = 3.10
# H1 : xbar = 3.18
# sigma = 0.54
# alpha = .05
# n = 20

# Step 2 : since the sample size is less then 30 we need to calculate t-statistics

mu = 3.10
xbar = 3.18
sigma = .54
alpha = .05 # significance level
n = 20
SE = sigma/sqrt(n)
t = (xbar - mu)/SE

# step 3 : Calculate the t critical value

talpha = qt(1 - (alpha/2),19)
talpha

#STEP 4 : Conclusion

#*******************************************************************************

#Confidence interval

# How to calculate confidence interval.
# We need to use the below formula 
# CI = xbar ± talpha(s/sqrt(n))

CI = xbar - (talpha*(sigma/sqrt(n)))
CI

#*******************************************************************************

#HYPOTHESIS FOR POPULATION PROPORTION

# If the population mean is given s proportion(p) or percentage then we have to use this Hypothesis test

# If population mean is known, and population standard deviation is also known then we take Z statistics
# If population mean is known, and population standard deviation is unknown then we take t statistics

# The objective is to test the hypothesis that compares he population proportion of interest with a specified value

# In population proportion the standard deviation formula is 
#  SE = sqrt(p*(1-p)/n)

#*******************************************************************************

# QUESTION : The manager consider random sample of 200 consumers, which shows the acceptance
#       rate as 32 % assuming the level of significance a of .05 , let's perform the hypothesis
#       testing o conclude an action.

# SOLUTION
# Step 1 :State the hypothesis.
# H0 :  P <= .3
# H1 : p > .3
# sigma = 0.54
# alpha = .05
# n = 200

# Step 2 : since the sample size is greater then 30 we need to calculate z-statistics

p = .32
P = .30
n = 200
alpha = .05
SE = sqrt(P*(1-P)/n)

z = (p - P)/SE
z

# step 3 : Calculate the z critical value

zalpha = qnorm(1 - alpha, lower.tail = TRUE)
zalpha

#*******************************************************************************


# P-value approach
# in the place of critical value we calculate P value using pnorm() function which gives us probability value
# If P <= alpha , reject the null hypothesis, otherwise do not reject the null hypothesis.



#  Question : Suppose that the chocolate wrapper states that there is at most 4 grams
#   of saturated fat in a single chocolate . In a sample of 70 chocolates, it is found 
#   that the mean amount of saturated fat per chocolate is 4.2 gram

# Assume the population standard deviation is .50 grams.At .05 significance level,
# can we reject the claim on wrapper?

# SOLUTION
# Step 1 :State the hypothesis.
# H0 :  mu <= 4
# H1 : xbar = 4.2

mu = 4
xbar = 4.2
alpha = .05
n = 70
sigma = .50
SE = sigma/sqrt(n)
z = (xbar - mu)/SE
pval = pnorm(z, lower.tail = FALSE) 
pval


#*******************************************************************************

#HYPOTHESIS FOR POPULATION VARIANCE

# This can be performed using below two methods
#   1. Chi-square test
#   2. ANOVA

# This is used to determine if there is significant mount of association between.
# 1. Two categorical variable (Chi-square test).
# 2. One categorical nd one numerical variable (ANOVA) from a single population

# CHI - SQUARE TEST
# If we want to check whether some categorical variable has effect on some other categorical variable we perform Chi-square test.
# Chi-square test test gives us a "p-value" or "probability number" which helps us make a decision
# It's a non parametric test as there is no assumption that the data follows  specific distribution (like normal distribution). 

# Null hypothesis (H0): variable A and B are independent
# Alternate Hypothesis (H1) : variable A and B are not independent

# Formula for chi square
# chi-square = sum(square(O-E))/E
# O : observed(Actual) value
# E : expected value

# if p < 0.05 : Variables are not independent , they have strong association.
# if p >= 0.05 : the variables are independent


#*******************************************************************************
# Question : Gender and Preference to taking pet V1 = dog and V2 = Cat

# Solution:
# STEP 1 : SET UP HYPOTHESIS
# Null hypothesis : Gender and preference of pet is independent.
# Alternate Hypothesis : Gender and preference of pet is not independent.

data <- matrix(c(207,231,282,242), nrow = 2, ncol = 2)
data

# STEP 2 :calculate the test statistics
p = chisq.test(data)

# STEP 3 : Calculate the critical value
# for significance level of .05 the critical value is .05

# STEP 4 :Compare the test statistics and critical values 
# Since p < .05 we can reject the null hypothesis

#*******************************************************************************
str(mtcars)
cyl <- as.factor(mtcars$cyl)
gear<- as.factor(mtcars$gear)
newft <- table(cyl,gear)
newft
mosaicplot(newft)
chisq.test(newft)

#*******************************************************************************

# TYPES OF CHISQUARE TEST
# 1. Test for independence( Two way chi-square test) : to determine association between two categorical variables
# 2. Test fo goodness of fit( One way chi-square test) : to check observed frequency distribution differ from the expected frequency distribution

#*******************************************************************************


# ANOVA : ANALYSIS OF VARIANCE
# Investigates the relation between categorical variable d continuous variable.
# Determine if the mean of several groups are equal.

# Null hypothesis (H0): All population mean are equal
# Alternate Hypothesis (H1) : Atleast one population mean is different from the rest.

# TYPES OF ANOVA
# 1. One way ANOVA - One categorical variable
# 2. Two way ANOVA - two categorical variable

# ANOVA  test the variability between groups to the variability within gropus.
# we need to calculate F ratio.
# F Ratio = Mean between groups sum of squares/ mean within groups sum of squares

# If F ratio > 1 : Variables are not independent, large F ratio indicates they have strong association.
# If F ratio < 1 : Variables are independent , they don't have any association.

#*******************************************************************************
# One way anova
# Question :

boxplot(mtcars$mpg, factor(mtcars$gear),xlab = "gear",ylab = "mpg")

# Ho : There is no difference in avg mpg for different gear.
# H1 : Not all means are equal.

mtcars.aov <- aov(mtcars$mpg~factor(mtcars$gear))
summary(mtcars.aov)

# Since p value is less than .05 it means the gear and mpg have strong association.

#*******************************************************************************
# Two way anova
par(mfrow = c(1,2))
boxplot(mtcars$mpg, factor(mtcars$gear), subset = (mtcars$am == 0),xlab = "gear",ylab = "mpg", main = "Automatic")
boxplot(mtcars$mpg, factor(mtcars$gear),subset= (mtcars$am == 1),xlab = "gear",ylab = "mpg", main = "Manual")


mtcars.aov <- aov(mtcars$mpg~factor(mtcars$gear)*factor(mtcars$am))
summary(mtcars.aov)



#POST HOC TEST
TukeyHSD(mtcars.aov)
plot(TukeyHSD(mtcars.aov))

