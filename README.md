# TidyingSomeData
This is repo for a small project where I cleaned some data. 
The data is found [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
Kindly read the Code Book found within the repo. 
Essentially, the script, run_analysis.R does the following:

- reads train and test datasets and merges them as one
- extracts columns corresponding to mean and standard deviation for each measurement
- renames the extracted columns
- adds the subject identifiers and activity data to the main extracted data and gives appropriate names to both columns
- tidies resulting data by the mean of each subject per activity
- writes final output to a txt file
