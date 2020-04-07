#Author : Lovenish

# Manipulating data

#1.  Apply Function : The apply functions are used to perform specific changes to each row or 
#column of an R object 

#1.1 apply() : apply(x,margin, function)
#margin = 1 indicates function need to applied for row
#margin = 2 indicates function need to applied for cloumn
#Function can be mean, sum, average etc..

m <- matrix(1,2,3,4)
apply(m, 1,sum)
apply(m,2,mean)


#1.2 lapply(list,function)

l <- list(x = 1:5, y = 6:10, z = 11:15)
p <- lapply(l, median)
p


nyc <- list(pop = 8979988,
            boroughs = c("Manhatten", "Bronx","Brooklyn","Queen","staten Island"),
            capital = FALSE)
for(i in nyc){
    print(class(i))
}


unlist(nyc, class)
lapply(nyc, class)

#1.3 sapply

data <- list(a =1:5 , b = 6:10, c= 11:15)
lapply(data, sum)
lapply(data, median)
unlist(lapply(data, sum))


sapply(data, sum)
sapply(data, mean)
sapply(data, range)


#1.4 Vapply() :it is similar to sapply but it explicitly specify the type of return value.
#vapply is generally fastre then sapply

vapply(data, sum, FUN.VALUE = double(1))
vapply(data, range, FUN.VALUE = double(2))


#1.5 tapply() : it works on vector , it apply he function by grouping the factors inside the vector
age <- c(22,33,28,87,56,34,33)
gender <- c("m", "m", "m", "f", "f", "m", "f")
f <- factor(gender)
tapply(age, f, mean)


library(datasets)
data()
View(Orange)
class(Orange)
Orange$Tree
tr <- factor(Orange$Tree)
tapply(Orange$age, tr, mean)
tapply(Orange$circumference, tr, sum)

#1.6 mapply() : it is a multivariate version of sapply. It will apply the specified
#function to the first element of each argument first, followed by second element and so on.
z <- list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
z

# The above operation or making list z can be performed like below 
mapply(rep, 1:4, 4:1)

