# DataScience_GettingCleaningData_Project

## Data Source

Data for this project comes from the Human Activity Recognition Using Smartphones Dataset.
It can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Unzip the file in the working directory (containing run_analysis.R).

## Steps

To run the program, just call

	source("run_analysis.R")
	
from your working directory that contains the unzipped directory ("UCI HAR Dataset").

The code reads in the scattered input data files, cleans them up, combines them, then filters
on the features (accepts all that were a mean or standard deviation)
and computes averages for each feature over the student and activity variables.
Specifics about this process can be found in the code comments. Details about the individual
variables can be found in CodeBook.md.

This will produce "output.txt". This output, or the output submitted for this course project,
can be read in and viewed using the commands

	averages <- read.table("output.txt", header = TRUE)
	View(averages)
	
This data is "tidy" as defined in this course. Each variable is in a different column, there
are no duplicate columns, each column is named with a definition of the names in the code book,
and each observation is in a different row. I selected a "wide" table instead of a "narrow" table,
though either option would be valid.
