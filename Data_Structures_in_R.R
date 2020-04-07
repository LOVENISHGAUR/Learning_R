##Author : Lovenish

#Data Structutresin r 

#1. Vector : It is one dimensional data structure of homogeneous items
vec1 <- 42
class(vec1)
vec2 <- c(1,2,3,4,5,7:16)
class(vec2)

vec1[2]
vec2[3]

vec3 <- c(1,23,"This")
class(vec3)

#2. Matrices : It is two dimensional data structure of homogeneous items
mat <- matrix(c(1:9), nrow = 3, ncol = 3)
mat[2, 3]

#3. Array : It is three dimensional data structure of homogeneous items
arr <- array(c(1:27), dim = c(3,3,3))
arr[2,3,3]


#4. Dataframes : it can contain object of diffrent types 
a <- c(1,2,3)
b <- c("aa", "bb", "cc")
c <- c("True","True", "False")
d <- data.frame(a,b,c)
d

# 4.1 Inbuilt data frame
mtcars
head(mtcars)

tail(mtcars)
str(mtcars)
summary(mtcars)
mtcars$disp
mtcars$mpg

mtcars[, "disp"] # To see specific column
mtcars[2, ] # to see specific row

mtcars[2, "disp"]

# subbsetting a data frame

car1 <- subset(mtcars, cyl >6 )
car1

car2 <- subset(mtcars, hp > 50)
car2


#rbind and cbind

#rbind is for combining rows 

df1  <- mtcars[1:20,]
df2  <- mtcars[21:32,]

defull <- rbind(df1,df2)
defull
str(defull)

#cbind is for combining columns

df3 <- mtcars$disp
df4 <- mtcars$hp

dffull <- cbind(df3,df4)
dffull

#Change numeric to factors
str(mtcars)
mtcars$cyl = as.factor(mtcars$cyl)
str(mtcars)

# Change the name of factor by level statement
gender_vector <- c("Male", "Female", "Male", "Male", "Female", "Female","Female")
gender_vector
class(gender_vector)

factor_gender_vector <- as.factor(gender_vector)
class(factor_gender_vector)

levels(factor_gender_vector) <- c("F", 'M')
factor_gender_vector

#5. Lists

my_vector <- 1:10
my_matrix <- matrix(1:9 , ncol = 3)
my_matrix
my_df <- mtcars[1:3, ]
my_df

#creating a list
my_list <- list(my_vector, my_matrix, my_df)
my_list

#giving the name
names(my_list) <- c("vec", "mat", "df")
my_list
