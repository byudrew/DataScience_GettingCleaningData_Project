## Code Book for Course Project

This file describes the variables in the output file from run_analysis.R. That file is cleverly called "output.txt".
The output file contains 180 observations of 68 variables. Column 1 ("Subject") is a subject identifier, which is an integer
from 1 to 30 representing each of the participants in the study. Column 2 ("Activity.Name") is a description of the
activity in which their motion was being measured. This is a factor variable that can take 1 of 6 different values:
LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, or WALKING_UPSTAIRS. The 180 rows represent the 6x30 combinations
of subject and activity that were measured.

Each of the remaining 66 columns represents an average (mean) over a particular feature and statistic for that subject/activity pair.
The variable names take the form "Average.FEATURE.STATISTIC(.XYZ)". Variables in these columns are unitless.
They have been normalized from the original features, and we are taking averages of various statistics of these features.

FEATURE refers to one of 33 possible features from the original dataset. Below is the list of features. "XYZ" at the end of a feature name
indicates that there are actually 3 different features, one for each dimension. The letter for the dimension appears at the end of the variable
name as well.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag

STATISTIC refers to one of 2 possible statistics over these raw features. The two possibilities are
* mean
* std

As an example, the average for each subject/activity pair for the standard deviation of the total body acceleration in the Z direction
would be found in the variable/column "Average.tBodyAcc.std.Z"

Additional details about these features can be found in the downloaded data set (location provided in README.md).
