plot5 <- function() {
	## This first line will likely take a few seconds. Be patient!
	library(ggplot2)
		
	NEI <- readRDS("class4/summarySCC_PM25.rds")
	SCC <- readRDS("class4/Source_Classification_Code.rds")
		
	## 24510 -- Baltimore City  
	
	NEI.Balt <- subset(NEI, NEI$fips == "24510")
	
    ##  motor vechicle sources
 	myVechicles<- SCC[ ( grepl("vehicle",  SCC$EI.Sector, ignore.case = TRUE ) |  grepl("vehicle",  SCC$SCC.Level.Two,  ignore.case = TRUE ) ) ==TRUE, ]
	## 1453
	
    ## subset for  motor vechicle sources in  Baltimore City  
        BalNEI <-  cbind(NEI.Balt  , VehiclesRelated = NEI.Balt $SCC %in% myVechicles$SCC)    
	    BalVechicles <- subset(BalNEI, VehiclesRelated == TRUE)
   
  	## GGplot

	xlim <- c(min(BalVechicles$year), max(BalVechicles$year))
	myEmi <- as.numeric(tapply(BalVechicles$Emissions, BalVechicles$year, sum))
	ylim <- c(0, max(myEmi) )

	
	## ggplot

		ggplot() + 
		geom_bar(aes(unique(BalVechicles$year), y=as.numeric(tapply(BalVechicles$Emissions, BalVechicles$year, sum))), stat="identity", fill='blue' ) +
		ylim(0, max(myEmi)) +
		labs(title = "Motor Vechicle Related PM2.5 Emissions Data in Baltimore City") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) about Motor Vechicle Related") 

	

    ## change device to png file  
    	png(filename = "./class4/plot5.png", width = 480, height = 480)

	## ggplot
	
		ggplot() + 
		geom_bar(aes(unique(BalVechicles$year), y=as.numeric(tapply(BalVechicles$Emissions, BalVechicles$year, sum))), stat="identity", fill='blue' ) +
		ylim(0, max(myEmi)) +
		labs(title = "Motor Vechicle Related PM2.5 Emissions Data in Baltimore City") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) about Motor Vechicle Related") 
		
    ## exit from png file to default screen  	
	dev.off()
		
    }