
library(dplyr)


XTest <- read.table("C:/Users/HP/Documents/Coursera/CleaningDataProject/UCI HAR Dataset/test/X_test.txt")

XTrain <- read.table("C:/Users/HP/Documents/Coursera/CleaningDataProject/UCI HAR Dataset/train/X_train.txt")

mergedTrainTest <- rbind(XTrain, XTest)




features <- read.table("C:/Users/HP/Documents/Coursera/CleaningDataProject/UCI HAR Dataset/features.txt")

names(mergedTrainTest) <- features$V2

posMeanStd <- grep('mean|std', features$V2)

MeanStdDataset <- mergedTrainTest[, posMeanStd]




sub_test <- read.table("C:/Users/HP/Documents/Coursera/CleaningDataProject/UCI HAR Dataset/test/subject_test.txt")

sub_train <- read.table("C:/Users/HP/Documents/Coursera/CleaningDataProject/UCI HAR Dataset/train/subject_train.txt")

mergedSubTrainTest <- rbind(sub_train, sub_test)




y_test <- read.table("C:/Users/HP/Documents/Coursera/CleaningDataProject/UCI HAR Dataset/test/y_test.txt")

y_train <- read.table("C:/Users/HP/Documents/Coursera/CleaningDataProject/UCI HAR Dataset/train/y_train.txt")

mergedyTrainTest <- rbind(y_train, y_test)




activity_dataset <- cbind(mergedyTrainTest, MeanStdDataset)

subject_activity_dataset <- cbind(mergedSubTrainTest, activity_dataset)




names(subject_activity_dataset)[1] <- "SubjectID"
names(subject_activity_dataset)[2] <- "Activity"

subject_activity_dataset$Activity[subject_activity_dataset$Activity == 1] <- "WALKING"
subject_activity_dataset$Activity[subject_activity_dataset$Activity == 2] <- "WALKING_UPSTAIRS"
subject_activity_dataset$Activity[subject_activity_dataset$Activity == 3] <- "WALKING_DOWNSTAIRS"
subject_activity_dataset$Activity[subject_activity_dataset$Activity == 4] <- "SITTING"
subject_activity_dataset$Activity[subject_activity_dataset$Activity == 5] <- "STANDING"
subject_activity_dataset$Activity[subject_activity_dataset$Activity == 6] <- "LAYING"




final_tidy_dataset <- subject_activity_dataset %>% 
                    group_by(SubjectID, Activity) %>%
                     summarise_all(funs(mean))



str(final_tidy_dataset)
print(head(final_tidy_dataset, 20))
