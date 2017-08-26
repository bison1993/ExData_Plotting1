## read the data file into power data frame
power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", 
                    header=TRUE)

## create a new data frame, power2, that is limited to just 2007-02-01 and 2007-02-02
library(dplyr)
power2<-filter(power, as.Date(Date, "%d/%m/%Y")=="2007-02-01" | 
                      as.Date(Date, "%d/%m/%Y")=="2007-02-02")

## add a column Date_ts to the data frame that represents the date and time as a datetime class
power2$Date_ts <- strptime(paste(power2$Date, power2$Time), "%d/%m/%Y %H:%M:%S")

## set device to png, otherwise the legend gets truncated
png(file='plot3.png', width=480, height=480)

## create an empty step plot
with(power2, plot(Date_ts, Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering"))

## add the three lines for the different sub_metering values
lines(power2$Date_ts, power2$Sub_metering_1, type="s")
lines(power2$Date_ts, power2$Sub_metering_2, type="s", col="red")
lines(power2$Date_ts, power2$Sub_metering_3, type="s", col="blue")

## add the legend
legend("topright", legend=names(power2)[7:9], lty=1, col=c('black', 'red', 'blue'))

## close png device
dev.off()