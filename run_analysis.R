#####################
### Load the data ###
#####################

# download file 
fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="activity.zip", method="curl")

# unzip file and load in test and training sets 
unzip(zipfile="activity.zip")


X_test <-read.table(file.path("UCI HAR Dataset","test", "X_test.txt"), header=FALSE)
Y_test <-read.table(file.path("UCI HAR Dataset","test", "Y_test.txt"), header=FALSE)
subject_test <-read.table(file.path("UCI HAR Dataset","test", "subject_test.txt"), header=FALSE)

X_train <-read.table(file.path("UCI HAR Dataset","train", "X_train.txt"), header=FALSE)
Y_train <-read.table(file.path("UCI HAR Dataset","train", "Y_train.txt"), header=FALSE)
subject_train <-read.table(file.path("UCI HAR Dataset","train", "subject_train.txt"), header=FALSE)

##################
### merge data ###
##################

xData <-rbind(X_test, X_train)
yData <-rbind(Y_test, Y_train)
subjectData <-rbind(subject_test,subject_train)
