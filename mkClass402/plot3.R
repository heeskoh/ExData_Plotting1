plot3 <- function() {
	## This first line will likely take a few seconds. Be patient!
	library(ggplot2)
	library(data.table)
	
	NEI <- readRDS("class4/summarySCC_PM25.rds")
	SCC <- readRDS("class4/Source_Classification_Code.rds")
	
	myfips <- "24510"
	NEI.sub1 <- subset(NEI, NEI$fips == myfips)
		
	## GGplot2  
    ##  myEmi <- tapply(NEI.sub1$Emissions, NEI.sub1$year, sum)
 
	
	xlim <- c(min(NEI.sub1$year), max(NEI.sub1$year))
	myEmi <- tapply(NEI.sub1$Emissions, NEI.sub1$year, sum)
	ylim <- c(0, max(myEmi) )
	
	NEI.point <- subset(NEI.sub1, NEI.sub1$type == "POINT")
	pointemi <- as.numeric(tapply(NEI.point$Emissions, NEI.point$year, sum))
	
	NEI.nonpoint <- subset(NEI.sub1, NEI.sub1$type == "NONPOINT")
	nonpointemi <-as.numeric(tapply(NEI.nonpoint$Emissions, NEI.nonpoint$year, sum))
	
	NEI.road <- subset(NEI.sub1, NEI.sub1$type == "ON-ROAD")
	roademi <-as.numeric(tapply(NEI.road$Emissions, NEI.road$year, sum))
		
	NEI.nonroad <- subset(NEI.sub1, NEI.sub1$type == "NON-ROAD")
	nonroademi <-as.numeric(tapply(NEI.nonroad$Emissions, NEI.nonroad$year, sum))

	NEIx <- unique(NEI.sub1$year)
	
	## ggplot
	## main="PM2.5 Emissions Data in Baltimore City", xlab="Year", ylab="Amount of PM2.5 emitted(tons) per Type"
	
		ggplot() +
		labs(title = "PM2.5 Emissions Data in Baltimore City") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) per Type") +
		geom_line(aes(x = NEIx, y = pointemi, label="POINT" ),colour = 'blue', size = 3) + 
		geom_text(aes(x = NEIx[3], y = pointemi[3]+100, label="POINT" ),colour = 'blue', size = 5)+
		geom_line(aes(x = NEIx, y = nonpointemi,label="NON POINT"), colour = 'red', size = 3) +
		geom_text(aes(x = NEIx[2], y = nonpointemi[2]-100, label="NON POINT" ),colour = 'red', size = 5)+		
 		geom_line(aes(x = NEIx, y = roademi,label="ON-ROAD"),colour = 'orange', size = 3) +
		geom_text(aes(x = NEIx[2], y = roademi[2]-100, label="ON-ROAD" ),colour = 'orange', size = 5)+
		geom_line(aes(x = NEIx, y = nonroademi,label="NON-ROAD"),colour = 'black', size = 3)+		
		geom_text(aes(x = NEIx[3], y = nonroademi[3]+100, label="NON-ROAD" ),colour = 'black', size = 5)
    
   
    ## change device to png file  
    png(filename = "./class4/plot3.png", width = 480, height = 480)

	## ggplot
	
		ggplot() +
		labs(title = "PM2.5 Emissions Data in Baltimore City") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) per Type") +
		geom_line(aes(x = NEIx, y = pointemi, label="POINT" ),colour = 'blue', size = 3) + 
		geom_text(aes(x = NEIx[3], y = pointemi[3]+100, label="POINT" ),colour = 'blue', size = 5)+
		geom_line(aes(x = NEIx, y = nonpointemi,label="NON POINT"), colour = 'red', size = 3) +
		geom_text(aes(x = NEIx[2], y = nonpointemi[2]-100, label="NON POINT" ),colour = 'red', size = 5)+		
 		geom_line(aes(x = NEIx, y = roademi,label="ON-ROAD"),colour = 'orange', size = 3) +
		geom_text(aes(x = NEIx[2], y = roademi[2]-100, label="ON-ROAD" ),colour = 'orange', size = 5)+
		geom_line(aes(x = NEIx, y = nonroademi,label="NON-ROAD"),colour = 'black', size = 3)+		
		geom_text(aes(x = NEIx[3], y = nonroademi[3]+100, label="NON-ROAD" ),colour = 'black', size = 5)
		
    ## exit from png file to default screen  	
	dev.off()
		
    }
    
    