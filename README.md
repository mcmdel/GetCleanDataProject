## Introduction

For performing the following steps of **Getting and Cleaning Data Course Project**


1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Data

* Original Dataset: [Activity monitoring data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) [59.6MB]


## Data Processing

For this assingment Project, the following changes from the original data were made:

### Getting Description Data (step 1)

* Extracting Features names and Activity Descriptions from original files ** ("features.txt" and "activity_labels.txt") **

### Merge Train and Test Data (step 1)

* Loading and ajusting column names of Train and Test data ** ("y_train.txt", "x_train.txt", "y_test.txt" and "x_test.txt") ** 

### Appropriately labels the data set with descriptive variable names (step 4)

* rename all columns of the features observations to features names

### Extracts only the measurements on the mean and standard deviation for each measurement. (step 2 and 3)
* filter the columns of "mean" and "std" measurements
* subset identification and measurements columns
* Uses descriptive activity names to name the activities in the data set

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject. (step 5) 
* aggregate by mean of all filtered columns observations by activity and subject;
* write the final CSV file ** ("tidy_project_Activity.txt") **

