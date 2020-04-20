# Data Pre Processing

#Import the dataset
setwd("/Users/lovenishgaur/Documents/DataAnalyst/Learning_R/Dataset")
getwd()
list.files()

titanic <- read.csv("/Users/lovenishgaur/Documents/DataAnalyst/Learning_R/Dataset/titanic__train.csv", stringsAsFactors = F, na.strings = c
                    ("","NA", " "))

# To check structure of data set
str(titanic)

# To check number of rows and columns
nrow(titanic)
ncol(titanic)

# To find the column names
names(titanic)
colnames(titanic)

# To see the data
head(titanic) # by default show five rows only
head(titanic, 10) # To see more than 5 observations/rows

# To see the summary of the data set
dim(titanic)
summary(titanic)
glimpse(titanic)

#******************************************************************************
#*                                                                            *    
#*                    Data cleaning and preparation                           *
#******************************************************************************
# Missing Value Treatment
# Outlier Treatment
# Handling inconsistent data
#   > we can use tidyr  and dplyr function for handling inconsistent data
#       gather() : gather columns into key value pairs
#       spread() : Spread key value pairs into columns
#       separate() : separate one column into multiple
#       unite() : Unite multiple column into one
# Imbalanced data treatment
#   > collect more data
#   > Try changing performance metric(caret package)
#       1. confusion metric
#       2. ROC CURVES
#       3. Precision
#       4. Recall
#       5. F1 score
#   > Try re-sampling dataset (caret , ROSE , unblanced package)
#       1. Over sampling
#       2. Under sampling
#   > Try Generate synthetic samples
#       1. SMOTE , DMwR package
#   > Try Different algorithm
#       1. Try popular decision tree algorithms like C4.5, C5.0 , CART, and Random forest
# Unified date format
#   > Important libraries to deal with date
#       1. Lubricate
#       2. Forecast
#       3. Zoo
#       4. Xts
#       5. tseries
# Correct inconsistent data
# Data Manipulation
#******************************************************************************
#Data type conversion

titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
str(titanic)

#******************************************************************************
#MISSING VALUE(NA OR BLANK)

# 1. IF MISSING VALUES < 20% THEN IMPUTE OR EPLACE THE ROW.
#   1.1 impute with 0
#   1.2 impute with central tendency measure( mean , median, mode)
#   1.3 impute with most probable value (using predictive model)

# 2. IF MISSING VALUES > 20 % THEN REMOVE THE WHOLE COLUMN.
#   2.1 if variable is continuous fill with mean , median, min, max or use regression
#   2.2 if the variable is categorical fill with mode, create new level or use classification


# Methods of Identifying missing values

# 1. Summary() function
summary(titanic)

# 2. NA count for all : table(is.na(z))
table(is.na(titanic$Age))

# 3. NA count column wise : sapply(z, function(x)sum(is.na(x)))
sapply(titanic, function(df){
    sum(is.na(df) == T)/length(df)
})

# 4. NA count row wise : rowSums(is.na(z))

table(rowSums(is.na(titanic)))
?rowSums

# Package to find NA value in the data set
install.packages("Amelia")
library(Amelia)

missmap(titanic, main = "Missing Map")
AmeliaView()

#******************************************************************************
# OUTLIER TREATMENT

# 1. Deleting Observations : 
# 2. Transforming and binning : Transforming variables can eliminate outliers. Natural log of a value reduce the variation caused by extreme values

# Identifying Outliers
boxplot(titanic$Age)

#******************************************************************************

# Imputing missing values

# substitute the missing value with the average value
sum(is.na(titanic$Age)==TRUE)/length(titanic$Age)
titanic$Age[is.na(titanic$Age)] <- mean(titanic$Age, na.rm = TRUE)
sum(is.na(titanic$Age))

# Substituting the missing value with mode
table(titanic$Embarked , useNA = "always")
titanic$Embarked[is.na(titanic$Embarked)] <- "S"
sum(is.na(titanic$Embarked))

# substituting the missing value with average value
titanic$Fare[is.na(titanic$Fare)] <- mean(titanic$Fare, na.rm = TRUE)
sum(is.na(titanic$Fare))


# Checking the NA values for all the columns once again
sapply(titanic, function(df){
    sum(is.na(df) == T)/length(df)
})

#******************************************************************************
#*                                                                            *    
#*                    Data Exploration on cleaned data                        *
#******************************************************************************

# UNIVARIAVTE EDA
# CATEGORICAL VARIABLE

titanic_train <- titanic
xtabs(~Survived, titanic_train)

summary(titanic_train$Survived)
ggplot(titanic_train) + geom_bar(aes(x = Survived))

summary(titanic_train$Sex)
ggplot(titanic_train) + geom_bar(aes(x = Sex))

summary(titanic_train$Pclass)
ggplot(titanic_train) + geom_bar(aes(x = Pclass))

summary(titanic_train$Embarked)
ggplot(titanic_train) + geom_bar(aes(x =Embarked))

# Numeric
str(titanic_train)

summary(titanic_train$Fare)
ggplot(titanic_train) + geom_histogram(aes(x = Fare), fill = "white", color = "Green")
ggplot(titanic_train) +geom_boxplot(aes(x = factor(0), Fare)) + coord_flip()
ggplot(titanic_train) + geom_density(aes(x = Fare))

summary(titanic_train$Age)
ggplot(titanic_train) + geom_histogram(aes(x = Age), fill = "white", color = "Green")
ggplot(titanic_train) +geom_boxplot(aes(x = factor(0), Age)) + coord_flip()
ggplot(titanic_train) + geom_density(aes(x = Age))

#******************************************************************************
# BIVARIATE ANALYSIS

# Categorical- categorical variables
xtabs(~Survived+Sex, titanic_train)
ggplot(titanic_train) + geom_bar(aes(x= Sex, fill=factor(Survived)))


xtabs(~Survived+Pclass, titanic_train)
ggplot(titanic_train) + geom_bar(aes(x= Pclass, fill=factor(Survived)))

xtabs(~Survived+Embarked, titanic_train)
ggplot(titanic_train) + geom_bar(aes(x= Embarked, fill=factor(Survived)))

# Numerical - categorical Variables
ggplot(titanic_train) + geom_boxplot(aes(factor(Survived), y = Age))
ggplot(titanic_train) + geom_histogram(aes(x = Age, fill = "White", color = "black")) + facet_grid(factor(Survived)~ .)


ggplot(titanic_train) + geom_boxplot(aes(factor(Survived), y = Fare))
ggplot(titanic_train) + geom_histogram(aes(x = Fare, fill = "white", color = "black")) + facet_grid(factor(Survived) ~ .)


#******************************************************************************
# MULTIVARIATE ANALYSIS

xtabs(~factor(Survived)+Pclass+Sex, titanic_train)
ggplot(titanic_train) + geom_bar(aes(x = Sex, fill = factor(Survived)))+ facet_grid(Pclass ~ .)


xtabs(~factor(Survived)+Embarked+Sex, titanic_train)
ggplot(titanic_train) + geom_bar(aes(x = Sex, fill = factor(Survived)))+ facet_grid(Embarked ~ .)

#******************************************************************************
#*                                                                            *    
#*                    Feature engineering                                     *
#******************************************************************************

# FEATURE CREATION
# FEATURE SELECTION

# Combining the dataset
titanic_test <- read.csv("/Users/lovenishgaur/Documents/DataAnalyst/Learning_R/Dataset/titanic_test.csv")
titanic_test$Survived <- NA
Full <- rbind(titanic_train, titanic_test)
str(Full)

# Creating new variables
# Create a column child and indicate if the person is child or adult

Full$Child <- NA
Full$Child[Full$Age < 18] <- 1
Full$Child[Full$Age >= 18] <- 0
str(Full$Child)

# Create a column Family size
Full$FamilySize <- Full$SibSp + Full$Parch + 1
str(Full$FamilySize)

# Convert to character
Full$Name <- as.character(Full$Name)

# Create a column Title
# extracts the titile from name
Full$Title <- sapply(Full$Name, FUN =function(x){strsplit(x, split = '[,.]')[[1]][2]})
str(Full$Title)
Full$Title <- sub(' ','', Full$Title) # Remove spaces and Blanks
table(Full$Title)
barplot(table(Full$Title))

# Combine Small title Group
Full$Title[Full$Title %in% c("Mme","Mlle")] <- "Mlle"
Full$Title[Full$Title %in% c("Capt","Don","Major","Sir")] <- "Sir"
Full$Title[Full$Title %in% c("Dona","Lady", "the Countess","Jonkheer")] <- "Lady"

# Convert to a factor
Full$Title <- factor(Full$Title)
table(Full$Title)
barplot(table(Full$Title))

# Split Back into test and train data set
titanic_train_Featured <- Full[1:891,]
titanic_test_Featured <- Full[892:1309,]

titanic_train_Featured$Survived <- as.factor(titanic_train_Featured$Survived)
titanic_train_Featured$Sex <- as.factor(titanic_train_Featured$Sex)
titanic_train_Featured$Embarked <- as.factor(titanic_train_Featured$Embarked)

titanic_test_Featured$Sex <- as.factor(titanic_test_Featured$Sex)
titanic_test_Featured$Embarked <- as.factor(titanic_test_Featured$Embarked)


# BUILT RANDOM FOREST ENSEMBLING
set.seed(415)
install.packages("randomForest")
library(randomForest)

fit <- randomForest(as.factor(Survived) ~ Pclass + Age + Sex + SibSp + Parch + Fare + Embarked +
                        Child + Title + FamilySize , data = titanic_train_Featured, importance= TRUE, ntree = 2000)

varImpPlot(fit)
