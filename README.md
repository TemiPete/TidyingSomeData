# TidyingSomeData

This is repo for a small project where I cleaned some data from the 'Human Activity Recognition Using Smartphones Dataset'. 

The data is found [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). I did not push the data alongside this commmit because the size of the dataset is large. Click on the link to the dataset to find it, or [click here](https://archive.ics.uci.edu/ml/machine-learning-databases/00240/), then click on 'UCI HAR Dataset.zip'. Make sure to download the data or move it into the 'data/' directory, then extract the files within that directory. 

Afterwards, kindly read the Code Book found within the repo. 

Essentially, the script, run_analysis.R does the following:

- reads train and test datasets and merges them as one
- extracts columns corresponding to mean and standard deviation for each measurement
- renames the extracted columns
- adds the subject identifiers and activity data to the main extracted data and gives appropriate names to both columns
- tidies resulting data by the mean of each subject per activity
- writes final output to a txt file
