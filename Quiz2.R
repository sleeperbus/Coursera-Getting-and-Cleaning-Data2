# Q-1
library(httr)
oauth_endpoints("github")
app <- oauth_app("github", "b423ad4995203216b104", 
                 "6a64c3c1f9aefacec2aca87bc2bfc160ebd0ba00")
github_token <- oauth2.0_token(oauth_endpoints("github"), app)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
x <- content(req)
x[[which(sapply(x, function(x) x$name == "datasharing"))]]$created_at

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
subset(jsonData, name == "datasharing")$created_at

# Q-4
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
con = url(url)
htmlCode = readLines(con)
close(con)
nchar(htmlCode[c(10, 20, 30, 100)])

# Q-5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url, "./data.txt", method="curl")
data <- read.fwf("./data.txt", skip=4, head=F, widths=c(15,4,4,5,4,4,5,4,4,5,4,4))
sum(data$V5, na.rm=T)

