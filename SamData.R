## Import based on import manual
deerexample <- read.csv("deerexample.csv", sep = ";", header = TRUE)
## See the structure of the data
str(deerexample)
## Fist and last lines of data
head(deerexample)
tail(deerexample)
## Quick summary
summary(deerexample)
## Histogram
hist(deerexample$LAT)
hist(deerexample$LONG)
## Boxplot
boxplot(deerexample$LAT)
boxplot(deerexample$LONG)
