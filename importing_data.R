##Author : Lovenish

#Importing files

getwd()
list.files()

#1 , CSV files

#Method 1
groceries <- read.csv("groceries_subset.csv")
groceries
str(groceries)

#method 2
install.packages("readr")
library(readr)
groceries_1 <- read_csv("groceries_subset.csv")
head(groceries_1)
str(groceries_1)

#2. Text file
mri <- read.table("MRI.txt", sep = "\t", header = TRUE)
mri
str(mri)
summary(mri)


#3. excel
install.packages("readxl")
library(readxl)
pop1 <- read_excel("Sample-Superstore.xls")
pop1
str(pop1)


#To connect to he data base 
#Packages used 

install.packages("RMySQL")
install.packages("RPostgressSQL")
install.packages("ROracle")


#Read data from Web

library(readr)
url_csv <- "URL" 
pools <- read_csv(url_csv)


#WEB API AND JSON
install.packages("jsonlite")
library(jsonlite)
url <- ""
download.file(url, "filename.html")
fromJSON("URL")


#Importing data from Statistical tool

install.packages("haven")#This is teh package for installing data from different statistical tool
library(haven)

#from SAS
read_sas()

#from STAT
read_stata()

#from spss
read_spss()



#Exportind data int R

#Exporting text data
write.table()

#Exporting Excel data
install.packages("writexl")
library(writexl)
write.xlsx()
#Exporting csv data
write.csv()


