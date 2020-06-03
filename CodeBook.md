## Code Book

Coursera Data Science Specialization Course
Getting and Cleanng Data
Course Project

### About the source data

This project is an exercise in acquiring and cleaning data. The goal is to collect, work with, and clean a data set and to prepare tidy data that can be used for later analysis. The project uses data from the UCI Machine Learning Repository: Human Activity Recognition and Smart Phone Data site: *[Description here..](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)*

Data for the project can be downloaded here: *[Zip Archive Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)*

### About the *R* script

The *R* script called run_analysis.R will perform the following.

1. Merges the training and the test sets to create one data set.  
    - With provided URL *[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)* to download and then unzip the file to the local hard drive
    - The train dataset is assigned to three variables  
        - *X_train_df*  
        - *y_train_activity*  
        - *subject_train*  
    - The test dataset is assinged to three varaibles  
        - *X_test_df*  
        - *y_test_activity*  
        - *subject_test*  
    - The activity and features data set are assign to two variables  
        - *activity_labels*  
        - *features*  
    - Train dataset is combined with subject_train     
    - Test dataset is combined with subject_test  
    - The two dataset were merge to create a full dataset called full_df  
    
2. Extraction of only the measurements on the mean and standard deviation for each measurement.
    - The creation of a character vector named headers_names from features dataset plus adding the new columns for subject and activity
    - The creation of another character vector named col_subject_activity_mean_std to from headers_names to extract the only the mean and standard deviation columns plus the subject and activity
    - The creation of smaller intermediary dataset named smaller_df from the full dataset  
    
3. Uses descriptive activity names to name the activities in the data set  
    - Changing variables from activityId to activityName for better readability
        - 1 to walking 
        - 2 to walking_upstairs 
        - 3 to walking_downstairs
        - 4 to sitting
        - 5 to standing
        - 6 to laying  
    
4. Appropriately labels the data set with descriptive variable names.
    - The creation of a new character vector named string_change to then replace some of the string 
        - "mean" to "Mean"
        - "std" to "Std"
        - "gravity" to "Gravity"
        - "[[:punct:]] to 'blank space'
        - "^t" to "time"
        - "^f" to "frequency"
        - "^anglet" to 'angleTime"  
        
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    - Finally the creation of the ***tidyDataset*** from the *smaller_df*  
    - Group by *subject* and *activity*
    - Summarized
