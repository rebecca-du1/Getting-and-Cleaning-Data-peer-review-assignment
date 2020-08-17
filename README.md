# Getting-and-Cleaning-Data-peer-review-assignment
fist read the data file readme, and understand the data we need to work on consist of 30 individuals in two different groups, test and traning, each perform 6 activities
the column is the measurement explaned in the feature file

after understand the data, first import the data into the r, named accouridng to thier group
then combine the data,call it df_raw

the column name is now V1:V561, which is not descriptive
rename the column name according to features, this is done by import the feature document and then convert it to a character list
this rename can help to sort the data set and to make column name discriptive

one difficulty is to sort all measurements involve mean and std, done this by grep variable, and use this to select column from merged dataframe
call it df_select

now the data frame consist of 10299 obs and 66 variables(33 for mean, and 33 for std)
then need to add subject_id, and activity type into the dataframe, done this step by step

import the related documents and combine it with the data frame,
to prepare for the summarize for step five, convert activity_type and subject_id into factor variable
now the dataframe is tidy

to summarize, first group by subject>id and then activity_type, and calculate the mean of 66 measurements.
when calculate the mean, subtract the first two column, which is factor variable
Now, the final table is 180 rows(30subject*6activity), 68 columns, the first two columns indicate subject_id, and activity_type, and then the mean for 66 measurments.



