`run_analysis.R` is a script that tidies the dataset provided for the course project of the coursera course ´Getting and Cleaning data´ 

The raw data can be obtained here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A description of the data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The data is tidied based on the following guidelines:

* You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The steps taken in the tidying are:
* Merging similar datasets with 'rbind' eg, ´x´ data with ´x´ data and ´y´data with ´y´ data.
* Selection of the columns containing mean and standard deviation sets.
* Correctly naming the columns using the descriptive names from the ´features.txt´ file.
* Replacing the numerical activity label with the activity name from the `activity_labels.txt` file.
* Replacing non-descriptive column names.
* Creation of a data set with only the average measures for each subject and activity type. The data set is written to disk as 'DATA_avg.txt´ in the working directory.

* Raw data from the downloaded files is contained in:
`DATA_train_x`, `DATA_train_y`, `DATA_test_x`, `DATA_test_y`, `SUBJECTS_train` and `SUBJECTS_test`.
* These raw data sets are merged into:
'DATA_x', 'DATA_y' and 'SUBJECTS_data'
* As the x data set does not have names as such, the names of the columns are stored in:
'NAMES'
* This is later used to make a numerical vector for the selection of the specified columns (containing mean and std)
* The selection is stored in:
'SELECTION'

* The activity labels are replaced in a similar approach.

* All data is then merged into:
'DATA_set'

* As per guideline, the averages are calculated and these are stored in:
'DATA_avg'
* After this it is written to disc as a .txt file with the same name in the working directory

