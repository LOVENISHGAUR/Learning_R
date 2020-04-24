# Using the 'APPLY' function in R

getwd()
setwd("/Users/lovenishgaur/Documents/DataAnalyst/Learning_R/Dataset/")
# read in the "StockExample.csv" data, and attach it
StockData <- read.table(file="/Users/lovenishgaur/Documents/DataAnalyst/Learning_R/Dataset/StockExample.csv",
                        sep=",", header=T, row.names=1)
# check the data
StockData

# get the help menu
?apply # Returns a vector or array or list of values obtained by applying a function to margins of an array or matrix.

# calculate the mean price of each stock
apply(X=StockData, MARGIN=2, FUN=mean)

# calculate the mean price of each stock, removing any NAs
apply(X=StockData, MARGIN=2, FUN=mean, na.rm=TRUE)

# store the mean in an object called AVG
AVG <- apply(X=StockData, MARGIN=2, FUN=mean, na.rm=TRUE)
AVG

# notice that we don't need to include "MARGIN", etc, as long
# as we enter info in the specified order
apply(StockData, 2, mean, na.rm=TRUE)

# do the same, but using the ColMeans command
colMeans(StockData, na.rm=TRUE)

# do the same, but using the rowMeans command for row mean.
rowMeans(StockData, na.rm=TRUE)

# find the MAXIMUM stock price, for each stock
apply(X=StockData, MARGIN=2, FUN=max, na.rm=TRUE)

# find the MINIMUM stock price, for each stock
apply(StockData, 2, min, na.rm=TRUE)

# find the 20th and 80th PERCENTILE, for each stock
apply(X=StockData, MARGIN=2, FUN=quantile, probs=c(0.2,.40, .60,.80),
      na.rm=TRUE)

# create a plot of each column, using a "line"
apply(X=StockData, MARGIN=2, FUN=plot, type="l")

# we can also send the plot function more arguments, such as
# titles, axes labels, and so forth...
apply(X=StockData, MARGIN=2, FUN=plot, type="l", main="stock", 
      ylab="Price", xlab="Day")

# now let's calculate the SUM of each row (MARGIN=1)
apply(X=StockData, MARGIN=1, FUN=sum, na.rm=TRUE)

# do the same, but with the rowSums command
rowSums(StockData, na.rm=TRUE)

# make a nice plot of these...
plot(apply(X=StockData, MARGIN=1, FUN=sum, na.rm=TRUE), type="l"
     ,ylab="Total Market Value", xlab="Day", main="Market Trend")

# and add in some nice coloured points...
points(apply(X=StockData, MARGIN=1, FUN=sum, na.rm=TRUE), 
       pch=16, col="blue")

