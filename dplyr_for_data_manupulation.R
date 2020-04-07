#Author : Lovenish

#1. dplyr(): dplyr package contains five key data manipulation function, also called verbs
#Note : columns are called variables and rows ina  table is called observations
#1.1 select : Pick variables by their name
#1.2 filter : Pick observations by their value
#1.3 arange : Reorder rows
#1.4 mutate : make new variables form the existing variables
#1.5 summarize : collapse many values down to single summary

install.packages("dplyr")  # Installing the package
install.packages("hflights")
install.packages("tibble")
install.packages("zoo")
install.packages("forecast")

??zoo
library(dplyr)  # Loading the package
library(hflights)
library(tibble)
head(hflights)
str(hflights)
summary(hflights)
class(hflights)

hflights <- tbl_df(hflights)

# 1.1 select

tbl <- select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)
glimpse(tbl)
hflights[,"AirTime"]


#select every  name that starts with "x
select(hflights, starts_with("x"))


#1.3 Mutate : It creates a new column for exising column
g1 <- mutate(hflights, loss = ArrDelay - DepDelay)
g1
hflights["loss"]


g2 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)
g2


#filter :

long_flights <- filter(hflights, Distance >= 3000)
glimpse(long_flights)


#Arange 

dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))
glimpse(dtc)

d <- arrange(dtc, DepDelay)
d
glimpse(d)


#Summarise Function

f <- summarise(hflights, mean(DepTime), sum(Distance))
f
summarize(hflights)

#Question:
# Select only the tailnum of the flights whose DepDealy > 240 and sorted by total taxing time.

arrange(hflights, TaxiIn+TaxiOut)
hflights_Taxing <- mutate(hflights, Taxing_Time = TaxiIn+TaxiOut)
hflights_Taxing <- arrange(hflights_Taxing, Taxing_Time)
Answer_flights <- select(filter(hflights_Taxing, DepDelay >240), TailNum)
Answer_flights


#Pipe operartor 

hflights %>%
    filter(DepDelay >240) %>%
    mutate(Tax_Time = TaxiIn+TaxiOut) %>%
    filter(!is.na(Tax_Time)) %>%
    select(TailNum)
    
#groupBy
hflights %>%
    group_by(UniqueCarrier) %>%
    summarise(p_canc = mean(Cancelled ==1 )*100,
              avg_delay = mean(ArrDelay, na.rm= TRUE)) %>%
    arrange(avg_delay, p_canc)

str(hflights)


hflights %>%
    filter(!is.na(ArrDelay), ArrDelay >0) %>%
    group_by(UniqueCarrier) %>%
    summarise(avg = mean(ArrDelay)) %>%
    mutate(rank = rank(avg)) %>%
    arrange((rank))



#Date value in R

Sys.Date() # Gives todays date
class(Sys.Date())

charachter_date <- "1957-03-04"
class(charachter_date)
Birth_date <- as.Date(charachter_date, format = "%Y-%d-%m")
class(Birth_date)
weekdays(Birth_date)
months(Birth_date)
quarters(Birth_date)
