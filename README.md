# Getting-Cleaning-Data-Project
Coursera Data Science Specialization Course

### Project Description
This project is an exercise in acquiring and cleaning data. The goal is to collect, work with, and clean a data set and to prepare tidy data that can be used for later analysis. The project uses data from the UCI Machine Learning Repository: Human Activity Recognition and Smart Phone Data site: *[Description here..](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)*

Data for the project can be downloaded here: *[Zip Archive Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)*

### Project Files
#### Data Processing Script: *run_analysis.R*
The R script run_analysis.R reads the data files and combines them into one full data file. The important features names are renamed to a more meaningful names. The full set of features is reduced to a subset that involve only the measurements on the mean and standard deviation for each measurement. Variable names are changed to be descriptive and to conform with R guidelines.

### Tidy Data Output: *tidyDataset.txt*
The data is then grouped by subject and activity, and summarized by each variable's mean. The end result is a tidy data set, conforming to Hadley Wickham's tidy data principles Tidy Data. The tidy data set is written to the file ***tidyDataset.txt.***

### Data Processing Description and Variable Names: *CodeBook.md*
The file CodeBook.md describes the processing steps and variables used in run_analysis.R and supplements the README.txt included in the original downloaded archive.
