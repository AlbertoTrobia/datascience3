## Getting and cleaning data - Project course - Week 3

### Creating the first dataset 

The script begins loading all the required libraries

All the single files from the folder "UCI HAR Dataset" are loaded and assigned to six variables:
* RAWtest and RAWtraining contain the measurements
* RAWactTest and RAWactTrain contain the activities
* RAWcaseTest and RAWcaseTrain contain the IDs
* fatures contains the names of the variables
* activities contains the names of the activities

The names of the variables are assigned to the two main datasets

Data frames are converted to data.tables

Two variables (activity and ID) are added to the two main datasets 

An istruction appropriately labels the data set with descriptive variable names

The training and the test sets are merged to create one data set.

Now the script extracts only the measurements on the mean and standard deviation for each measurement. All variable names containing the words "mean" and "std" are stored in a vector (goodCol). Also column ID and activity are considered. The final dataset is, finally, compiled. 

Descriptive activity names are added to the final set

### Creating the first dataset

From the final dataset, a second, independent tidy data set is created with the average of each variable for each activity and each subject.

Melt and dcast are used for this task.

The ordered second dataset is stored in a txt file called "week3assignment"
