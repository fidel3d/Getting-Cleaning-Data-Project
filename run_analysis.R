# Project for week 04 - Coursera Data Science Specialization Course

library(readr) 
library(dplyr)


# 1.- Merges the training and the test sets to create one data set. ---------------------------------------------


# Data Description and Source File URLs

dataDescription <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

filename <- 'getdata_projectfiles_UCI HAR Dataset.zip'

# Checking if the archived file is already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Reading files from hard drive:

# Train data set:
# assigning X_train data sets to X_train_df
X_train_df <- read.table(file = './UCI HAR Dataset/train/X_train.txt', header = FALSE)

# assigning y_train data sets to y_train_activity
y_train_activity <- read.table(file = './UCI HAR Dataset/train/y_train.txt', 
                               header = FALSE)            

# assigning subject_train data sets to subject_train
subject_train <- read.table(file = './UCI HAR Dataset/train/subject_train.txt', 
                            header = FALSE)                


# Test data set
# assigning X_test data set to X_test_df
X_test_df <- read.table(file = './UCI HAR Dataset/test/X_test.txt', header = FALSE)

# assigning y_test data set to y_test_activity
y_test_activity <- read.table(file = './UCI HAR Dataset/test/y_test.txt', 
                              header = FALSE)            

# assigning subject_test data set to subject_test
subject_test <- read.table(file = './UCI HAR Dataset/test/subject_test.txt', 
                           header = FALSE)


# Data set labels and features:
# assigning activity_labels data set to activity_labels 
activity_labels <- read.table(file = './UCI HAR Dataset/activity_labels.txt', 
                              header = FALSE)                                       

# assigning features data set to features
features <- read.table(file = './UCI HAR Dataset/features.txt', header = FALSE)


# Combining Train and Test data sets:

# creating a new train data set with subject_train, y_train_activity, X_train_df
train <- cbind(subject_train, y_train_activity, X_train_df)

# creating a new test data set with subject_test, y_test_activity, X_test_df
test <- cbind(subject_test, y_test_activity, X_test_df)


# merging train and test data set in one
full_df <- rbind(train, test)


# 2.- Extracting only the measurements on the mean and standard deviation for each measurement. --------------------------------

# Combining the data sets of subject, activity and features to create a character vector name headers_names
headers_names <- c("subject", "activity", as.character(features$V2))


# extracting subject, activity with the mean and standard deviation measurements
col_subject_activity_mean_std <- grep("subject|activity|[Mm]ean|std", headers_names, value = FALSE)   # pickup any column with subject, activity, mean  and std


# creating a tidy data set with average of each variable for each activity and each subject

smaller_df <- full_df[,col_subject_activity_mean_std]


# 3.- Uses descriptive activity names to name the activities in the data set ---------------------------------------------------

# Rename the columns of the activity_labels 
names(activity_labels) <- c("activityID", "activityName")

# Replacing 'activityID' with 'activityName' so 1 to Walking, 2 to Walking_upstairs and so on
smaller_df$V1.1 <- activity_labels$activityName[smaller_df$V1.1]  # 


# 4.- Appropriately labels the data set with descriptive variable names. -------------------------------------------------------

# Creating a vector string_change and replacing some string characters for better readability 
string_change <- headers_names[col_subject_activity_mean_std]    
string_change <- gsub("mean", "Mean", string_change)
string_change <- gsub("std", "Std", string_change)
string_change <- gsub("gravity", "Gravity", string_change)
string_change <- gsub("[[:punct:]]", "", string_change)
string_change <- gsub("^t", "time", string_change)
string_change <- gsub("^f", "frequency", string_change)
string_change <- gsub("^anglet", "angleTime", string_change)

# Replace the modified string character into the column's names of smaller_df
names(smaller_df) <- string_change                              


# 5.- From the data set in step 4, creates a second, independent tidy data set with the ----------------------------------------
# average of each variable for each activity and each subject.

tidyDataset <- smaller_df %>% 
  group_by( subject, activity) %>% 
  summarise_all(list(mean = mean))

# Writing a file of the tidyDataser into the UCI HAR Dataset directory
write.table(tidyDataset, file = "./tidyDataset.txt", row.name=FALSE)

str(tidyDataset)


