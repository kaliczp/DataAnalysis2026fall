## Import based on import manual
deerexample <- read.table("deerexample.csv", sep = ";", header = TRUE)
## See the structure of the data
str(deerexample)
## Fist and last lines of data
head(deerexample)
tail(deerexample)
### EDA Exploratory Data Analysis
## Quick summary
summary(deerexample)
fivenum(deerexample$ID) #Tukey's five number
## Histogram
hist(deerexample$LAT)
hist(deerexample$LONG)
## Boxplot
boxplot(deerexample$LAT)
boxplot(deerexample$LONG)