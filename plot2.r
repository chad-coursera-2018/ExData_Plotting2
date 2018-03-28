# load lib(s)
library(plyr)

# set WD source
setwd("C:\\Users\\Chad\\Desktop\\GITTED\\ExData_Plotting2")

# load data
NEI <- readRDS("C:\\Users\\Chad\\Desktop\\GITTED\\exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\Chad\\Desktop\\GITTED\\exdata_data_NEI_data\\Source_Classification_Code.rds")

# subset the Data to only the NEI for Baltimore (fips = 24510)
bm <- subset(NEI, fips == "24510")

# split years
byYear <- ddply(bm, "year", function(df) sum(df$Emissions))

# set year as factor
byYear$year <- as.factor(byYear$year)

# plot
png("plot2.png")
barplot(byYear$V1, names.arg=byYear$year, xlab="Year", ylab="Total PM2.5 (Tons per year)", ylim=c(0, 3500), main="PM2.5 Emissions by Year in Baltimore", col="blue")
dev.off()

