CODEBOOK

This codebook describes the data and the code in the file "run_analysis.R"

SOURCE DATA

The data was downloaded from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It's a zip file containing the folder: UCI HAR Dataset.

The folder UCI HAR Dataset contains information about experiments carried out with a group of 30 volunteers and has two folders:

test - data generated by 30% of the volunteers is contained in the folder 'test'.
train - data generated by 70% of the volunteers is contained in the folder 'train'

and four text files: 

activity_label - contains the names of the 6 activities performed by the volunteers
features - contains the variable names for each measurement. Has 561 measurements,
features_info 
README

The folder 'test' contains one folder:

Inertial Signals

and three text files:

subject_test - contains the ids of the volunteers in the test group. Has 2947 observations
X_test - contains the actual measurement data for the experiments conducted on the test group. Has 2947 observations
y_test - contains the ids of the activities(numbered 1-6) performed by the volunteers in the test group. Has 2947 observations 

The folder 'train' similarly contains one folder:

Inertial Signals

and three text files:

subject_train - contains the ids of the volunteers in the training group. Has 7352 observations.
X_train - contains the actual measurement data for the experiments conducted on the training group. Has 7352 observations
y_train - contains the ids of the activities(numbered 1-6) performed by the volunteers in the training group. Has 7352 observations

 

THE CODE

Reads the measurement data files X_test and X_train into separate dataframes.

Merges the two dataframes into a single dataframe. (mergedTrainTest)- 10299 observations.

Reads the features file into a dataframe.(features)

Assigns the 561 measurement names in 'features' as variable names for the 'mergedTrainTest' dataframe.

Identifies the row indices for the measurement names in 'features' which contain the word 'mean' or 'std'. (posMeanStd)

subsets the mergedTrainTest dataframe by extracting only those columns that correspond to the row indices identified in 'posMeanStd. Calls the new dataframe 'MeanStdDataset'
The MeanStdDataset has 79 columns.

Reads the subject_test and subject_train files and merges them into a single dataframe. (mergedSubTrainTest) - 10299 observations

Reads the y_test and y_test files and merges them into a single dataframe. (mergedyTrainTest) - 10299 observations

Adds these two dataframes, mergedSubTrainTest and mergedyTrainTest, as columns to the front of the 'MeanStdDataset'
The new dataframe is called 'subject_activity_dataset' and has 81 columns and 10299 observations.

Assigns names to the new columns.

Assigns descriptive names to the activities in column 2

Calculates the means by activity for each volunteer for all the measurements in the 'subject_activity_dataset' and assigns the resulting dataframe to 'final_tidy_dataset'.

The final_tidy_dataset has 180 rows and 81 columns.

Prints the structure of the dataset and the first 20 rows.

Sample:

 SubjectID Activity     `tBodyAcc-mean()~ `tBodyAcc-mean()~ `tBodyAcc-mean()~
       <int> <chr>                    <dbl>             <dbl>             <dbl>
 1         1 LAYING                   0.222          -0.0405            -0.113 
 2         1 SITTING                  0.261          -0.00131           -0.105 
 3         1 STANDING                 0.279          -0.0161            -0.111 
 4         1 WALKING                  0.277          -0.0174            -0.111 
 5         1 WALKING_DOW~             0.289          -0.00992           -0.108 
 6         1 WALKING_UPS~             0.255          -0.0240            -0.0973
 7         2 LAYING                   0.281          -0.0182            -0.107 
 8         2 SITTING                  0.277          -0.0157            -0.109 
 9         2 STANDING                 0.278          -0.0184            -0.106 
10         2 WALKING                  0.276          -0.0186            -0.106 
11         2 WALKING_DOW~             0.278          -0.0227            -0.117 
12         2 WALKING_UPS~             0.247          -0.0214            -0.153 
13         3 LAYING                   0.276          -0.0190            -0.101 


PACKAGES USED

dplyr

FUNCTIONS USED

cbind
funs
grep
group_by
head
mean
names
print
read.table
rbind
str
summarise_all





 










