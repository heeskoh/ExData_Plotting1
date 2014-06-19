plot6 <- function() {
	## This first line will likely take a few seconds. Be patient!
	library(ggplot2)
	
	NEI <- readRDS("class4/summarySCC_PM25.rds")
	SCC <- readRDS("class4/Source_Classification_Code.rds")
		
	## 24510 -- Baltimore City  
	
	NEI.Balt <- subset(NEI, NEI$fips == "24510")
	
	## 06037 -- Los Angeles County
	NEI.LA <- subset(NEI, NEI$fips == "06037")
	
    ##  motor vechicle sources
 	myVechicles<- SCC[ ( grepl("vehicle",  SCC$EI.Sector, ignore.case = TRUE ) |  grepl("vehicle",  SCC$SCC.Level.Two,  ignore.case = TRUE ) ) ==TRUE, ]
	## 1453
	
    ## subset for  motor vechicle sources in  Baltimore City  
        BalNEI <-  cbind(NEI.Balt  , VehiclesRelated = NEI.Balt $SCC %in% myVechicles$SCC)    
	    BalVechicles <- subset(BalNEI, VehiclesRelated == TRUE)
    ## subset for  motor vechicle sources in  Baltimore City  
        LANEI <-  cbind(NEI.LA  , VehiclesRelated = NEI.LA $SCC %in% myVechicles$SCC)    
	    LAVechicles <- subset(LANEI, VehiclesRelated == TRUE)
    
    ## Data frame for sum of Emission for Baltimore City
    		myEmisum <- data.frame(
  	   			Year = unique(BalVechicles$year), 
  	   			SumEmission = as.numeric(tapply(BalVechicles$Emissions, BalVechicles$year, sum)),  
  	   			Location = rep("24510", length(as.character(unique(BalVechicles$year))))
  	   			)	 
  	  ## Data frame for sum of Emission for Los Angeles County 			
      		myEmisum1 <- data.frame(
  	   			Year = unique(LAVechicles$year), 
  	   			SumEmission = as.numeric(tapply(LAVechicles$Emissions, LAVechicles$year, sum)),  
  	   			Location = rep("06037", length(as.character(unique(LAVechicles$year))))
  	   			)	   
     ## merge 2 cities data frame 
    	myEmisum <- merge(myEmisum, myEmisum1, all=TRUE)
    
  	## GGplot
 
	xlim <- c(min(myEmisum$Year), max(myEmisum$Year))
	ylim <- c(0, max(myEmisum$SumEmission) )

	
	## ggplot
	## main="Compare PM2.5 Emissions to Baltimore City and Los Angels", xlab="Year", ylab="Amount of PM2.5 emitted(tons) per Type"
	
	ggplot(myEmisum, aes(x = Year, y = SumEmission, colour = Location) ) + geom_line(size = 1 ) +
	geom_point( size = 3 ) +
	scale_colour_discrete(labels=c("Baltimore", "L. A")) +
		ylim(0, max(myEmisum$SumEmission)) + xlim(min(myEmisum$Year), max(myEmisum$Year)) +
	labs(title = "Motor Vechicle Related PM2.5 Emissions compare with two cities") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) about Motor Vechicle Related") 
		
    ## change device to png file  
    png(filename = "./class4/plot6.png", width = 480, height = 480)

	## ggplot
	
	ggplot(myEmisum, aes(x = Year, y = SumEmission, colour = Location) ) + geom_line(size = 1 ) +
	geom_point( size = 3 ) +
	scale_colour_discrete(labels=c("Baltimore", "L. A")) +
		ylim(0, max(myEmisum$SumEmission)) + xlim(min(myEmisum$Year), max(myEmisum$Year)) +
	labs(title = "Motor Vechicle Related PM2.5 Emissions compare with two cities") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) about Motor Vechicle Related") 
		
    ## exit from png file to default screen  	
	dev.off()
		
    }