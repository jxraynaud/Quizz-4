library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
date <- index(amzn)
date <- as.Date(date,"%Y-%m-%d")
y2012 <- date[date >= as.Date("2012-01-01") & date < as.Date("2013-01-01")]
length(y2012)
sum(weekdays(y2012)=="lundi")
