# This the course project script for coursera getting and cleaning data 
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.


# setwd() to current directory
# then read in data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset//test//y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# merget them together
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
data <- cbind(subject_data,y_data,x_data)

# read in feature.txt
feature <- read.table("UCI HAR Dataset/features.txt")
included <- grep("mean|std",feature$V2)

# subset data
data <- data[,c(1,2,2+included)]

# activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
data[,2]=activities[data[,2],2]

# renaming columns
names(data) <- c("subject","activity",as.character(feature[included,2]))

# tidy_data
tidy_data <- aggregate(data[,-c(1:2)],by=list(data$subject,data$activity),mean)
names(tidy_data)[1:2]=c("subject","activity")

# write to file
write.table(tidy_data,file = "tidy_data.csv", row.names=F)
