---
title: "TidyUCIDatasetCodeBook"
author: "temi"
date: "4/28/2020"
output:
  html_document: default
  pdf_document: default
---

## Information about the data, analysis and output

This is a Code Book describing the variables in the raw and tidied dataset (tidyUCIdataset.txt). Scroll down to find details on the cleaned dataset after running the script, run_analysis.R. More information can be found in the compressed dataset. 

The complete list of variables of each feature vector is available in 'features.txt' in the dataset. 

After running run_analysis.R on the raw files, a txt file is generated. Not all the files corresponding to the dataset are used in this summary report. Instead, only the mean and standard deviation of each observation was extracted.

The analysis makes use of the following files in the dataset:

- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': each subject in the test data identified by a number
- 'train/subject_train.txt': each subject in the train data identified by a number
- 'activity_labels.txt': each activity
- 'features.txt': each feature/measurement

After analysis, the resulting (first two) columns are:

- subject: refers to each subject's ID (from 1 to 30)
- activity: refers to each activity measured

The rest of the columns/variables are: 

- "3" "Time.BodyAcc.mean.X"
- "4" "Time.BodyAcc.mean.Y"
- "5" "Time.BodyAcc.mean.Z"
- "6" "Time.BodyAcc.std.X"
- "7" "Time.BodyAcc.std.Y"
- "8" "Time.BodyAcc.std.Z"
- "9" "Time.GravityAcc.mean.X"
- "10" "Time.GravityAcc.mean.Y"
- "11" "Time.GravityAcc.mean.Z"
- "12" "Time.GravityAcc.std.X"
- "13" "Time.GravityAcc.std.Y"
- "14" "Time.GravityAcc.std.Z"
- "15" "Time.BodyAccJerk.mean.X"
- "16" "Time.BodyAccJerk.mean.Y"
- "17" "Time.BodyAccJerk.mean.Z"
- "18" "Time.BodyAccJerk.std.X"
- "19" "Time.BodyAccJerk.std.Y"
- "20" "Time.BodyAccJerk.std.Z"
- "21" "Time.BodyGyro.mean.X"
- "22" "Time.BodyGyro.mean.Y"
- "23" "Time.BodyGyro.mean.Z"
- "24" "Time.BodyGyro.std.X"
- "25" "Time.BodyGyro.std.Y"
- "26" "Time.BodyGyro.std.Z"
- "27" "Time.BodyGyroJerk.mean.X"
- "28" "Time.BodyGyroJerk.mean.Y"
- "29" "Time.BodyGyroJerk.mean.Z"
- "30" "Time.BodyGyroJerk.std.X"
- "31" "Time.BodyGyroJerk.std.Y"
- "32" "Time.BodyGyroJerk.std.Z"
- "33" "Time.BodyAccMagnitude.mean"
- "34" "Time.BodyAccMagnitude.std"
- "35" "Time.GravityAccMagnitude.mean"
- "36" "Time.GravityAccMagnitude.std"
- "37" "Time.BodyAccJerkMagnitude.mean"
- "38" "Time.BodyAccJerkMagnitude.std"
- "39" "Time.BodyGyroMagnitude.mean"
- "40" "Time.BodyGyroMagnitude.std"
- "41" "Time.BodyGyroJerkMagnitude.mean"
- "42" "Time.BodyGyroJerkMagnitude.std"
- "43" "Frequency.BodyAcc.mean.X"
- "44" "Frequency.BodyAcc.mean.Y"
- "45" "Frequency.BodyAcc.mean.Z"
- "46" "Frequency.BodyAcc.std.X"
- "47" "Frequency.BodyAcc.std.Y"
- "48" "Frequency.BodyAcc.std.Z"
- "49" "Frequency.BodyAcc.meanFreq.X"
- "50" "Frequency.BodyAcc.meanFreq.Y"
- "51" "Frequency.BodyAcc.meanFreq.Z"
- "52" "Frequency.BodyAccJerk.mean.X"
- "53" "Frequency.BodyAccJerk.mean.Y"
- "54" "Frequency.BodyAccJerk.mean.Z"
- "55" "Frequency.BodyAccJerk.std.X"
- "56" "Frequency.BodyAccJerk.std.Y"
- "57" "Frequency.BodyAccJerk.std.Z"
- "58" "Frequency.BodyAccJerk.meanFreq.X"
- "59" "Frequency.BodyAccJerk.meanFreq.Y"
- "60" "Frequency.BodyAccJerk.meanFreq.Z"
- "61" "Frequency.BodyGyro.mean.X"
- "62" "Frequency.BodyGyro.mean.Y"
- "63" "Frequency.BodyGyro.mean.Z"
- "64" "Frequency.BodyGyro.std.X"
- "65" "Frequency.BodyGyro.std.Y"
- "66" "Frequency.BodyGyro.std.Z"
- "67" "Frequency.BodyGyro.meanFreq.X"
- "68" "Frequency.BodyGyro.meanFreq.Y"
- "69" "Frequency.BodyGyro.meanFreq.Z"
- "70" "Frequency.BodyAccMagnitude.mean"
- "71" "Frequency.BodyAccMagnitude.std"
- "72" "Frequency.BodyAccMagnitude.meanFreq"
- "73" "Frequency.BodyBodyAccJerkMagnitude.mean"
- "74" "Frequency.BodyBodyAccJerkMagnitude.std"
- "75" "Frequency.BodyBodyAccJerkMagnitude.meanFreq"
- "76" "Frequency.BodyBodyGyroMagnitude.mean"
- "77" "Frequency.BodyBodyGyroMagnitude.std"
- "78" "Frequency.BodyBodyGyroMagnitude.meanFreq"
- "79" "Frequency.BodyBodyGyroJerkMagnitude.mean"
- "80" "Frequency.BodyBodyGyroJerkMagnitude.std"
- "81" "Frequency.BodyBodyGyroJerkMagnitude.meanFreq"

The above variables are given by the mean of each measurement per subject per activity.

##Stepwise description of the script (run_analysis.R):
==========================================================

- train and test datasets are read and merged as one
- columns corresponding to mean and standard deviation for each measurement is extracted
- columns in previous step are renamed 
- subject identifiers and activity data are added to extracted data, and given appropriate names
- resulting data is tidied by mean of each subject per activity
- final output is written into a txt file

This txt file is a subset of the original data. The mean and standard deviation variables for each observation have been extracted. 

If further information is sought, kindly check within the compressed dataset. 
Visit the [original webpage](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to get the data, if needed
