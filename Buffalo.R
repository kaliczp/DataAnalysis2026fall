### Access directy Exce sheet
## Install readxl package (only first time)
## install.packages("readxl")
## Load readxl package
library(readxl)
## After the quick read of vignette
?read_excel
## Based on of the manual we apply:
buffalo <- read_excel("buffalodata.xlsx")
