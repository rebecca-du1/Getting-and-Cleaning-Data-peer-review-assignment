## first read the data into r
## the data is downloaded and save locally,using read.csv
trainingset<-read.table("./UCI HAR Dataset/train/X_train.txt")
testset<-read.table("./UCI HAR Dataset/test/X_test.txt")

## merge the two set into one set,they have same column but different rows
## use rbind, because they are two different group on same variable
df_raw<-rbind(trainingset,testset)

## select column with mean $ sd
feature<-read.table("./UCI HAR Dataset/features.txt")
columnname<-as.character(feature[,"V2"])
## use grep to search for mean and std, then select from variable name list
listmean<-grep("mean()",columnname,fixed=TRUE)
liststd<-grep("std",columnname)
select<-columnname[c(listmean,liststd)]
## select column with mean and std
## replace the variable name with feature name, which is descriptive and easy to select
df_select<-df_raw[,c(listmean,liststd)]
colnames(df_select)=select

## step 3
## activity type is in file training label and test label
## use the activity type as factor variable to easier grouping in requirement 5
trainingactivity<-read.table("./UCI HAR Dataset/train/y_train.txt")
testactivity<-read.table("./UCI HAR Dataset/test/y_test.txt")
activitylist<-rbind(trainingactivity,testactivity)
activity_type<-as.factor(activitylist$V1)
levels(activity_type)=c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
df_actadd<-cbind(activity_type,df_select)

## add subject to the table to prepare for step 5
testsubject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
trainingsubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectlist<-rbind(trainingsubject,testsubject)
subject_id<-as.factor(subjectlist$V1)
df_tidy<-cbind(subject_id,df_act_add)



   
