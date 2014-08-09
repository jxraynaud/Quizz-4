temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",temp)
rawGDP <- read.table(temp,sep=",",header=FALSE, skip=5, nrows=190, quote="\"") # On garde juste la partie qui nous intÃ©resse.
GDP <- rawGDP[,c(1,2,4,5)] # On dÃ©gage les cols qui ne servent Ã  rien.
names(GDP)<-c("CountryCode", "Ranking", "Country", "GDP2012") 
GDP$Country <- as.character(GDP$Country)
GDP$GDP2012<-as.numeric(gsub(",","",GDP$GDP2012)) #pour transformer les chaines de char en numeric en dÃ©gageant les ,.
unlink(temp)

# Q2:
mean(GDP$GDP2012)

#Q3:
CountryNames <- GDP$Country
grep("^United",GDP$Country)

## second file.

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",temp)
EDU <- read.table(temp,sep=",",header=TRUE,na.strings="",fill=TRUE,quote="\"")
unlink(temp)


## merge the data on Country Code dropping the data for countries that are on EDU but not GDP
DF <- merge(GDP,EDU,by="CountryCode",all=TRUE)

#Q4:
sum(grepl("Fiscal year end: June 30", DF$Special.Notes))