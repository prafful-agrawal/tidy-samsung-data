## Load the 'dplyr' package
library(dplyr)

## Check and download the data if not yet downloaded
if(!file.exists("./data")) {dir.create("data")}                 # Check to see if the directory exists
if(!file.exists("./data/dataset.zip")) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile = "./data/dataset.zip")
}

## Unzip the dataset and store in 'data' directory
if(!file.exists("./data/UCI HAR Dataset")) {
  unzip(zipfile = "./data/dataset.zip", exdir = "./data")
}

## Read the 'Training' data
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

## Read the 'Testing' data
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

## Read the 'Activity labels' and the 'Features'
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

## Merge the 'Training' and 'Testing' dataset into one dataset
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
dset <- rbind(train, test)                                      # Note: 'Training' set is before 'Testing' set
dim(dset); View(dset)                                           # Check the resulting dataset

## Use descriptive variable names
colnames(dset) <- c("subject", "activity", as.character(features$V2))

## Use descriptive activity labels
dset$activity <- factor(dset$activity, labels = activity$V2)

## Filter only the 'Mean' and 'Standard Deviation' measurements
dset <- dset[, c("subject", "activity", grep("-mean\\()-|-std\\()-", names(dset), value = TRUE))]

## Prepare the Tidy dataset
tidyset <- dset %>% arrange(subject, activity) %>% group_by(subject, activity) %>% summarise_all(mean)

if(!file.exists("output")) {dir.create("output")}               # Check to see if the directory exists
write.table(tidyset, "./output/tidyset.txt", row.name=FALSE)

## END