## Getting and cleaning data
## Project course
## Week 3

## The script begins loading all the required libraries

## All the single files are loaded and assigned to six variables:
## RAWtest and RAWtraining contain the measurements
## RAWactTest and RAWactTrain contain the activities
## RAWcaseTest and RAWcaseTrain contain the IDs
## fatures contains the names of the variables
## activities contains the names of the activities

## The names of the variables are assigned to the two main datasets
## data.frames are converted to data.tables
## Two variables (activity and ID) are added to the two main datasets 

## An istruction appropriately labels the data set with descriptive variable names

## The training and the test sets are merged to create one data set.

## Now the script extracts only the measurements on the mean and standard deviation for each measurement 
## All variable names containing the words "mean" and "std" are stored in a vector (goodCol)
## Also column ID and activity are considered  
## The final dataset is, finally, compiled 

## Descriptive activity names are added to the final set

############################################################################################################################

## From the final dataset, a second, independent tidy data set is created with the average of each variable for each activity and each subject.
## Melt and dcast are used for this task.

## The ordered second dataset is stored in a txt file called "week3assignment"


##############
## CODEBOOK ##
##############

The "orderedSecondDataset" stored in the file week3assignment.txt contains the data collected from an experiment carried out with a group of 30 volunteers, who performed six kind of activities. Then the dataset has 30x6=180 rows and 81 variables (ID, activities, mean and std.dev of each observation)

[1] "ID"	
    Levels: 1:30
[2] "activity"
    Levels:
    LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
  
[3] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
[5] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"               
[7] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
[9] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
[11] "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
[13] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[15] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
[17] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"           
[19] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
[21] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
[23] "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
[25] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[27] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[29] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"          
[31] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[33] "tBodyAccMag-mean()"              "tBodyAccMag-std()"              
[35] "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
[37] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
[39] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
[41] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"         
[43] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[45] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"               
[47] "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
[49] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
[51] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
[53] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"          
[55] "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
[57] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"      
[59] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[61] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[63] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
[65] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"              
[67] "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
[69] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
[71] "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
[73] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
[75] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
[77] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"    
[79] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
[81] "fBodyBodyGyroJerkMag-meanFreq()"
