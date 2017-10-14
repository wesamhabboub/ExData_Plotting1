##Set Working directory
setwd("C:/Users/wissamha/Dropbox/Docs and Trainings/Data Science/Coursera Data Science/Course 4- Exploratory Analysis/Assignment 1")
##Download and unzip the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./Data/power_consumption.zip")
unzip("./Data/power_consumption.zip",exdir="./Data")
##Read the data set
power_ds<-read.table("./Data/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
##Transform data and time
str(power_ds)
x<-paste(power_ds$Date,power_ds$Time)
power_ds$DateTime<-strptime(x,format="%d/%m/%Y %H:%M:%S")

##Filter the data set 
power_ds<-power_ds[power_ds$DateTime>="2007-02-01" & power_ds$DateTime<="2007-02-02",]

##Graph 1
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))
hist(power_ds$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (Kilowats)")
dev.off()



