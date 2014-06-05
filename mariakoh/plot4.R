plot4 <- function() {
	## read data file 
	##library(data.table)
    ## 1/2/2007 ~ 2/2/2007 : skip=66637 nrow=69517
    ## Data Table from file
    	
	DT <- fread("./data/household_power_consumption.txt", sep=";", nrows=2880, na.strings="NA", stringsAsFactors=FALSE, verbose=FALSE, skip=66637, select=NULL, drop=NULL, integer64=getOption("datatable.integer64"), showProgress=getOption("datatable.showProgress"))
	
	## set column names		
		
	setnames(DT, c("V1", "V2", "V3", "V4", "V5","V6","V7","V8","V9") ,c("Date","Time","Global_active_Power","Global_reactive_Power","Voltage", "Global_intensity","sub_metering_1", "sub_metering_2" ,"sub_metering_3") )
	
	## add columne for x(strptime), paste Date and Time
	
	DT[ ,GraphDate:=paste(Date,Time)]
	
	## mfrow - 1,1 -> 1,2 ->2,1 -> 2,2
	par(mfrow=c(2,2)) 
	
	##  plot4 mfrow - 1,1
	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$Global_active_Power, , type = "l" , col="black", xlab ="", ylab ="Global active Power")

	##  plot4 mfrow - 1,2

	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$Voltage, , type = "l" , col="black", xlab ="datetime", ylab ="Voltage")
	
	##  plot4 mfrow - 2,1
	
	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$sub_metering_1, type = "l" , col="black", xlab ="", ylab ="Energy sub metering")
	lines(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$sub_metering_2, type = "l" , col="red")
	lines(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$sub_metering_3, type = "l" , col="blue")
	legend("topright", pch = "-" ,  col = c("black", "red", "blue"), legend = c("sub_metering_1", "Other sub_metering_2", "sub_metering_3") )
			
	##  plot4 mfrow - 2,2	
	
	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$Global_reactive_Power, , type = "l" , col="black", xlab ="datetime", ylab ="Global_reactive_Power")
	
	## change device to png file  
	
	png(filename = "./data/plot4.png", width = 480, height = 480)
	
	## draw plot to png file  
	
	## mfrow - 1,1 -> 1,2 ->2,1 -> 2,2
	par(mfrow=c(2,2)) 
	
	##  plot4 mfrow - 1,1
	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$Global_active_Power, , type = "l" , col="black", xlab ="", ylab ="Global active Power")

	##  plot4 mfrow - 1,2

	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$Voltage, , type = "l" , col="black", xlab ="datetime", ylab ="Voltage")
	
	##  plot4 mfrow - 2,1
	
	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$sub_metering_1, type = "l" , col="black", xlab ="", ylab ="Energy sub metering")
	lines(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$sub_metering_2, type = "l" , col="red")
	lines(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$sub_metering_3, type = "l" , col="blue")
	legend("topright", pch = "-" ,  col = c("black", "red", "blue"), legend = c("sub_metering_1", "Other sub_metering_2", "sub_metering_3") )
			
	##  plot4 mfrow - 2,2	
	
	plot(strptime(DT$GraphDate, format="%d/%m/%Y %H:%M:%S"), DT$Global_reactive_Power, , type = "l" , col="black", xlab ="datetime", ylab ="Global_reactive_Power")
		
	## exit from png file to default screen  	
	dev.off()
}