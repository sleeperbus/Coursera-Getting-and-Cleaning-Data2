# Q-1
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, "Q3-1_idaho.csv")
survey = read.csv("Q3-1_idaho.csv", stringsAsFactors=F)
agricultureLogical <- which(survey$AGS == 6 & survey$ACR ==3)
agricultureLogical[1:3]

# Q-2
library(jpeg)
url = "http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url, "Q3-2-jeff.jpg")
data = readJPEG("Q3-2-jeff.jpg", native=TRUE)
quantile(data, probs=c(0.3, 0.8))

# Q-3
library(plyr)
url1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url1, "Q3-3-gdp.csv")
gdp <- read.csv("Q3-3-gdp.csv", stringsAsFactors = F, skip = 5, header = F)
gdp <- gdp[1:190, ]
gdp <- gdp[, c("V1", "V2", "V4", "V5")]
names(gdp) <- c("countrycode", "rank", "fullname", "value")
head(gdp, 4)

download.file(url2, "Q3-3-country.csv")
country <- read.csv("Q3-3-country.csv", stringsAsFactors=F)
names(country) <- tolower(names(country))

data <- join(gdp, country, by = "countrycode")
nrow(data)
arrange(data, desc(as.integer(rank)))[13, "fullname"]

# Q-4 What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
tapply(as.integer(data$rank), data$income.group, mean)

# Q-5 
library(Hmisc)
data$group <- cut2(as.integer(data$rank), g = 5)
table(data$group, data$income.group)


