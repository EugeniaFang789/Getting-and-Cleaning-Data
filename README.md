Getting-and-Cleaning-Data

Basically this project is dealing with the UCI HAR Dataset and trying to prepare tidy data that can be used for later analysis.
There are three files here.

*run_analysis.R*
The code in *run_analysis.R* reshapes our UCI HAR Datase and creates a tidy data set.
The following steps show how the code works.
1. Load the data into R;
2. Merge the training set and the test set into one set and name it "wholeset".
   Subjects and activities are included as the first two columns in wholeset;
3. Label the wholeset with descriptive variable names (column names);
4. Extract the measurements on the mean and standard deviation.
   Name this dataset "ms" (short for "mean and standard deviation");
5. Name the activities with descriptive factor labels according to *activity_labels.txt*;
6. Using package *dplyr* to create a second data set with the average of each variable for each activity and each subject.
   Name it "summeryset";
7. Wirte the dataset out into *summary(mean&std only).txt*.


*summary(mean&std only).txt*
This is the tidy dataset created by the R code.

*CodeBook.txt*
This is the code book describing the variables in *summary(mean&std only).txt*.
