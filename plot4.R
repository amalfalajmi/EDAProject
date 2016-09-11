plot4<-function(){
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata/summarySCC_PM25.rds")
SCC <- readRDS("./exdata/Source_Classification_Code.rds")

library(ggplot2)
##Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

SCC_Coal <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI_Coal <- NEI[NEI$SCC %in% SCC_Coal$SCC, ]
p<-ggplot(NEI_Coal, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity") + xlab("year") +ylab("PM2.5 CoalEmissions") + ggtitle("Total PM2.5's Coal-RelatedEmissions")
print(p)

#Save image
dev.copy(png,file="./exdata/plot4.png")
dev.off()

}