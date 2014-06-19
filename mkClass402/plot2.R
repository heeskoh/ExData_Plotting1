plot2 <- function() {
	## This first line will likely take a few seconds. Be patient!
	NEI <- readRDS("class4/summarySCC_PM25.rds")
	SCC <- readRDS("class4/Source_Classification_Code.rds")
	
	myfips <- "24510"
	NEI.sub1 <- subset(NEI, NEI$fips == myfips)
	
	## Basic plot 
	## barplot(tapply(NEI$Emissions, NEI$year, sum), col="blue")
	
	xlim <- c(min(NEI.sub1$year), max(NEI.sub1$year))
    myEmi <- tapply(NEI.sub1$Emissions, NEI.sub1$year, sum)
	ylim <- c(0, max(myEmi))
	
	## main="PM2.5 Emissions Data in Baltimore City", xlab="Year", ylab="Amount of PM2.5 emitted(tons)"
	plot(unique(NEI.sub1$year), tapply(NEI.sub1$Emissions, NEI.sub1$year, sum), type = "b", xlim, ylim, lwd=5, col="blue",main="PM2.5 Emissions Data in Baltimore City", xlab="Year", ylab="Amount of PM2.5 emitted(tons)")
    
    ## change device to png file  
    png(filename = "./class4/plot2.png", width = 480, height = 480)

	## Basic plot 

	plot(unique(NEI.sub1$year), tapply(NEI.sub1$Emissions, NEI.sub1$year, sum), type = "b", xlim, ylim, lwd=5, col="blue", main="PM2.5 Emissions Data in Baltimore City", xlab="Year", ylab="Amount of PM2.5 emitted(tons)")
  
    ## exit from png file to default screen  	
	dev.off()
		
    }
    
    