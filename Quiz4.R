# Q-1
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, "Q4-1_survey.csv")
survey = read.csv("Q4-1_survey.csv", stringsAsFactors=F)
strsplit(names(survey), "wgtp")[[123]]

# Q-2
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url, "Q4-2_gdp.csv")
gdp = read.csv("Q4-2_gdp.csv", stringsAsFactors=F, skip=5, header=F)
gdp <- gdp[1:190, ]
gdp <- gdp[, c("V1", "V2", "V4", "V5")]
names(gdp) <- c("countrycode", "rank", "fullname", "value")
head(gdp, 4)
gdp$value <- as.integer(gsub(",", "", gdp$value))
mean(gdp$value)

# Q-4
library(plyr)
url1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url1, "Q4-4-gdp.csv")
gdp <- read.csv("Q4-4-gdp.csv", stringsAsFactors = F, skip = 5, header = F)
gdp <- gdp[1:190, ]
gdp <- gdp[, c("V1", "V2", "V4", "V5")]
names(gdp) <- c("countrycode", "rank", "fullname", "value")
head(gdp, 4)

download.file(url2, "Q4-4-country.csv")
country <- read.csv("Q4-4-country.csv", stringsAsFactors=F)
names(country) <- tolower(names(country))

data <- join(gdp, country, by = "countrycode")
data$special.notes <- tolower(data$special.notes)
length(grep("june", data[grep("fiscal year", data$special.notes), "special.notes"]))

# Q-5 How many values were collected in 2012? How many values were collected on Mondays in 2012?
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
tidy <- sampleTimes[format(sampleTimes, "%Y") == "2012"]
length(tidy)
length(which(format(tidy, "%a") == "¿ù"))
