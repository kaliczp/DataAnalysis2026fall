## Import based on import manual
deerexample <- read.table("deerexample.csv", sep = ";", header = TRUE)
## If you have error here try to check the file in the working folder?
dir() # File "deerexample.csv" needs in the list
getwd() # Print the working directory (folder)
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

### Expore the missing data
IndexVector <- deerexample$ID
## Indexing
IndexVector[900]
IndexDiff <- diff(IndexVector)
summary(IndexDiff) # Conclusion no massive block
boxplot(IndexDiff)
sum(IndexDiff == 5) # Two longer gaps
sum(IndexDiff == 3)
## Let's control
18143 - 17987 # Index differences at the end 156
2 * 4 + 74 * 2 # Numerical control 156
sum(IndexDiff > 1)
### Explanation
## Creat a short vector
tmp <- 1:5 # With colon operator
tmp <- seq(1,5,1) # With function the same
tmp <- seq(from = 1, to = 5, by = 1) # With argument names
tmp <- c(1,2,3,4,5) # same vector element-by-element with c()
tmp[3] # Index by number
tmp[c(FALSE, FALSE, TRUE, FALSE, FALSE)] # With T, F
tmp[tmp > 2 & tmp < 4] # with some logical expression
## Go back to the data
IndexDiff[IndexDiff > 1] # We see the distribution
## Explanation, because different length
tmp[c(FALSE, FALSE, TRUE)] # The result the same above, because recycling
IndexVector[IndexDiff > 1] # We use the logical expression for different dataset
### Indexing of 2D dataset
tmp.df <- data.frame(tmp, back = 5:1)
tmp.df[1,1] # indexing of 2D dataset [row, column]
tmp.df[1,2] # first row, second column
tmp.df[1,] # first row, every column
tmp.df[,2] # Second column, every rows 
tmp.df[c(FALSE, FALSE, TRUE),]
## Indexing of the deer dataset
deerexample[IndexDiff > 1,]
## Get the neighboring data about gaps with indexing
deerexample[1,c("DATE","UTC")] # data.frame can be indexed by column name
## by logical
DeerGapStart <- deerexample[c(IndexDiff > 1,FALSE),c("DATE","UTC")]
DeerGapEnd <- deerexample[c(FALSE,IndexDiff > 1),c("DATE","UTC")]
DeerMissingTable <- cbind(DeerGapStart, End = DeerGapEnd[,"UTC"])
colnames(DeerMissingTable)<-c("Date", "Start","End")
## Home Work try to make a table with the start and end index of the gaps

### Work with time
Sys.Date()-1
Sys.Date()-20747 # check the origin
Sys.Date()-9:0 # past 10 days
## Convert dates form deerexample
as.Date(deerexample$DATE, format = "%d.%m.%Y")
## Convert time
deerexample$Time <- as.POSIXct(paste(deerexample$DATE, deerexample$UTC), format = "%d.%m.%Y %T", tz = "UTC")
plot(deerexample$Time,deerexample$LAT, type = "l")
## See together the LAT/LONG
par(mfrow = c(2,1))
plot(deerexample$Time,deerexample$LAT, type = "l")
plot(deerexample$Time,deerexample$LONG, type = "l")

