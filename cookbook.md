# SmartPhone_Avg_Mean_Data.txt Cookbook

## Description: 
This is the code book for the file containing tidy data produced from samples collected from smart phone readings. 
The output dataset contains the averages of all mean and standard deviation variables found in the source data, grouped by Subject ID and Activity ID/Names. 

More information regarding how to use run_analysis.R is available in the README.md file.

## Source Data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Data Transformations: 

In order to arrive at the output dataset, the run_analysis.R script performs sevaral transformation of the raw data available at the source:

The script reads all the testing and training data and merges them into one large data frame; the Subject ID as well as Activity ID of each row is added in the process
All variables (columns) containing mean and standard deviations are kept while all other variables are discarded

Activity Name is added to each row based on matching with Activity ID
The data is aggregated (collapsed) by taking the mean of each column, splitting or grouping by both Subject ID as well as Activity ID
The data is then sorted in order by Subject ID, then by Activity ID/Name
Finally, the resulting tidy dataset is output as a space-delimited file with a header row


##Variables:

The output dataset adheres to same naming standards as the source data.

Naming Syle

"t" prefix: time domain signals
"f" prefix: frequency domain signals
"-XYZ" suffix: denote 3-axial signals in the X,Y, Z directions
"-mean" suffix: mean value
"-std" suffix: standard deviation value

##Variable List
SubjectID: The ID of the subject ranging from 1-30
ActivityID: The ID of the activity being performed, ranging from 1-6
ActivityName: Description of the activity recorded (6 types)
tBodyAcc-mean-X
tBodyAcc-mean-Y
tBodyAcc-mean-Z
tBodyAcc-std-X
tBodyAcc-std-Y
tBodyAcc-std-Z
tGravityAcc-mean-X
tGravityAcc-mean-Y
tGravityAcc-mean-Z
tGravityAcc-std-X
tGravityAcc-std-Y
tGravityAcc-std-Z
tBodyAccJerk-mean-X
tBodyAccJerk-mean-Y
tBodyAccJerk-mean-Z
tBodyAccJerk-std-X
tBodyAccJerk-std-Y
tBodyAccJerk-std-Z
tBodyGyro-mean-X
tBodyGyro-mean-Y
tBodyGyro-mean-Z
tBodyGyro-std-X
tBodyGyro-std-Y
tBodyGyro-std-Z
tBodyGyroJerk-mean-X
tBodyGyroJerk-mean-Y
tBodyGyroJerk-mean-Z
tBodyGyroJerk-std-X
tBodyGyroJerk-std-Y
tBodyGyroJerk-std-Z
tBodyAccMag-mean
tBodyAccMag-std
tGravityAccMag-mean
tGravityAccMag-std
tBodyAccJerkMag-mean
tBodyAccJerkMag-std
tBodyGyroMag-mean
tBodyGyroMag-std
tBodyGyroJerkMag-mean
tBodyGyroJerkMag-std
fBodyAcc-mean-X
fBodyAcc-mean-Y
fBodyAcc-mean-Z
fBodyAcc-std-X
fBodyAcc-std-Y
fBodyAcc-std-Z
fBodyAccJerk-mean-X
fBodyAccJerk-mean-Y
fBodyAccJerk-mean-Z
fBodyAccJerk-std-X
fBodyAccJerk-std-Y
fBodyAccJerk-std-Z
fBodyGyro-mean-X
fBodyGyro-mean-Y
fBodyGyro-mean-Z
fBodyGyro-std-X
fBodyGyro-std-Y
fBodyGyro-std-Z
fBodyAccMag-mean
fBodyAccMag-std
fBodyBodyAccJerkMag-mean
fBodyBodyAccJerkMag-std
fBodyBodyGyroMag-mean
fBodyBodyGyroMag-std
fBodyBodyGyroJerkMag-mean
fBodyBodyGyroJerkMag-std