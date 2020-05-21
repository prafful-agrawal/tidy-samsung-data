## Load the dependencies

library(dplyr)

## Download the data(NOTE: Uncomment and run if data is not yet downloaded)

# if(!file.exists("data")) {dir.create("data")}         # Check to see if the directory exists
# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url, destfile = "./data/dataset.zip")

## Establish a connection

conn <- unzip("./data/dataset.zip")                   # Use 'unzip' for .zip file
conn                                                  # List all the files(/paths) in the connection

## Read the 'Activity labels' and the 'Feature names'

activity <- read.table(conn[1])                       # Activity Label
feature <- read.table(conn[2])                        # Feature Name

activity[[2]] <- factor(activity[[2]], levels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Read the 'Test' data

subject_test <- read.table(conn[14])                  # 'Subject' for 'Test' dataset
x_test <- read.table(conn[15])                        # 'Test' dataset
y_test <- read.table(conn[16])                        # 'Activity' for 'Test' dataset

## Read the 'Train' data

subject_train <- read.table(conn[26])                 # 'Subject' for 'Train' dataset
x_train <- read.table(conn[27])                       # 'Train' dataset
y_train <- read.table(conn[28])                       # 'Activity' for 'Train' dataset

## Merge the 'Testing' and 'Training' dataset into one

dset <- rbind(x_test, x_train)                        # Note: 'Test' set is before 'Train' set
dim(dset)                                             # Check the resulting dimension

## Link the columns names to their respective feature name

colnames(dset) <- feature[[2]]

## Filter only the 'Mean' and 'Standard Deviation' measurements

dset <- dset[, grep("-mean\\()-|-std\\()-", names(dset), value = TRUE)]

## Link the activity labels with respective activities

y_test <- merge(y_test, activity, by.x = "V1", by.y = "V1", sort = FALSE)
y_train <- merge(y_train, activity, by.x = "V1", by.y = "V1", sort = FALSE)

## Generate the 'Subject' and 'Activity' data for the dataset

sa_test <- cbind(subject_test, y_test[2])
sa_train <- cbind(subject_train, y_train[2])

sa_dset <- rbind(sa_test, sa_train)                   # Note: 'Test' set is before 'Train' set
colnames(sa_dset) <- c("subject", "activity")

## Add the subject and activity data to dataset 'dset'

dset <- cbind(sa_dset, dset)

## Prepare the Tidy dataset

tidyset <- dset %>% arrange(subject, activity) %>% group_by(subject, activity) %>% summarise_all(mean)

if(!file.exists("output")) {dir.create("output")}         # Check to see if the directory exists
write.table(tidyset, "./output/tidyset.txt", row.name=FALSE)

## END