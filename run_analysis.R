########combine the data sets########

subject.train<-read.table('./UCI HAR Dataset/train/subject_train.txt')
subject.test<-read.table('./UCI HAR Dataset/test/subject_test.txt')
subject.combine<-rbind(subject.train,subject.test)

x.train<-read.table('./UCI HAR Dataset/train/X_train.txt')
x.test<-read.table('./UCI HAR Dataset/test/X_test.txt')
x.combine<-rbind(x.train,x.test)

joined.data<-cbind(subject.combine,x.combine)

########getting index of measurements on the mean and standard deviation for each measurement########

features<-read.table('./UCI HAR Dataset/features.txt')
features<-as.character(features$V2)
mean.std.indices <- grep("mean\\(\\)|std\\(\\)", features) ##This vector will give all the required indices

########Extracting the required info########

joined.data.extract<-joined.data[,c( 1, (mean.std.indices+1) )]

########Adding in a column of descriptive activities name########

y.train<-read.table('./UCI HAR Dataset/train/y_train.txt')
y.test<-read.table('./UCI HAR Dataset/test/y_test.txt')

y.combine<-rbind(y.train,y.test)

activity.labels<-read.table('./UCI HAR Dataset/activity_labels.txt',colClasses=c("numeric","character") )

activity.list<-c()

for(i in 1:nrow(y.combine))
{
      activity.list[i]<-activity.labels[y.combine[i,1],2]
}

activity.list=data.frame(activity.list)

joined.data.extract<-cbind(activity.list,joined.data.extract)

########Appropriately labels the data set with descriptive variable names.########

col.names<-features[mean.std.indices]
col.names<-c('type of activity','subject',col.names)

colnames(joined.data.extract)<-col.names

########creates a second, independent tidy data set########

data.to.write<-joined.data.extract[1,]
counter<-1
total.col<-ncol(joined.data.extract)
x<-joined.data.extract

for(i in unique(x$'type of activity'))
{
      for(j in unique(x$subject))
      {
            data.to.write[counter,1]<-i
            
            data.to.write[counter,2]<-j
            
            y<-( x[ (x$'type of activity'== i & x$subject == j), ])[,3:total.col]
            data.to.write[counter,3:total.col]<-colMeans(y)
            
            counter=counter+1
      }
}

write.table(data.to.write, "tidy.txt",row.names=FALSE)



