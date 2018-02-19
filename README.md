# README: run_analysis.R
## "Getting and Cleaning Data" Course Project

This script takes the "Human Activity Recognition Using Smartphones" data set from the UCI Machine Learning Repository [(Link)]( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), combines the data into one tidy dataset, and then creates a new tidy data set of calculated averages.

After running the script, you may find the tidy means data frame named "tidyMeans" in your environment, or by running:

> tidyMeans = read.table("tidyMeans.txt", header=TRUE)
> View(tidyMeans)

The run_analysis.R script works by: 

1. Downloading and extracting the data set
2. Combining the "test" and "train" sets and activity label IDs
3. Adding the activity IDs to the data set
4. Adding the column names from features.txt
5. Adding descriptive activity labels (rather than just IDs)
6. Removing all columns that aren't a mean or standard deviation
7. Creating a new data set of means for each activity label


