#An R script that does the following on the UCI HAR DATASET:

#    1. Merges the training and the test sets to create one data set
#    2. Extracts only the measurements on the mean and standard deviation for each measurement
#    3. Uses activity names to describe the activities on the dataset
#    4. Labels the data set with descriptive variable names (to the best of my ability)
#    5. Calculates the mean per subject per activity
#    6. writes .5 into a txt file 

#Ensure that the files have been extracted from the compressed file
#The libraries loaded below are needed

library(plyr); library(dplyr); library(reshape2)

#=========IGNORE THIS===========================================================
# x_test <- read.table('./data/UCI HAR Dataset/test/X_test.txt')                |
# y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt')                |
# 
# x_train <- read.table('./data/UCI HAR Dataset/train/X_train.txt')             |
# y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt')             |
# 
# ind_test <- read.table('./data/UCI HAR Dataset/test/subject_test.txt')        |
# ind_train <- read.table('./data/UCI HAR Dataset/train/subject_train.txt')     |
# 
# dataLabels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')        |
# features <- read.table('./data/UCI HAR Dataset/features.txt')                 |
#===============================================================================


#If the raw files are in different directories (which might be the case)
#specify the directories to the files. If you do not know what files to use, 
#kindly read the Code Book accompanying this analysis.
#(By default, I have specified my directories 
#according to the way it is on my computer):

#++++Directories were not put inside the function for convenience (kind of)+++++++++
#+++If you pull this repo, you will be able to run this analysis fairly quickly after extracting the files+++++++
#+++Files should be extrated right into the './data' directory

dir_X_test = './data/UCI HAR Dataset/test/X_test.txt'
dir_y_test = './data/UCI HAR Dataset/test/y_test.txt'
dir_X_train = './data/UCI HAR Dataset/train/X_train.txt'
dir_y_train = './data/UCI HAR Dataset/train/y_train.txt'
dir_subject_test = './data/UCI HAR Dataset/test/subject_test.txt'
dir_subject_train = './data/UCI HAR Dataset/train/subject_train.txt'
dir_dataLabels = './data/UCI HAR Dataset/activity_labels.txt'
dir_features = './data/UCI HAR Dataset/features.txt'

#run_analysis function
run_analysis <- function(){
    
    #Read the txt files into dataframes
    x_test <- read.table(dir_X_test)
    y_test <- read.table(dir_y_test)
    
    x_train <- read.table(dir_X_train)
    y_train <- read.table(dir_y_train)
    
    ind_test <- read.table(dir_subject_test)
    ind_train <- read.table(dir_subject_train)
    
    dataLabels <- read.table(dir_dataLabels)
    features <- read.table(dir_features)
    
    #combine x_train and x_test
    x_merged <- rbind(x_train, x_test)
    
    #create a condition to extract the mean and std
    condition <- grep('.*mean()|.*std()', features[, 2])
    
    #get condition names and remove some not-so-needed characters
    #also rename the labels
    #process is a bit laborious but fun: rinse and repeat
    conditionNames <- grep('.*mean()|.*std()', features[, 2], value = T)
    conditionNames <- sapply(conditionNames, function(x) {gsub('[()]', '', x)})
    conditionNames <- sapply(conditionNames, function(x) {sub('^[tT]', 'Time.', x)}) 
    conditionNames <- sapply(conditionNames, function(x) {sub('^[fF]', 'Frequency.', x)})
    conditionNames <- sapply(conditionNames, function(x) {sub('[mM]ag', 'Magnitude', x)})
    conditionNames <- sapply(conditionNames, function(x) {gsub('[-]', '.', x)})
    
    #use the condition to extract the mean and std columns from x_merged
    x_extracted <- x_merged[, condition]
    
    #use conditionNames to names the columns of x_extracted
    names(x_extracted) <- conditionNames
    
    #rbind train and test for individuals(ind) and activities(y)
    #cbind with x_extracted
    allData <- cbind(rbind(ind_train, ind_test), rbind(y_train, y_test), x_extracted)
    
    #rename the first two columns to be 'subjects' and 'activity' respectively
    names(allData)[1] <- 'subject'; names(allData)[2] <- 'activity'
    
    #properly name the activities
    #initially, 5, 4, 3, 2, 1; now becomes, walking; use dataLabels
    allData$activity <- factor(allData$activity, labels=as.character(dataLabels$V2))
    
    # #create a copy of allData
    # copy_allData <- data.frame(allData)
    
    #calculate mean of allData by each activity of each subject
    #melt the copied data by activity and subject
    #re cast into a dataframe, tidyDataByMean
    tidyDataByMean <- allData %>% 
        ddply(c('subject', 'activity'), numcolwise(mean)) %>% 
            melt(id.vars=c('subject', 'activity')) %>% 
                dcast(subject+activity ~ variable)
    
    #write tidy date into a txt file, tidyUCIdataset.txt
    write.table(tidyDataByMean, file = './tidyUCIdataset.txt', row.names = F)
}

#run the script
run_analysis()












