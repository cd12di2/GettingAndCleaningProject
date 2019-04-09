	---
title: "README"
author: "SP"
date: "April 8, 2019"
---


R function: runanalysis.R

run_analysis.R is an R program that downloads data from the
UCI HAR Dataset and combines the separate data files into 
two tidy datasets: the first tidy dataset is named 
"TidyDataSet.txt" and contains all the available data from 
the individual HAR datasets, while the second tidy dataset 
is named "TidyDataSetMeanStdDev.txt" and contains the mean 
and standard deviation values for the data.

Note:  The run_analysis.R function assumes that the 
UCI HAR Dataset directory structure resides in the working
directory.  If the files have been moved from the UCI
directory structure, the code won't find the data.

The run_analysis() function reads the UCI HAR Dataset, 
combines the data into one tidy file, saves that file in 
the working directory with the name "TidyDataSet.txt".
The function then calculates the mean and standard 
deviation of each measurement for each activity for each 
individual and saves that dataset in the working directory 
with the name "TidyDataSetMeanStdDev.txt".
  
  
The function gets the header and format data and saves the 
data into data frames named activity_labels and features, 
respectively.  These data frames are for reference only 
and are not used further in the function.  

  
The function then sets up some data frames to hold data 
temporarily and downloads the "test" and "train"" data 
using the read.fwf() function.  The data frames are:  

The function then combines all the data into one tidy data 
frame named DataTotal using the cbind() function and sets the 
labels for each column in the data frame per the above data 
frame names using the colnames() function.  
  
The DataTotal data frame is then sorted by Subject and Y_Data, 
which isn't necessary but is the coder's preference.
  
The data frame DataTotal is then written to a file with the 
name "TidyDataSet.txt" using the function write.table().

A new data frame named DataMeanStdDev is created to hold the 
mean and standard deviation data.

The function loops over the subjects and activities in the 
total dataframe, calculates mean and standard deviation for 
each measurement, and adds the data to the DataMeanStdDev 
data frame.  The functions mean() and sd() are used to 
calculate the means and standard deviations.

The function then sets the column names for the 
DataMeanStdDev data frame to the following labels:

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


The data frame DataMeanStdDev is then written to a file 
with the name "TidyDataSetMeanStdDev.txt" using the function 
write.table().


References:
-----------

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012


License:
--------
Use of the datasets referenced in run_analysis.R function 
must be acknowledged by referencing the following 
publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra 
and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector 
Machine.  International Workshop of Ambient Assisted Living 
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility 
implied or explicit can be addressed to the authors or their 
institutions for its use or misuse. Any commercial use is 
prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide 
Anguita. November 2012.

  
