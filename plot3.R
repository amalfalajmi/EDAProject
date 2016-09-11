plot3<-function(){
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata/summarySCC_PM25.rds")
SCC <- readRDS("./exdata/Source_Classification_Code.rds")

library(ggplot2)
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
##Which have seen increases in emissions from 1999-2008? 
##Use the ggplot2 plotting system to make a plot answer this question.

Baltimore <<- subset(NEI, fips=="24510")
EmByY <- aggregate(Baltimore[c("Emissions")], list(type = Baltimore$type, year = Baltimore$year), sum)

##Plot for Emissions amount for Each year and SCC

qplot(year, Emissions, data = EmByY, color = type, geom= "line") + ggtitle("Total PM2.5's Emissions in Baltimore City by Source Type") + xlab("Year") + ylab("Emissions")
dev.copy(png,file="./exdata/plot3.png")
dev.off()

}