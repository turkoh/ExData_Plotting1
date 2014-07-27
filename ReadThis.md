##run_analysis.R
This script prepare tidy data frame that can be used for later analysis from the Human Activity Recognition Using Smartphones Data Set (see a Codebook.md for more information).

#The script was writen by Andrey Kuznetsov as a project of the Coursera's Getting and Cleaning Data Course.

This R script process data from the UCI HAR Dataset that containing in three text files:

features.txt
train/X_train.txt (training data)
test/X-test.txt (test data)
The aim of the script is to merge training and test data and extract only the measurements on the mean and standard deviation for each measurement. The obtained tidy dataset saved as a separate text file.

What the script does:

Reads lines from the text files listed above.
Makes two data frames (training and test data) using elements from the features.txt file as names of columns.
Merges these two data frame forming the 'data' object.
Selects from this data frame columns with the 'mean' and 'std' in their names.
Uses these data to create a tidy data frame where each variable is a column and each observation is a row.
Saves data frames into csv and txt files.
