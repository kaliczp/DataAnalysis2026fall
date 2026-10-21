## Imprt birddata
BirdData <- read.table("birddata.csv", header = TRUE, sep = ";")
## Convert chararter vector to factor (categorical variable)
BirdData[,1] <- factor(BirdData[,1])
BirdData$Seasons <- factor(BirdData$Seasons)
BirdData[, "Order"] <- factor(BirdData[, "Order"])
levels(BirdData[, "Order"])
BirdData[, "Family"] <- factor(BirdData[, "Family"])
levels(BirdData[, "Family"])
