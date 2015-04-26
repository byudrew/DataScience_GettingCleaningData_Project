
## run_analysis.R reads in several files from the UCI HAR Dataset
## into data frames and combines them into a single tidy data frame
## containing all of the features that are based on mean and std.
## It then computes an average of each of these features across
## all of the subsets of Subject # and Activity Name.
## Assumes that the "UCI HAR Dataset" folder is in the current directory.

# Read in training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read in testing data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Read in label information
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Set column names for most of the data frames
colnames(features) <- c("Feature.Num","Feature.Name")
colnames(activity_labels) <- c("Activity.Num","Activity.Name")
colnames(y_train) <- "Activity.Num"
colnames(y_test) <- "Activity.Num"
colnames(subject_train) <- "Subject"
colnames(subject_test) <- "Subject"

# Modify Feature.Name column by replacing "-" with "." and removing "()"
features$Feature.Name <- as.character(features$Feature.Name)
features$Feature.Name <- sapply(features$Feature.Name, function(x) gsub("-",".",x))
features$Feature.Name <- sapply(features$Feature.Name, function(x) gsub("\\(\\)","",x))

# Determine which features are based on a mean or std
# This involves splitting each string at the ".", then searching for any
# of the substrings matching "mean" or "std". Does not include any
# with "meanFreq" or "gravityMean".
varSelector <- sapply(features$Feature.Name, function(x) x=any(sapply(strsplit(x,"\\."), function (y) y=="mean" | y=="std")))

# Downselect the features
features <- features[which(varSelector),]
X_train <- X_train[,which(varSelector)]
X_test <- X_test[,which(varSelector)]

# Set column headers with this trimmed down feature list
colnames(X_train) <- features$Feature.Name
colnames(X_test) <- features$Feature.Name

# Eliminate an extraneous column from one of the data frames
rownames(features) <- NULL

# Combine subject, activity, and feature information for testing and training
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)

# Combine training and testing data
train_test <- rbind(train, test)

# Merge activity labels into the dataset and reorder the columns
dataset <- merge(train_test, activity_labels, by="Activity.Num", sort=F)
dataset <- dataset[, c(2, ncol(dataset), 3:(ncol(dataset)-1))]

# Compute averages for each feature over each subject/activity pair
averages <- aggregate(. ~ Subject + Activity.Name, data=dataset, mean)

# Save to "output.txt"
write.table(averages, file="output.txt", row.names=F)
