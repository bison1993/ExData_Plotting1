## read the data file into power data frame
power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", 
                    header=TRUE)

## create a new data frame, power2, that is limited to just 2007-02-01 and 2007-02-02
library(dplyr)
power2<-filter(power, as.Date(Date, "%d/%m/%Y")=="2007-02-01" | 
                      as.Date(Date, "%d/%m/%Y")=="2007-02-02")

## add a column Date_ts to the data frame that represents the date and time as a datetime class
power2$Date_ts <- strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M:%S")

## create the line plot
with(power2, plot(Date_ts, Global_active_power, type="l", 
                  ylab="Global Active Power (kilowatts)", xlab=NA))

## copy plot to png
dev.copy(png, 'plot2.png', width=480, height=480)
dev.off()