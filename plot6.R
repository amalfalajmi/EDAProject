plot6<-function(){
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata/summarySCC_PM25.rds")
SCC <- readRDS("./exdata/Source_Classification_Code.rds")

library(ggplot2)

##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
##vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
Baltimore <<- subset(NEI, fips == "24510" & type=="ON-ROAD")
California <<-subset(NEI, fips == "06037" & type=="ON-ROAD")

EmByY <- aggregate(Baltimore[c("Emissions")], list( year = Baltimore$year, fips = Baltimore$fips), sum)
EmByY1 <- aggregate(California[c("Emissions")], list( year = California$year, fips = California$fips), sum)
all_city <<- rbind(EmByY, EmByY1)
qplot(year, Emissions, data = all_city, color = fips, geom= "line")  + ggtitle("Baltimore vs. Los Angeles Motor Vehicle Emissions") + xlab("Year") + ylab("Emissions")     
#Save image
dev.copy(png,file="./exdata/plot6.png")
dev.off()

}