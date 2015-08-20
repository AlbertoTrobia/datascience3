## Getting and cleaning data
## Project course
## Week 3

## Load all the required libraries

library(plyr)
library(dplyr)
library(data.table)
library(reshape)
library(reshape2)


## All the single files are loaded and assigned to six variables
## RAWtest and RAWtraining contain the measurements
## RAWactTest and RAWactTrain contain the activities
## RAWcaseTest and RAWcaseTrain contain the IDs
## fatures contains the names of the variables
## activities contains the names of the activities

RAWtest <- read.table("UCI HAR Dataset/test/X_test.txt")
RAWactTest <- read.table("UCI HAR Dataset/test/y_test.txt") 
RAWcaseTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

RAWtraining <- read.table("UCI HAR Dataset/train/X_train.txt") 
RAWactTrain <- read.table("UCI HAR Dataset/train/y_train.txt") 
RAWcaseTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")


## The names of the variables are assigned to the two main datasets
## data.frames are converted to data.tables
## Two variables (activity and ID) are added to the two main datasets 

colnames(RAWtest) <- features[,2]
## Appropriately labels the data set with descriptive variable names

RAWtest <- data.table(RAWtest)
RAWtest[, activity:=RAWactTest] 
RAWtest[, ID:=RAWcaseTest]
  
colnames(RAWtraining) <- features[,2]
## Appropriately labels the data set with descriptive variable names

RAWtraining <- data.table(RAWtraining)
RAWtraining[, activity:=RAWactTrain] 
RAWtraining[, ID:=RAWcaseTrain]


## The training and the test sets are merged to create one data set.

completeDataset <- rbind(RAWtest, RAWtraining)

## Extract only the measurements on the mean and standard deviation for each measurement 
## All variable names containing the words "mean" and "std" are stored in a vector (goodCol)
## Also column ID and activity are considered  
## The final dataset is, finally, compiled 

goodCol <- 0
columnNumbers <- ncol(completeDataset)

for (i in 1:columnNumbers)
{
if (grepl("mean", features[i,2]) > 0) 
{goodCol[i] <- i}  
} 
 
for (i in 1:columnNumbers)
{
if (grepl("std", features[i,2]) > 0) 
{goodCol[i] <- i}  
}

goodCol[columnNumbers-1] <- columnNumbers-1
goodCol[columnNumbers] <- columnNumbers

goodColClean <- as.vector(goodCol[!is.na(goodCol)])

finalDataset <- select(completeDataset, goodColClean)

## Descriptive activity names are added to the final set
finalDataset$activity <- mapvalues(finalDataset$activity, from = as.list(c("1","2","3","4","5","6")), to = as.list(activities[,2]))

###############################################################################################################################################

## From the final dataset, a second, independent tidy data set is created with the average of each variable for each activity and each subject.

columnNumbers <- ncol(finalDataset)
finalDataset$activity <- as.character(finalDataset$activity)

secondDataset <- melt(finalDataset, id = c((columnNumbers-1), columnNumbers), measure=c(1:(columnNumbers-2))) 
orderedSecondDataset <- dcast(secondDataset, ID + activity ~ variable, mean, row.name=FALSE)
orderedSecondDataset$activity <- mapvalues(orderedSecondDataset$activity, from = as.list(c("1","2","3","4","5","6")), to = c("LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"))

## The ordered second dataset is stored in a txt file called "week3assignment"
write.csv(orderedSecondDataset, file = "week3assignment.txt")