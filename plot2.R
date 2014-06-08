# Data for Feb 1, 2007 and Feb 2, 2007 was extracted from
# household_power_consumption.txt using two grep commands:
# 
# grep "^1/2/2007" household_power_consumption.txt > 20070201
# grep "^2/2/2007" household_power_consumption.txt > 20070202
#
# The header line was extracted from household_power_consumption.txt
# by issuing the command "head household_power_consumption.txt" from
# the console, cutting the first line from the console output, 
# and dropping it into its own file with the command
#
# echo Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Su_metering_1;Sub_metering_2;Sub_metering_3 > header
#
# Finally, the input file for this R script was created by 
# concatenating all three files with the command:
# 
# cat header 20070201 20070202 > combo
#
setwd("C:/Coursera/Exploratory Data Analysis/Assignments/ExData_Plotting1")
a = read.table("combo", header=T, sep=";")
datetime = strptime(paste(a$Date,a$Time), "%d/%m/%Y %H:%M:%S") # format unambiguous dates
# wdays = as.POSIXlt(dates)$wday    # calculate day-of-week (as integer) 
a = a[,3:9]                         # get rid of the old dates & times
a = data.frame(DateTime=datetime,a) # replace them with new date/times
#plot(weekdays(a$Date),a$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
#plot(a$Time,a$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
plot(a$DateTime, a$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")


