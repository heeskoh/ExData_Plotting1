plot4 <- function() {
	## This first line will likely take a few seconds. Be patient!
	library(ggplot2)
	library(data.table)
	
	NEI <- readRDS("class4/summarySCC_PM25.rds")
	SCC <- readRDS("class4/Source_Classification_Code.rds")
		
	## GGplot2  
    ##  myEmi <- tapply(NEI.sub1$Emissions, NEI.sub1$year, sum)
 
	myCoal <- SCC[ (grepl("Coal",  SCC$EI.Sector, ignore.case = TRUE )) ==TRUE, ]
    myNEI <-  cbind(NEI, CoalRelated = NEI$SCC %in% myCoal$SCC)    
     
    myNEICoal <- subset(myNEI, CoalRelated == TRUE)

	
  	## GGplot

	xlim <- c(min(myNEICoal$year), max(myNEICoal$year))
	myEmi <- as.numeric(tapply(myNEICoal$Emissions, myNEICoal$year, sum))
	ylim <- c(0, max(myEmi) )
	
	## ggplot
	## main="PM2.5 Emissions Data in Baltimore City", xlab="Year", ylab="Amount of PM2.5 emitted(tons) per Type"
	
	##ggplot(myNEICoal, aes(x = unique(year), y = as.numeric(tapply(Emissions, year, sum))) )  + geom_line(colour = 'blue', size = 1 ) +
	##geom_point(colour = 'blue', size = 3 ) +
	##labs(title = "Coal Related PM2.5 Emissions Data in US") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) about Coal Related") 
		
		ggplot(myNEICoal, aes(x = unique(year), y = as.numeric(tapply(Emissions, year, sum))) )  + 
		geom_bar(stat="identity", fill='blue') +
		ylim(0, max(myEmi)) +
		labs(title = "Coal Related PM2.5 Emissions Data in US") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) about Coal Related") 
	

    ## change device to png file  
    png(filename = "./class4/plot4.png", width = 480, height = 480)

	## ggplot
	
		ggplot(myNEICoal, aes(x = unique(year), y = as.numeric(tapply(Emissions, year, sum))) )  + 
		geom_bar(stat="identity", fill='blue') +
		ylim(0, max(myEmi)) +
		labs(title = "Coal Related PM2.5 Emissions Data in US") + labs(x ="Year", y="Amount of PM2.5 emitted(tons) about Coal Related") 
		
    ## exit from png file to default screen  	
	dev.off()
		
    }