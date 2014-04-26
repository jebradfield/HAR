Description of the Data and Variables

1) Source data
The data were sourced from six files obtainable at the UC-Irvine Machine Learning Repository at the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
(data available under the 'Data Folder' link above: archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)

2) Data file structure
These six files were divided into a test set and a training set.  There were three files in each set:
Testing set data:
subject_test.txt: This contains the labels of the subjects involved (coded as integers between 1 and 30) with dimensions 2947 x 1
X_test.txt: This containers a table of 561 measurement, one for each subject.  Dimensions are 2947 x 561.
y_test.txt: This contains the labels of the activities (coded as integers between 1 and 6) with dimensions 2947 x 1.
Training set data:
subject_train.txt: This contains the labels of the subjects involved (coded as integers between 1 and 30) with dimensions 7352 x 1
X_train.txt: This containers a table of 561 measurement, one for each subject.  Dimensions are 7352 x 561.  More detailed
y_train.txt: This contains the labels of the activities (coded as integers between 1 and 6) with dimensions 7352 x 1.

3) Description of Features
Detailed information on the independent variables was obtained from the 'features_info.txt' which is available in the same set of file as the data files described above.

3.1) Description of Time Doman Signals and Variables

Time domain signals:
3D Time Domain Signals:
1) tBodyAcc-XYZ (x 3 for each spatial dimension, x,y,z)
2) tGravityAcc-XYZ (x 3 for each spatial dimension, x,y,z)
3) tBodyAccJerk-XYZ (x 3 for each spatial dimension, x,y,z)
4) tBodyGyro-XYZ (x 3 for each spatial dimension, x,y,z)
5) tBodyGyroJerk-XYZ (x 3 for each spatial dimension, x,y,z)
Magnitude of 3D Signals:
6) tBodyAccMag
7) tGravityAccMag
8) tBodyAccJerkMag
9) tBodyGyroMag
10) tBodyGyroJerkMag

Variables estimated from the time domain signal measurements:
1) mean(): Mean value
2) std(): Standard deviation
3) mad(): Median absolute deviation 
4) max(): Largest value in array
5) min(): Smallest value in array
6) sma(): Signal magnitude area
7) energy(): Energy measure. Sum of the squares divided by the number of values. 
8) iqr(): Interquartile range 
9) entropy(): Signal entropy
10) arCoeff(): Autorregresion coefficients with Burg order equal to 4 (x 4 for each measure)
11) correlation(): correlation coefficient between two signals
Total: 14 variables estimated for each time domain signal (10 variables above plus four extra ones for (10) arCoeff() which has four levels).  HOWEVER, for the 3D signals, sma() is recorded only once and for the Magnitude measures there is NO correlation() calculated - these points are important in computing the total number of time domain signals.

There is a total of 265 time domain signal measurements:
3D Features total: 200 ((5 measures x 3 dimensions) x 13 calculated variables for each + 5 calculations of sma() for each measurement = 200)
Magnitude dimensions total: 65 (5 measurements x 13 variable estimates)

This yields a total of 265 features for the time domain.

3.2) Description of Frequency Doman Signals and Variables (and angle())

Frequency domain signals:
3D Frequency domain signals:
1) fBodyAcc-XYZ  (x 3 for each spatial dimension, x,y,z)
2) fBodyAccJerk-XYZ  (x 3 for each spatial dimension, x,y,z)
3) fBodyGyro-XYZ  (x 3 for each spatial dimension, x,y,z)
Total: 9 (3 x 3)

Magnitude Frequency Domain Signals:
1) fBodyAccMag
2) fBodyAccJerkMag
3) fBodyGyroMag
4) fBodyGyroJerkMag

1) mean(): Mean value
2) std(): Standard deviation
3) mad(): Median absolute deviation 
4) max(): Largest value in array
5) min(): Smallest value in array
6) sma(): Signal magnitude area
7) energy(): Energy measure. Sum of the squares divided by the number of values. 
8) iqr(): Interquartile range 
9) entropy(): Signal entropy
10) arCoeff(): Autorregresion coefficients with Burg order equal to 4 (x 4 for each measure)
11) correlation(): correlation coefficient between two signals
12) maxInds(): index of the frequency component with largest magnitude
13) meanFreq(): Weighted average of the frequency components to obtain a mean frequency
14) skewness(): skewness of the frequency domain signal 
15) kurtosis(): kurtosis of the frequency domain signal 
16) bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. (x 42 for each measure)
17) angle(): Angle between to vectors.
Total for 3D frequency domain signals

3D Frequency Domain Variables:
3 estimates of sma() for each of the three 3D signals: 3
plus
42 estimates of bandsEnergy() for each of the three 3D signals: 126
plus
12* estimates of the remaining variables for each of the three 3D signals and each of their 3 dimensions: 108 (12x3x3)
* From the list of 17 variables above sma() and bandsEnergy() have already been accounted for and arCoeff() and correlation() and angle() are not calculated for these measures.
This yields a total of 237 features for the 3D frequency domain variables.

Magnitude Frequency Domain Variables:
There are 4 magnitude frequency domain features in the list above.  They take on all the values in the estimated values list except arCoeff(), correlation(), bandsEnergy(), and angle() for a total of 13 (17 - 4).
Total: 52: (4 x 13 = 52)

Angle Features:
There are seven angle() variables.

Therefore there's a total of 289 features for the frequency domain.  Adding the 7 angle() features yields a total of 296.

3.2) Breakdown of the 561 Features
Time Domain Features: 265
Frequency Domain Features: 289
Angle Features: 7
Total Features: 561 (265 + 289 + 7)

4) Description of Labels
There were six classes that each observation could be classified as:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

These class descriptions are self-explanatory.



