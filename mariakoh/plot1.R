plot1 <- function() {
	## read data file 
	##library(data.table)
    ## 1/2/2007 ~ 2/2/2007 : skip=66637 nrow=69517
    ## Data Table from file
        
	DT <- fread("./data/household_power_consumption.txt", sep=";", nrows=2880, na.strings="NA", stringsAsFactors=FALSE, verbose=FALSE, skip=66637, select=NULL, drop=NULL, integer64=getOption("datatable.integer64"), showProgress=getOption("datatable.showProgress"))

	## set column names		

	setnames(DT, c("V1", "V2", "V3", "V4", "V5","V6","V7","V8","V9") ,c("Date","Time","Global_active_Power","Global_reactive_Power","Voltage", "Global_intensity","sub_metering_1", "sub_metering_2" ,"sub_metering_3") )

	## Histogram 
	
	hist(DT$Global_active_Power, freq = TRUE, col="red", main="Global active Power", xlab ="Global active Power(killowatts)")

	## change device to png file  
	
	png(filename = "./data/plot1.png", width = 480, height = 480)

	## draw Histogram to png file  
	
	hist(DT$Global_active_Power, freq = TRUE, col="red", main="Global active Power", xlab ="Global active Power(killowatts)")
	
	## exit from png file to default screen  	
	dev.off()

}