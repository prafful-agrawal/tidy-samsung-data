# CodeBook

- **Variables:**
1. subject
2. activity
3. tBodyAcc
4. tGravityAcc
5. tBodyAccJerk
6. tBodyGyro
7. tBodyGyroJerk
8. fBodyAcc
9. fBodyAccJerk
10. fBodyGyro
  
**NOTE:** *For each of the above variables, except **subject** and **activity**, there is signal data for X, Y and Z respectively.
Also, the set of variables that were estimated from these signals are: **mean() - Mean value** & **std() - Standard deviation**.*

- **Data:**
1. Subject variable where each value identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
2. Activity variable which denotes the following 'WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', and 'LAYING'.
3. Accelerometer and Gyroscope data as collected from the smartphone.

- **Transformations:**
1. 'Testing' and 'Training' datasets were merged.
2. The data was filtered considering the measurements for only the mean and standard deviation.
3. Subject and Activity data was appended to the dataset.
4. An independent tidy data set was generated with the average of each variable for each activity and each subject.
