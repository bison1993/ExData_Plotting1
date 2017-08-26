## read the data file into power data frame
power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

## create a new data frame, power2, that is limited to just 2007-02-01 and 2007-02-02
library(dplyr)
power2<-filter(power, as.Date(Date, "%d/%m/%Y")=="2007-02-01" | as.Date(Date, "%d/%m/%Y")=="2007-02-02")

## create the plot
hist(power2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## copy plot to png
dev.copy(png, 'plot1.png', width=480, height=480)
dev.off()