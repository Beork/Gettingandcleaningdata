# add the dplyr library
library(dplyr)

########## Merge the training and test sets to create one data set

# read train data
DATA_train_x <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
DATA_train_y <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
SUBJECTS_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")

# read test data
DATA_test_x <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
DATA_test_y <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
SUBJECTS_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")

# bind 'x' data for train and test
DATA_x <- rbind(DATA_train_x, DATA_test_x)

# bind 'y' data for train and test
DATA_y <- rbind(DATA_train_y, DATA_test_y)

# create 'subject' data set
SUBJECTS_data <- rbind(SUBJECTS_train, SUBJECTS_test)
# Change name into descriptive name
names(SUBJECTS_data) <- "subject"

########## Extract only the measurements on the mean and standard deviation for 
########## each measurement
# Create a table containing the descriptive names
NAMES <- read.table("./UCI_HAR_Dataset/features.txt")

# Select only mean() and std() columns. '()' was used in the selection criteria 
# because mean and std sets always had '()', whereas some variables contained 
# 'mean' in the name, but did not have a corresponding 'std'. 
SELECTION <- grep("-(mean|std)\\(\\)", NAMES[, 2])

# Select data based on SELECTION made one step before
DATA_x <- DATA_x[, SELECTION]

# Change names to descriptive names
names(DATA_x) <- NAMES[SELECTION, 2]

###### Use descriptive activity names to name the activities in the data set
# Create table with the proper names of the activities
ACTIVITY_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")

# Add these labels to the corresponding dataset
DATA_y[, 1] <- ACTIVITY_labels[DATA_y[, 1], 2]

# Change name into descriptive name
names(DATA_y) <- "activity"

# Create a single data set containing all selected data. 
DATA_set <- cbind(DATA_x, DATA_y, SUBJECTS_data)

######## Create a second, independent tidy data set with the average of each 
########## variable for each activity and each subject
# There are 66 numerical variables in the dataset and 2 qualitative 
# (activity & subject). Therefore the means are taken from the numerical
DATA_avg <- ddply(DATA_set, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Write the table to the work directory
write.table(DATA_avg, "DATA_avg.txt", row.name=FALSE)
