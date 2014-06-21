	## This repository have the outputs for Course Project of Class 03 Getting and Cleaning Data 
	
	## for run_analysis.R
	
	## use the serveral library
	## data.table for data table manupulation 
	## reshape2 for data table reshape 
	## doBy for orderBy 
	   
   ## read training data  X_train.txt, subject_train.txt , Y_train.txt
   ## combine read training data using cbind , add SubjGroup, ActType, TGroup(train = TR)
   
   ## read test data  X_test.txt, subject_test.txt , Y_test.txt
   ## combine read test data using cbind , add SubjGroup, ActType, TGroup(test = TS)

	##########
	## 1) Merges the training and the test sets to create one data set.
    
    ## combine two data sets using merge  

	##########
	##  2) Extracts only the measurements on the mean and standard deviation for each measurement. 
 	
 	##  read features.txt for column names
	## Extract  mean column(33) & Standard Deviation column (33) from merged dataset

	##########
	##  3) Uses descriptive activity names to name the activities in the data set
    
    ## Read activity label     
    ## Add Columns  - Activity name   
   
	##########
	##  4) Appropriately labels the data set with descriptive variable names. 
    
    ## adjust column name using read activity label gsub cause '()' and '-' cannoy use column names
    ##  Changed Coloumn name V? <- adjusted column name in  features.txt f
    ##  combine two data sets for mean and standard deviation
          
	## Add Columns  - Activity.Name, SubjectGroup, Activity Type, Train vs. Test
   
    ## Write  result to csv file -> Class3_CourseProject_Result.csv
	
	##########
	## 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	
	## all mean and standard deviation variables column calculate mean by Subject.Group and Activity.Type
    ##  using  aggregate
    ## change column names paste "Mean." to original column names
    ## order by  Subject.Group and Activity.Type
  
  	## Write  result to csv file -> Class3_CourseProject_AVGResult.csv
	
	## end..
	
