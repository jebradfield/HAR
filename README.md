Readme for run_analysis.R
========================================================

Set your working directory to where the data files are.  The working directory should contain folders 'train' and 'test' as well as the following files:
activity_labels.txt
features.txt

Variable descriptions can be found in the CodeBook.md file.


The following is a description of the data transformations the scripts perform

Data Transformations

1. Headings for Features Data
Feature names were downloaded from 'features.txt'.  These were assumed to line up one-to-one to the column vectors in the X_test.txt and X_train.txt data files so the columns in these files were labeled with headings from the 'features.txt' file.

2. Headings for Subject and Activities
The subject vectors from the subject_test.txt and subject_train.txt files were labeled with the heading 'subject'.
The label vectors from the y_test.txt and y_train.txt files were labeled with the heading 'activity'.

3. Creation of single file

The following data frames were created from the files whose names they are, were labeled as described above and were combined into one data frame using cbind and rbind:
subject_test, X_test, y_test
subject_train, X_train, y_train

4. Extraction of means
The assignment was to 'Extracts only the measurements on the mean and standard deviation for each measurement'.  This was interpreted to mean the mean values of the actual time and frequency domain measurements.

There were 66 total means and standard deviations:
1) 3D Time Domain Signals: 15 means and 15 standard deviations (5 measures with 3 dimensions each)
2) Magnitude Time Domain Measures: 5 means and 5 standard deviations (5 measures)
3) 3D Frequency Domain Signals: 9 means and 9 standard deviations (3 measures with 3 dimensions each)
4) Mag
2) Magnitude Frequency Domain Measures: 4 means and 4 standard deviations (4 measures)
Total: 33 means and 33 standard deviations = 66 total features

The meanFreq() was not included because it was the 'weighted average of the frequency components to obtain a mean frequency' and not necessarily a mean of the measurements themselves. 
The angle() measures were not included because they were the angle between some means and other variables.

A data frame was created with all of the observations (10,299) and the 66 means and standard deviations (plus the subject and activity labels) for a 10,299 x 68 data frame.

5. Creation of Final Output
A melted data frame was created from 10,299 x 68 data frame described in the previous section.  The melted data frame used the 66 mean/std features as variables and yielded a data frame of 679,734 rows (10,299 x 66 features) and four columns (subject, label, variable(one of the 66 means/std features) and value of the variable).

The melted data frame was then recast into a data frame with 180 rows (for each of the 6 x 30 activity/subject pairings) and the average for the mean and standard deviation for each of the 33 features (a total of 66 feature columns)

This file is then written into the file 'harus.txt' file in the working directory.  If harus.txt already exists it's overwritten.

