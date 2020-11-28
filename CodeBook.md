# About the Data

Reserachers conducted the experinemnt using 30 volunteers from 19-48 years of age. Each volunteer performed six different activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a smartphone that captured their acceleration and velocity. The data was divided into 70% for training and 30% for test data.  




# The Variables 
For each record we have: 


* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration

* Triaxial Angular velocity from the gyroscope 

* Its activity label (WALKING (1), WALKING_UPSTAIRS (2), WALKING_DOWNSTAIRS (3), SITTING (4), STANDING (5), LAYING (6))

* An identifier of the subject who carried out the experiment

* A 561-feature vector with time and frequency domain variables given in `features.txt`


# Transformations and Summaries 

The activity_labels data frame was relabeled which was then used to rename the activities variable in the data set. The variables in the feature vector were also given descriptive names. The final tidy data set contained the average of each variable for each activity and each subject. 
