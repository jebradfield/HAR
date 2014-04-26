## Set Working Directory
library(reshape2)
# set output file name
outputfile = 'harus.txt'
#setwd('/Users/jasonbradfield/Dropbox/Coursera/GCD/UCI HAR Dataset')

# Read Features names Vector:
features=read.table('./features.txt')
# check to make sure features vector has 561 rows (per: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
if (nrow(features)==561){ print("feature vector length ok")}else{print("Error: feature vector length incorrect")}
features.X = features$V2

#Read activty labels:
activity_labels = read.table('./activity_labels.txt', stringsAsFactors=FALSE)
names(activity_labels) = c('Index','Label')


## Load data frames for test data
## SUBJECT:
# An identifier of the subject who carried out the experiment:
subject_test=read.table('./test/subject_test.txt')
# Create column heading for subject_test:
names(subject_test) = 'subject'
test.rows=nrow(subject_test)

## X_TEST:
# A 561-feature vector with time and frequency domain variables:
X_test=read.table('./test/X_test.txt')
# Create column headings for X_test:
names(X_test) = features.X

## ACTIVITY:
#Its activity label:
y_test=read.table('./test/y_test.txt')
names(y_test) = 'activity'

# Change y_test values to activity names
y_test_temp = data.frame()
for (i in 1:nrow(y_test)){
    y_test_temp[i,1] = activity_labels[y_test[i,1],2]
}
names(y_test_temp) = 'activity'
y_test$activity=as.factor(y_test_temp$activity)


# the estimated body acceleration. 
#body_acc_x_test = read.table('./test/Inertial Signals/body_acc_x_test.txt')
# body_acc_y_test = read.table('./test/Inertial Signals/body_acc_y_test.txt')
#body_acc_z_test = read.table('./test/Inertial Signals/body_acc_z_test.txt')
# Triaxial Angular velocity from the gyroscope. 
#body_gyro_x_test = read.table('./test/Inertial Signals/body_gyro_x_test.txt')
#body_gyro_y_test = read.table('./test/Inertial Signals/body_gyro_y_test.txt')
#body_gyro_z_test = read.table('./test/Inertial Signals/body_gyro_z_test.txt')
# Triaxial acceleration from the accelerometer (total acceleration) and
#total_acc_x_test = read.table('./test/Inertial Signals/total_acc_x_test.txt')
#total_acc_y_test = read.table('./test/Inertial Signals/total_acc_y_test.txt')
#total_acc_z_test = read.table('./test/Inertial Signals/total_acc_z_test.txt')

## Load data frames for train data
## SUBJECT:
# An identifier of the subject who carried out the experiment:
subject_train=read.table('./train/subject_train.txt')
# Create column heading for subject_train:
names(subject_train) = 'subject'

## X_train:
# A 561-feature vector with time and frequency domain variables:
X_train=read.table('./train/X_train.txt')
# Create column headings for X_train:
names(X_train) = features.X


## ACTIVITY:
#Its activity label:
y_train=read.table('./train/y_train.txt')
names(y_train) = 'activity'

# Change y_train values to activity names
y_train_temp = data.frame()
for (i in 1:nrow(y_train)){
  y_train_temp[i,1] = activity_labels[y_train[i,1],2]
}
names(y_train_temp) = 'activity'
y_train$activity=as.factor(y_train_temp$activity)


# the estimated body acceleration. 
# body_acc_x_train = read.table('./train/Inertial Signals/body_acc_x_train.txt')
# body_acc_y_train = read.table('./train/Inertial Signals/body_acc_y_train.txt')
# body_acc_z_train = read.table('./train/Inertial Signals/body_acc_z_train.txt')
# Triaxial Angular velocity from the gyroscope. 
# body_gyro_x_train = read.table('./train/Inertial Signals/body_gyro_x_train.txt')
# body_gyro_y_train = read.table('./train/Inertial Signals/body_gyro_y_train.txt')
# body_gyro_z_train = read.table('./train/Inertial Signals/body_gyro_z_train.txt')
# Triaxial acceleration from the accelerometer (total acceleration) and
# total_acc_x_train = read.table('./train/Inertial Signals/total_acc_x_train.txt')
# total_acc_y_train = read.table('./train/Inertial Signals/total_acc_y_train.txt')
# total_acc_z_train = read.table('./train/Inertial Signals/total_acc_z_train.txt')

# calculate expected number of columns for checking:
test.data.frames = list(subject_test, X_test, y_test)

# Do not need these files: body_acc_x_test,body_acc_y_test,body_acc_z_test,
# body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,total_acc_x_test,
# total_acc_y_test,total_acc_z_test

train.data.frames = list(subject_train, X_train, y_train)

# Do not need these files: , body_acc_x_train,body_acc_y_train,body_acc_z_train,
# body_gyro_x_train,body_gyro_y_train,body_gyro_z_train,total_acc_x_train,
# total_acc_y_train,total_acc_z_train

# Calculate number of columns (for checking purposes), should be 1715 for test and train data
test.tot.col=0
for (df in test.data.frames){ test.tot.col=test.tot.col+ncol(df)}

train.tot.col=0
for (df in train.data.frames){ train.tot.col=train.tot.col+ncol(df)}

# Build 'test' data frame through cbinding the data frames in 'test.data.frames'

test=data.frame(data.frame(matrix(NA, nrow = test.rows, ncol = 1)))
for (df in test.data.frames){ test=cbind(test, df) }
test = test[2:ncol(test)]

# Check for correct number of test rows and cols (2947, and 563 respectively)
if (nrow(test)==2947){print("Correct number of test rows")}else{print("Incorrect number of rows in test")}
if (ncol(test)==563){print("Correct number of test cols")}else{print("Incorrect number of cols in test")}


# Build 'train' data frame through cbinding the data frames in 'train.data.frames'
train.rows=nrow(subject_train)
train=data.frame(data.frame(matrix(NA, nrow = train.rows, ncol = 1)))
for (df in train.data.frames){ train=cbind(train, df) }
train = train[2:ncol(train)]

# Check for correct number of train rows and cols (2947, and 563 respectively)
if (nrow(train)==7352){print("Correct number of train rows")}else{print("Incorrect number of rows in train")}
if (ncol(train)==563){print("Correct number of train cols")}else{print("Incorrect number of cols in train")}


 
harus = rbind(train,test)

# Check for correct number of harus rows and cols (10299, and 563 respectively)
if (nrow(harus)==10299){print("Correct number of harus rows")}else{print("Incorrect number of rows in harus")}
if (ncol(harus)==563){print("Correct number of harus cols")}else{print("Incorrect number of cols in harus")}


# get a vector of means and std's names:
m.s=as.character(features[grepl('mean()',features.X,fixed=TRUE) | grepl('std()',features.X, fixed=TRUE),2])
# create a data frame with means and std's:
harus.m.s=harus[,m.s]

# create harus d.f. with 'subject' and 'activity':
harus.2 = harus[,c('subject','activity')]

harus.r = cbind(harus.2,harus.m.s)


harusMelt=melt(harus.r,id=c('subject','activity'),measure.vars=m.s)

m = dcast(harusMelt, subject + activity ~ variable, mean)
head(m,3)

# Write output to file
write.table(m,outputfile,row.names=FALSE,sep=',')