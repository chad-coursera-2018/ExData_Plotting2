# load lib(s)
library(plyr)

# set WD source
setwd("C:\\Users\\Chad\\Desktop\\GITTED\\ExData_Plotting2")

# load data
NEI <- readRDS("C:\\Users\\Chad\\Desktop\\GITTED\\exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\Chad\\Desktop\\GITTED\\exdata_data_NEI_data\\Source_Classification_Code.rds")

# split years
byYear <- ddply(NEI, "year", function(df) sum(df$Emissions))

# set year as factor
byYear$year <- as.factor(byYear$year)

# change scales
byYear$EmissionsM <- round(byYear$V1 / 1000000, 1)

# plot
png("plot1.png")
barplot(byYear$EmissionsM, names.arg=byYear$year, xlab="Year", ylab="Total PM2.5 (Millions of Tons)", ylim=c(0,8), main="Total PM2.5 Emissions by Year", col="blue")
dev.off()

