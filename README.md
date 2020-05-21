# tidy-samsung-data
 *Getting and Cleaning Data Course Project*
 
In this project a dataset available at <a href = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">this link</a> is used for the cleaning and tidying assignment.
 
>[Full description is available at the site where the data was obtained from: <a href = "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">link</a>]
 
The data is downloaded in the **'data'** directory as the file **'dataset.zip'** using the script **'run_analysis.R'**. The same script is then used to clean the data. Further, an output is generated and stored in the **'output'** directory as **'tidyset.txt'**.

The script **'run_analysis.R'** takes the dataset, merge the *'training'* and *'testing'* sets, adds the *'subject'* and *'activity'* information and then reorder the data accordingly. Then, it generates the output **'tidyset.txt'** which contains the tidy dataset with the average of each variable for each activity and each subject.
