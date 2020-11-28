#####################
### Load the data ###
#####################

# download file 
fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="activity.zip", method="curl")

# unzip file and load in test and training sets 
unzip(zipfile="activity.zip")

activities <-read.table(file.path("UCI HAR Dataset","activity_labels.txt"), header=FALSE) # activity labels (1-6)
features <-read.table(file.path("UCI HAR Dataset","features.txt"), header=FALSE)


# Y data sets are the labels
X_test <-read.table(file.path("UCI HAR Dataset","test", "X_test.txt"), header=FALSE) # test set 
Y_test <-read.table(file.path("UCI HAR Dataset","test", "Y_test.txt"), header=FALSE) # test labels
subject_test <-read.table(file.path("UCI HAR Dataset","test", "subject_test.txt"), header=FALSE)

X_train <-read.table(file.path("UCI HAR Dataset","train", "X_train.txt"), header=FALSE) #training set 
Y_train <-read.table(file.path("UCI HAR Dataset","train", "Y_train.txt"), header=FALSE) # training labels
subject_train <-read.table(file.path("UCI HAR Dataset","train", "subject_train.txt"), header=FALSE)

##################
### merge data ###
##################

test_data <-cbind(subject_test, Y_test, X_test)
train_data <-cbind(subject_train, Y_train, X_train)
mergedData <-rbind(test_data,train_data)
dim(mergedData)

##############################################
###   extract mesurements on the mean and   ###
### standard deviation for each measurement ###
###############################################

# create vector of variable names
allNames <- c("subject", "activity", as.character(features$V2)) 

# find all indicies of subject and activity with mean/std in allNames vector 
mean_std <- grep("subject|activity|[Mm]ean|std", allNames, value = FALSE) 

# subset the merged data using these indicies 
subsetData <- mergedData[ ,mean_std]


#########################################
### create descriptive activity names ###
#########################################

names(activities) <-c("activity_number", "activity_name")
subsetData$V1.1 <- activities$activity_name[subsetData$V1.1] 


################################################
### label subset data with descriptive names ###
################################################
reducedNames <-allNames[mean_std]
reducedNames <- gsub("mean", "Mean", reducedNames)
reducedNames <- gsub("std", "Std", reducedNames)
reducedNames <- gsub("gravity", "Gravity", reducedNames)
reducedNames <- gsub("[[:punct:]]", "", reducedNames)
reducedNames <- gsub("^t", "time", reducedNames)
reducedNames <- gsub("^f", "frequency", reducedNames)
reducedNames <- gsub("^anglet", "angleTime", reducedNames)
names(subsetData) <-reducedNames


########################################################
### created tidy data set with the average of        ###
### each variable for each activity and each subject ###
########################################################

subsetMelt <-melt(subsetData, id=c("subject", "activity"))
tidySet <-dcast(subsetMelt, subject+activity ~ variable,mean)

# write tidySet to .txt file 
write.table(tidySet, file="tidy.txt", row.names=FALSE)





