
## First, we download the dataset .zip file if we haven't already

fileUrl <- 
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("UCI HAR Dataset.zip")){
    download.file(fileUrl, destfile= "UCI HAR Dataset.zip") 
}

## Unzip the dataset

unzip("UCI HAR Dataset.zip")

## load the data

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
xmerge <- rbind(xtest, xtrain)

## load the activity label IDs

ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="")
ymerge <- rbind(ytest, ytrain)

## add activity IDs to xmerge

merged <- cbind(ymerge, xmerge)


## add column names

features <- read.table("./UCI HAR Dataset/features.txt", sep="")
columns <- append("Activity ID", as.character(features[[2]]))
colnames(merged) <- columns

## add Activity Labels corresponding with Activity IDs

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
colnames(activity_labels) <- c("Activity ID", "Activity Label")
merged <- merge(merged, activity_labels, by = "Activity ID", all=TRUE)

## rearrange so that the Activity Label is the second column
merged <- merged[,c(1,563,2:562)]

## remove all columns that don't have "mean(" or "std(" or "Activity" in name

merged <- merged[, grep("mean[(]|std[(]|Activity", colnames(merged), value=TRUE)]

## create a new dataset with the average of each variable in merged

tidyMeans <- aggregate(merged[,3:68],by=list(merged$`Activity Label`), mean)
colnames(tidyMeans)[1] <- "Activity Label"

## write tidyMeans to a file

write.table(tidyMeans, file="tidyMeans.txt", col.names=TRUE, row.names=FALSE)
