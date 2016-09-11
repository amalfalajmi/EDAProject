plot1<-function(){
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata/summarySCC_PM25.rds")
SCC <- readRDS("./exdata/Source_Classification_Code.rds")

#group the Emissin amount for each year
EmByY <<- with(NEI, aggregate(Emissions, by = list(year), sum))

##Plot for Emissions amount for Each year
png("./exdata/plot1.png")
plot(EmByY, type = "o", main = "Total PM2.5's Emissions", xlab = "Year", ylab = "Emissions", pch = 8,lwd=2)
dev.off()

}