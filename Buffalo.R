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

## Check the ID
factor(buffalo$ID) # We save the ID too

