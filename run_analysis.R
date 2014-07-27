# This script is for working with the raw data collected from smart phones
# Please read the readme.md file for more information

# Note: This script needs to be placed at the same level as the first folder of the data set

# Reading the test tables
X_Test <- read.table("test/X_test.txt")
Y_Test <- read.table("test/y_test.txt")
Subject_Test <- read.table("test/subject_test.txt")

# Reading the training tables
X_Train <- read.table("train/X_train.txt")
Y_Train <- read.table("train/y_train.txt")
Subject_Train <- read.table("train/subject_train.txt")

# Create a data_frame with entire set of test fields
Test_All_Fields <- cbind(X_Test,Y_Test,Subject_Test)

# Create a data_frame with entire set of training fields 
Training_All_Fields <- cbind(X_Train,Y_Train,Subject_Train)

# Create a data_frame containing the entire training and test data
Data_Complete_Test_Training <- rbind(Test_All_Fields,Training_All_Fields) 

# Reading the table with features
features <-read.table("features.txt")

# Extract the second column from the features data frame
columnNames <- gsub("\\(\\)","",features[,2])
columnNames  <- gsub("meanFreq","MeanFrequency",columnNames )

# Find the columns for Mean and STD and store it as an index; then use it to retrieve columns
# that are required for the purpose; we also want to include the activity id and subject id columns
Index_Mean_STD <- grep("mean|std",columnNames)
Data_Mean_STD <- Data_Complete_Test_Training [,c(Index_Mean_STD,562:563)]
colnames(Data_Mean_STD)[67:68] <- c("ActivityID","SubjectID")

# Read "activity labels" table and renames the columns
ActivityLabel <- read.table("activity_labels.txt")
colnames(ActivityLabel) <- c("ActivityID","ActivityName")

#Join our Data_Mean_STD with ActivityLabel to get the activity names, then rearrange the columns properly
Data_Mean_STD <- merge(Data_Mean_STD,ActivityLabel,by="ActivityID",all.x=TRUE)
Data_Mean_STD <- Data_Mean_STD[c(68,1,69,2:67)]

# Rename the mean/std dataset column names to match that of the original data source
colnames(Data_Mean_STD)[4:69] <- columnNames[Index_Mean_STD] 

# Create tidy dataset of average values for each column, group by subject and activity
Data_Final <- aggregate(.~SubjectID+ActivityID+ActivityName,FUN=mean,data=Data_Mean_STD)

# Order the data by subject id and then by activity id and activity name, 
# The output to file as space-delimited txt, with headers included
Data_Final <- Data_Final[order(Data_Final$SubjectID,Data_Final$ActivityID,Data_Final$ActivityName),]
write.table(Data_Final,"SmartPhone_Avg_Mean_Data.txt",row.names=FALSE)