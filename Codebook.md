# CodeBook
Kitdia  
Thursday, December 18, 2014  

## Variables/Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Other estimates have been removed for the purpose of this excercise.

Note: features are normalized and bounded within [-1,1].

## The Data

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Dataset: joined.data.extract

The steps done to the first part of the assignment is as follow:

1) Merges the training and the test sets to create one data set. **('joined.data' dataset)**

- Note: In this 'joined.data' dataset, first column provides info on the subject ID

2) Extracts only the measurements on the mean and standard deviation for each measurement. **('joined.data.extract' dataset)**

- This is possible mainly through the usage of grep() function
- 66 variables are extracted + 1 variable which describes the subject ID

3) Uses descriptive activity names to name the activities in the data set **('joined.data.extract' dataset updated to 68 variables)**

- Note: After this step, there will be an additional 1 more column/variable which describes the type of activity. (Ie. 68 variables)

4) Appropriately labels the data set with descriptive variable names. **('joined.data.extract' dataset updated with column names)**

### Dataset: tidy

The steps done to the second part of the assignment is as follow:

1) Find the average of each variable for each activity and each subject.

- Note: Averaging does not involve the two variables which describes the subject ID and types of acivities.
- This is done through 2 for-loops, incorporating usage of the unique() function, in order to subset out the data for each unique activity and subject.
- After subsetting out the data, colMeans() function is used to find the required average values.
- Lastly, write.table() function is used to create the tidy data set. 
- Note: In my tidy dataset, other than the 66 required variables, i have included additional 2 variables which provides the subject id and type of activity. Reason is because this will provide other users better idea of what my dataset info is about. 



