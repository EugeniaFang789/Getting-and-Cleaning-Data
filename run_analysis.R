# Merges the training and the test sets to create one data set
testdata <- read.table("X_test.txt")
testsubject<-read.table("subject_test.txt",col.names = "subject")
traindata <- read.table("X_train.txt")
trainsubject<-read.table("subject_train.txt",col.names = "subject")
mergedata <- rbind(cbind(testsubject,testdata), cbind(trainsubject,traindata))

# Uses descriptive activity names to name the activities in the 
# data set
activitylabels <- read.table("activity_labels.txt",col.names = c("subject","fullname"))
mergedatalabeled <- merge(activitylabels,mergedata,all=TRUE)

# Appropriately labels the data set with descriptive variable names
featuresnames <- read.table("features.txt",col.names = c("no","name"))
names(mergedatalabeled)[3:563]<- as.vector(featuresnames$name)

# Extracts only the measurements on the mean and standard deviation 
# for each measurement
extractno <- grep("mean()|std()",featuresnames$name)+2
extractno <- c(1,2,extractno)
mergedatalite <- mergedatalabeled[,extractno]

# From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and 
# each subject
average <-data.frame(1:30)
mergedatalite$subject <- as.factor(mergedatalite$subject)
for(i in 3:81){
  average <- cbind(average, tapply(mergedatalite[,i], mergedatalite$subject, mean))
  average
}
names(average) <- c("subject",names(mergedatalite)[3:81])

# wirte the dataset out
write.table(mergedatalite, file="mergedata-mean&std.txt",row.name=FALSE)
write.table(average, file="mergedata-mean&std-average.txt",row.name=FALSE)