plot2<-function(){
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata/summarySCC_PM25.rds")
SCC <- readRDS("./exdata/Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 

Baltimore <<- subset(NEI, fips == "24510")
EmByY <- tapply(Baltimore$Emissions, Baltimore$year, sum)
##Plot for Emissions amount for Each year
png("./exdata/plot2.png")
plot(EmByY, type = "o", main = "Total PM2.5's Emissions for Baltimore City", xlab = "Year", ylab = "Emissions", pch = 8,lwd=2)
dev.off()

}