# This script is for Quiz1
setwd("/Users/sleeperbus/Dev/github/Coursera-Getting-and-Cleaning-Data2")

# Q-1 How many housing units in this survey were worth more than $1,000,000?
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, dest="./survey.csv", method="curl")
survey <- read.csv("survey.csv", stringsAsFactors=F)
nrow(subset(survey, VAL == 24, na.rm = T))

# Q-3 
library(xlsx)
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url, dest = "./ngap.xlsx", method="curl")
dat= read.xlsx("./ngap.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

# Q-4 How many restaurants have zipcode 21231?
library(XML)
url = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(url, useInternal=TRUE)
rootNode <- xmlRoot(doc)
length(which(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231"))

# Q-5
library(data.table)
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url, "./idaho.csv", method="curl")
DT <- fread("idaho.csv")
