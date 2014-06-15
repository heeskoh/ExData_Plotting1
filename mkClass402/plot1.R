plot1 <- function() {
	## This first line will likely take a few seconds. Be patient!
	library(ggplot2)
	library(data.table)
	
	NEI <- readRDS("class4/summarySCC_PM25.rds")
	## SCC <- readRDS("class4/Source_Classification_Code.rds")
	
	## tapply(NEI$Emissions, NEI$year, sum)
	## lapply ( split ( NEI$Emissions , NEI$year ), sum )
	
	## Basic plot 
	## barplot(tapply(NEI$Emissions, NEI$year, sum), col="blue")
	
	xlim <- c(min(NEI$year), max(NEI$year))
    myEmi <- tapply(NEI$Emissions, NEI$year, sum)
	ylim <- c(0, max(myEmi))
	
	plot(unique(NEI$year), tapply(NEI$Emissions, NEI$year, sum), type = "b", xlim, ylim, lwd=5, col="blue")
    
    ## change device to png file  
    png(filename = "./class4/plot1.png", width = 480, height = 480)

	## Basic plot 

	plot(unique(NEI$year), tapply(NEI$Emissions, NEI$year, sum), type = "b", xlim, ylim, lwd=5, col="blue")
    
    ## exit from png file to default screen  	
	dev.off()

    }
    
    