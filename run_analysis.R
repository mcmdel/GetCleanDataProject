# Merges the training and the test sets to create one data set.

current = getwd()

setwd(".\\GetCleanDataProject")

# Download Zip file
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile=".\\Dataset.zip")

# Extract files
  unzip(".\\Dataset.zip")

  setwd(".\\UCI HAR Dataset")

# load Files

# Descript data
  features <- read.table("features.txt", quote="\"")
  activity_labels <- read.table("activity_labels.txt", quote="\"")

  names(activity_labels)[1] <- "id.act"
  names(activity_labels)[2] <- "activity"

  names(features)[1] <- "id.feature"
  names(features)[2] <- "feature"

# Train Data
  subject_train <- read.table(".\\train\\subject_train.txt", quote="\"")
  y_train <- read.table(".\\train\\y_train.txt", quote="\"")
  X_train <- read.table(".\\train\\X_train.txt", quote="\"")
  
  names(y_train)[1] <- "id.act"
  names(subject_train)[1] <- "id.subject"

  train <- cbind(X_train,y_train)
  train <- cbind(train,subject_train)

# Test Data
  subject_test <- read.table(".\\test\\subject_test.txt", quote="\"")
  y_test <- read.table(".\\test\\y_test.txt", quote="\"")
  X_test <- read.table(".\\test\\X_test.txt", quote="\"")

  names(y_test)[1] <- "id.act"
  names(subject_test)[1] <- "id.subject"
  
  test <- cbind(X_test,y_test)
  test <- cbind(test,subject_test)

  allData <- rbind(train, test)  
  
# Appropriately labels the data set with descriptive variable names.   
  for (i in seq_along(features$id.feature)) {
     names(allData)[i] = unique(as.character(features[features$id.feature== i,]$feature))
  } 

# Extracts only the measurements on the mean and standard deviation for each measurement.   
  listaID <- names(allData)[grep("id.act",names(allData),fixed=TRUE)]  
  listaID <- append(listaID,names(allData)[grep("id.subject",names(allData),fixed=TRUE)])
  
  listField <- names(allData)[grep("mean()",names(allData),fixed=TRUE)]
  listField <- append(listField,names(allData)[grep("std()",names(allData),fixed=TRUE)])
  
  allDataFilter <- subset(allData,select=c(listaID,listField))

# Uses descriptive activity names to name the activities in the data set
  allDataMerge <- merge(activity_labels,allDataFilter)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  final <- aggregate(subset(allDataMerge,select=listField),by=list(activity=allDataMerge$activity,id.subject=allDataMerge$id.subject), FUN = mean)
  
  write.csv(final,"..\\tidy_project_Activity.csv")

  setwd(current)