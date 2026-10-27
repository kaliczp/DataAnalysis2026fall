## Imprt birddata
BirdData <- read.table("birddata.csv", header = TRUE, sep = ";", quote = "")
## Convert chararter vector to factor (categorical variable)
BirdData[,1] <- factor(BirdData[,1])
BirdData$Seasons <- factor(BirdData$Seasons)
BirdData[, "Order"] <- factor(BirdData[, "Order"])
levels(BirdData[, "Order"])
BirdData[, "Family"] <- factor(BirdData[, "Family"])
levels(BirdData[, "Family"])
BirdData[, "Species"] <- factor(BirdData[, "Species"])
levels(BirdData[, "Species"])
## Abudance, dirversity.... Vegan!

## Load
library(vegan)
?diversity
## Check the Example section at the end!
data(BCI, BCI.env) # load dataset
?BCI # do not forget the manual
diversity(BCI) # Test function with example dataset!

## Reformat BirdData for one season one sampling point
BirdWetAbattoir <- BirdData[BirdData$Sites == "Abattoir" & BirdData$Seasons == "Wet","Counted"]
diversity(BirdWetAbattoir)
BirdDryAbattoir <- BirdData[BirdData$Sites == "Abattoir" & BirdData$Seasons == "Dry","Counted"]
diversity(BirdDryAbattoir)
BirdMatrix <- rbind(BirdWetAbattoir,BirdDryAbattoir)
BirdSpecies <- BirdData[BirdData$Sites == "Abattoir" & BirdData$Seasons == "Wet","Species"]
colnames(BirdMatrix) <- BirdSpecies
diversity(BirdMatrix)
## Extend the matrix
BirdWetBaroRiB <- BirdData[BirdData$Sites == "BaroRiB" & BirdData$Seasons == "Wet","Counted"]
BirdDryBaroRiB <- BirdData[BirdData$Sites == "BaroRiB" & BirdData$Seasons == "Dry","Counted"]
BirdMatrix <- rbind(BirdWetAbattoir, BirdDryAbattoir, BirdWetBaroRiB, BirdDryBaroRiB)
colnames(BirdMatrix) <- BirdSpecies

