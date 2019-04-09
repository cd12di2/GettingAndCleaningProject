

run_analysis<-function()
{
  # The run_analysis() function reads the UCI HAR Dataset, combines the data into one
  #  tidy file, saves that file in the working directory with the name "TidyDataSet.txt",
  #  then calculates the mean and standard deviation for each measurement for each
  #  activity for each individual, and saves that dataset in the 
  #  working directory with the name "TidyDataSetMeanStdDev.txt".
  
  
  # The following library statements are in case they are needed
  #library(data.table)
  #library(dplyr)
  
  
  # Get header/format data
  activity_labels<-read.delim("UCI HAR Dataset\\activity_labels.txt",header=FALSE,sep = " ",dec = ".")
  features<-read.delim("UCI HAR Dataset\\features.txt",header=FALSE,sep = " ",dec = ".")

  
  # Set up some data frames to hold data temporarily
  dataset<-data.frame(DataSet=character())
  subject<-data.frame(Subject=integer())
  x_data<-data.frame(X_Data=numeric())
  y_data<-data.frame(Y_Data=numeric())
  body_acc_x<-data.frame(Body_Acc_X=numeric())
  body_acc_y<-data.frame(Body_Acc_Y=numeric())
  body_acc_z<-data.frame(Body_Acc_Z=numeric())
  body_gyro_x<-data.frame(Body_Gyro_X=numeric())
  body_gyro_y<-data.frame(Body_Gyro_Y=numeric())
  body_gyro_z<-data.frame(Body_Gyro_Z=numeric())
  total_acc_x<-data.frame(Total_Acc_X=numeric())
  total_acc_y<-data.frame(Total_Acc_Y=numeric())
  total_acc_z<-data.frame(Total_Acc_Z=numeric())
  
  
  # Get test data for each measurement - a for loop is used to add data to the
  #  relevant dataframes
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\subject_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    subject<-rbind(subject,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\test\\X_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    x_data<-rbind(x_data,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Y_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    y_data<-rbind(y_data,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\body_acc_x_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_acc_x<-rbind(body_acc_x,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\body_acc_y_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_acc_y<-rbind(body_acc_y,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\body_acc_z_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_acc_z<-rbind(body_acc_z,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_x_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_gyro_x<-rbind(body_gyro_x,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_y_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_gyro_y<-rbind(body_gyro_y,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_z_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_gyro_z<-rbind(body_gyro_z,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\total_acc_x_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    total_acc_x<-rbind(total_acc_x,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\total_acc_y_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    total_acc_y<-rbind(total_acc_y,mydata[i])
  }
  
  mydata<-read.fwf("UCI HAR Dataset\\test\\Inertial Signals\\total_acc_z_test.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    total_acc_z<-rbind(total_acc_z,mydata[i])
  }
  
  
  # Get train data for each measurement, adding data to the relevant dataframes
  
  mydata<-read.fwf("UCI HAR Dataset\\train\\subject_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    subject<-rbind(subject,mydata[i])
  }

    mydata<-read.fwf("UCI HAR Dataset\\train\\X_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    x_data<-rbind(x_data,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Y_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    y_data<-rbind(y_data,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\body_acc_x_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_acc_x<-rbind(body_acc_x,mydata)
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\body_acc_y_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_acc_y<-rbind(body_acc_y,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\body_acc_z_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_acc_z<-rbind(body_acc_z,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_x_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_gyro_x<-rbind(body_gyro_x,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_y_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_gyro_y<-rbind(body_gyro_y,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_z_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    body_gyro_z<-rbind(body_gyro_z,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\total_acc_x_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    total_acc_x<-rbind(total_acc_x,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\total_acc_y_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    total_acc_y<-rbind(total_acc_y,mydata[i])
  }

  mydata<-read.fwf("UCI HAR Dataset\\train\\Inertial Signals\\total_acc_z_train.txt",skip=0,widths=c(16))
  for(i in 1:length(mydata)){
    total_acc_z<-rbind(total_acc_z,mydata[i])
  }

  
  # Create a dataframe to keep test/train information
  dataset<-rbind("Test ")
  for(i in 2:10299){
    dataset<-rbind(dataset,"Test ")
  }
  for(i in 2948:10299){
    dataset[i]<-"Train"
  }
  
  
  # Create the total data frame to hold all the combined data
  
  DataTotal<-data.frame()

  DataTotal<-cbind(dataset)
  
  DataTotal<-cbind(DataTotal,subject)
  
  DataTotal<-cbind(DataTotal,x_data)
  DataTotal<-cbind(DataTotal,y_data)
  
  DataTotal<-cbind(DataTotal,body_acc_x)
  DataTotal<-cbind(DataTotal,body_acc_y)
  DataTotal<-cbind(DataTotal,body_acc_z)
  
  DataTotal<-cbind(DataTotal,body_gyro_x)
  DataTotal<-cbind(DataTotal,body_gyro_y)
  DataTotal<-cbind(DataTotal,body_gyro_z)
  
  DataTotal<-cbind(DataTotal,total_acc_x)
  DataTotal<-cbind(DataTotal,total_acc_y)
  DataTotal<-cbind(DataTotal,total_acc_z)
  
  
  # Set the labels for the total dataframe
  colnames(DataTotal) <- c( 
    "DataSet",
    "Subject",
    "X_Data",
    "Y_Data",
    "Body_Acc_X",
    "Body_Acc_Y",
    "Body_Acc_Z",
    "Body_Gyro_X",
    "Body_Gyro_Y",
    "Body_Gyro_Z",
    "Total_Acc_X",
    "Total_Acc_Y",
    "Total_Acc_Z"
  )
  
  
  # Sort the total dataframe by subject and activity type
  DataTotal<-DataTotal[order(DataTotal$Subject,DataTotal$Y_Data),] 
  
  
  # Write the total dataframe to a file
  write.table(DataTotal,file="TidyDataSet.txt",row.name=FALSE,sep=",")
  
  
  # Create a new dataframe to hold the mean and standard deviation data
  DataMeanStdDev<-data.frame()
 
  
  # Loop over the subjects and activities in the total dataframe, calculate
  #  mean and standard deviation for each measurement, and add to the mean
  #  and standard deviation dataframe
  
  for (sub in 1:30) {

    for (y in 1:6) {
    
      # Create a temporary meand and standard deviation dataframe
      SubjectMeanAndSD<-data.frame()
    
      # Make a subset of the data under consideration from the total dataframe
      subdata<-subset(DataTotal,Subject==sub & Y_Data==y)
  
      # Add the dataset and subject to the temporary dataframe
      SubjectMeanAndSD<-cbind(subdata[1,1])
      SubjectMeanAndSD<-cbind(SubjectMeanAndSD,subdata[1,2])
    
      # Add the activity in text form to the temporary dataframe
      if (subdata[1,4]==1) {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,"Walking")
      } else if (subdata[1,4]==2) {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,"Walking Upstairs")
      } else if (subdata[1,4]==3) {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,"Walking Downstairs")
      } else if (subdata[1,4]==4) {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,"Sitting")
      } else if (subdata[1,4]==5) {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,"Standing")
      } else if (subdata[1,4]==6) {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,"Laying")
      } else {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,"Unknown")
      }
      
      # Loop through all activities and add their mean and sd to the temporary
      #  dataframe
      for (k in 5:13) {
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,mean(subdata[,k]))
        SubjectMeanAndSD<-cbind(SubjectMeanAndSD,sd(subdata[,k]))
      }
      
      # Add the temporary dataframe to the total mean and sd data frame
      DataMeanStdDev<-rbind(DataMeanStdDev,SubjectMeanAndSD)    
    
    }
    
  }
  
  # Set the column names for the mean and sd data frame
  colnames(DataMeanStdDev) <- c( 
    "DataSet",
    "Subject",
    "Activity",
    "Body_Acc_X_Mean",
    "Body_Acc_X_StdDev",
    "Body_Acc_Y_Mean",
    "Body_Acc_Y_StdDev",
    "Body_Acc_Z_Mean",
    "Body_Acc_Z_StdDev",
    "Body_Gyro_X_Mean",
    "Body_Gyro_X_StdDev",
    "Body_Gyro_Y_Mean",
    "Body_Gyro_Y_StdDev",
    "Body_Gyro_Z_Mean",
    "Body_Gyro_Z_StdDev",
    "Total_Acc_X_Mean",
    "Total_Acc_X_StdDev",
    "Total_Acc_Y_Mean",
    "Total_Acc_Y_StdDev",
    "Total_Acc_Z_Mean",
    "Total_Acc_Z_StdDev"
  )
  
  # Save the mean and standard dataframe to a file
  write.table(DataMeanStdDev,file="TidyDataSetMeanStdDev.txt",row.name=FALSE,sep=",")

  # Let us know when everything is finished
  cat(sprintf("\ndone\n\n"))

  # Return the mean and sd dataframe
  DataMeanStdDev

  
}

