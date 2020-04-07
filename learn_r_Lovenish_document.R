##Author : Lovenish

install.packages("ggcharts")
library(ggcharts)
#Getting working directory

getwd()

#Setting Wroking Direcory

setwd("/Users/lovenishgaur/Documents/DataAnalyst/Learning_R")
getwd()


#Mking a finction

myfunction <- function(x) {
    x <- rnorm(100)
    mean(x)
}
myfunction()

second <- function() {
    
}











