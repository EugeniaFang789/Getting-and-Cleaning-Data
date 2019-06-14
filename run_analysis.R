# Load the data into R
test <- read.table("test/X_test.txt")
testlabels <- read.table("test/y_test.txt", colClasses = "factor")
testsubject<-read.table("test/subject_test.txt", colClasses = "factor")
train <- read.table("train/X_train.txt")
trainlabels <- read.table("train/y_train.txt", colClasses = "factor")
trainsubject<-read.table("train/subject_train.txt", colClasses ="factor")

# Merge the training and the test sets
# Name it "wholeset"
# Subjects and activities are included as the first two columns in wholeset
wholeset <- rbind(cbind(testsubject,testlabels,test), cbind(trainsubject,trainlabels,train))

# Label the data set with descriptive variable names
features <- read.table("features.txt", as.is = TRUE)
colnames(wholeset) <- c("subject","activity",features[[2]])

# Extract the measurements on the mean and standard deviation
# Name it "ms" (short for "mean and standard deviation")
index <- grep("mean()|std()",features[[2]])+2
ms <- wholeset[c(1,2,index)]

# Name the activities with descriptive activity names
activitylabels <- read.table("activity_labels.txt", as.is = TRUE)
levels(ms$activity) <- activitylabels[[2]]

# Create a data set with the average of each variable for each activity and each subject
# Name it "summeryset"
library(dplyr)
summeryset <- summarise_all(group_by(ms,subject,activity),mean)

# Wirte the dataset out
write.table(summeryset, file="summary(mean&std only).txt",row.name=FALSE)