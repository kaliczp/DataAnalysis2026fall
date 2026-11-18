### Access directy Exce sheet
## Install readxl package (only first time)
## install.packages("readxl")
## Load readxl package
library(readxl)
## After the quick read of vignette
?read_excel
## Based on of the manual we apply:
buffalo <- as.data.frame(read_excel("buffalodata.xlsx"))


##### About time
buffalo[1,"GMT Time"]
class(buffalo[1,"GMT Time"])
## Let's see and save the difference
buffaloTimeDiff <- as.POSIXct("2016-08-03 15:42:33", tz = "UTC") - buffalo[1,"GMT Time"] 
## Apply the correction
buffalo[1,"GMT Time"] + buffaloTimeDiff
## Correction OK, we use the vectorisation
buffaloTimeUTC <- buffalo[,"GMT Time"] + buffaloTimeDiff
## We correct also the date!
format(buffaloTimeUTC, format = "%T")
## Get the correct date
buffaloTimeDateUTC <- as.POSIXct(paste(format(buffalo[, "GMT Date"], format = "%Y-%m-%d"),
      format(buffaloTimeUTC, format = "%T")), tz = "UTC")

## Check the ID
factor(buffalo$ID) # We save the ID too

## Package for time-series
library(xts)
buffalo.xts <- xts(buffalo[,c(1,6:ncol(buffalo))], buffaloTimeDateUTC)
buffalo.xts <- xts(buffalo[,c("Lat", "Lon", "Cov", "HDOP", "Distance (m)", "Count")], buffaloTimeDateUTC)

plot(buffalo.xts$Cov)
plot(buffalo.xts[, "Distance (m)"])
plot(buffalo.xts["2016-08-08/2016-08-15", "Distance (m)"])
