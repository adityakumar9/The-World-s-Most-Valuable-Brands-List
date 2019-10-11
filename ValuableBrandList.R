library(XML)
library(RCurl)
library(bitops)
library(dplyr)
library(lubridate)
library(ggplot2)


# Set File Path -----------------------------------------------------------

setwd("C:\\Users\\Shubham\\Downloads\\data _Science\\03_Data Science with R\\03_Data visulaztion with R")
getwd()

# Extract data table from HTML file ---------------------------------------

u = c("The World's Most Valuable Brands List.html")
tables = readHTMLTable(u)
data<- as.data.frame((tables$the_list), stringsAsFactors = F, blank.line.skip=T)
data<- na.omit(data)

# Senety Checks -----------------------------------------------------------

str(data)
unique(data)
which(is.na(data))


# Find the answers of following Questions ---------------------------------

## 1. (a) Use readHTMLTable() function from XML library in R to read this html file inside R.
## If you use class() function on this object, the output is ____________
class(tables)

## Question 2(b) How many elements are inside the object you just read in?
## answer:- 109

data1<- data
head(data1)
data1<- data1[,-1]
head(data1)

summary(data1)
str(data1)

names(data1)<- c("Rank", "Brand","Brand_Value", "Yr_Value_Change", "Brand_Revenue", 
                 "Company_Advertising", "Industry" )


summary(data1)
names(data1)

head(data1)

data1$Rank<- as.numeric(gsub("\\#", "", data1$Rank))

data1$Brand_Value<- as.factor(gsub("\\$", "", data1$Brand_Value))
data1$Brand_Value<- as.factor(gsub("\\ B", "", data1$Brand_Value))

data1$Yr_Value_Change<- as.factor(gsub("\\%","", data1$Yr_Value_Change))

data1$Brand_Revenue<- as.factor(gsub("\\$", "", data1$Brand_Revenue))
data1$Brand_Revenue<- as.factor(gsub("\\ B", "", data1$Brand_Revenue))

data1$Company_Advertising<- as.factor(gsub("\\$", "", data1$Company_Advertising))
data1$Company_Advertising<- as.factor(gsub("\\ B", "", data1$Company_Advertising))



x<-data.frame(data1$Company_Advertising ,stringsAsFactors = F)
x<- data.frame(x, stringsAsFactors = F)

x<- as.character(x)

names(x)<- "A"
x<- na.omit(x)

class(x$A)


sum(x$data1.Company_Advertising)

y<-data.frame(data1$Company_Advertising, stringsAsFactors = F)
summary(y)

y<- na.omit(y)
sum(y$data1.Company_Advertising)


x$data1.Company_Advertising<-as.numeric(x$data1.Company_Advertising)
sum(x)

class(x)

str(data1)
class(data1)

data1<- na.omit(data1)
summary(data1)

## Skip to question text.
## 3. (b) In this table, there are many rows, across many columns,
## where, the values are missing, but aren't being treated as NA values.
## Take an appropriate action to resolve this issue., and fill in the blanks:
## Number of NA values in Company Advertising column is__________

data1$Company_Advertising<- as.factor(gsub("\\-", NA, data1$Company_Advertising))
sum(is.na(data1$Company_Advertising))
data1$Brand_Revenue<- as.factor(gsub("\\-", NA, data1$Brand_Revenue))
sum(is.na(data1$Brand_Revenue))

## fter dropping the rows with missing values (be careful, there are some columns in
## your data with missing values across all, rows, drop these columns, before you drop
## rows with missing values), we end up with.....62....... rows in the dataframe


## 1. (c) When you convert the relevant html table into a dataframe,
## how many columns do you obtain for this dataframe
## answer: -7


##2. (c) How many unique values are there in the column "Industry"?
unique(data1$Industry)
##  18

##2.(d) How many rows in the data for the column Industry, has a value "Automotive"?
data1%>%filter(data1$Industry=="Automotive")%>%nrow()
## 12


####  For the column, called "Company Advertising" you can see that some observations have units in Millions of dollars,
##    while some are recorded in Billions of dollars. Count how many observations
##    in this column are recorded in Millions of dollars.


data1$CA<- data1$Company_Advertising
data1$CA<- paste(as.character.factor(data1$CA))
class(data1$CA)

library(stringr)

data1$CA<- str_count(data1$CA, "M")

data1%>%filter(data1$CA==1)%>%nrow()

data1$ca<- data1$Company_Advertising
data1$ca<- as.character(data1$ca)
data1$ca<- as.character(gsub("\\ M", "", data1$ca))


  