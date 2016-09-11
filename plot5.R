plot5<-function(){
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata/summarySCC_PM25.rds")
SCC <- readRDS("./exdata/Source_Classification_Code.rds")

##How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
Baltimore <<- subset(NEI, fips == "24510" & type=="ON-ROAD")
EmByY <<- with(Baltimore, aggregate(Emissions, by = list(year), sum))
plot(EmByY, type = "o", main = "Total Motor PM2.5's Emissions in Baltimor City", xlab = "Year", ylab = "Emissions", pch = 8,lwd=2)

#Save image
dev.copy(png,file="./exdata/plot5.png")
dev.off()

}