# Plot4 - 4 x 4 plot
#Reading the file#
hpc_df <- read.csv("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")

library(dplyr)

hpc_df <- mutate(hpc_df, dttm = strptime(paste(hpc_df$Date,hpc_df$Time), format= "%d/%m/%Y %H:%M:%S" ))
#filtering the dataset with two days of data from 1st to 2nd Feb 2007 
hpc_df_dts <- filter(hpc_df, dttm>=strptime("2007-02-01 00:00:00", format= "%Y-%m-%d %H:%M:%S"), dttm <=strptime("2007-02-02 23:59:00", format= "%Y-%m-%d %H:%M:%S" ) )

##Setting the Margins and the graph areas, note to self mgp sets the distance between axis text and label
par(mfrow = c(2, 2), mar = c(3,3, 2, 1), oma= c(0,0,0,0),mgp=c(1.25,0.5,0))

##**************************************************************
## Working on the top left graph which is same script as Plot1
plot(hpc_df_dts$dttm , hpc_df_dts$Global_active_power, main ="", ylab ="Global Active Power", xlab="" , type = "l",cex.lab=0.6,cex.axis=0.6)


##**************************************************************
## Working on the top right graph
plot(hpc_df_dts$dttm , hpc_df_dts$Voltage, main ="", ylab ="Voltage", xlab="datetime" , type = "l",cex.lab=0.6,cex.axis=0.6)


##**************************************************************
## Working on the bottom left graph which is same script as Plot3

with(hpc_df_dts,plot(dttm ,Sub_metering_1,type="n", xlab="",ylab="Energy sub metering",cex.lab=0.6,cex.axis=0.6))

##Plotting the Submetering 1
with(hpc_df_dts,lines(dttm ,Sub_metering_1,type="l",))
##Plotting the Submetering 2
with(hpc_df_dts,lines(dttm ,Sub_metering_2,type="l", col= "Red"))
##Plotting the Submetering 3
with(hpc_df_dts,lines(dttm ,Sub_metering_3,type="l", col="Blue"))
# Adding Legend
legend("topright",lty = 1, col= c("Black","Red","Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)

##**************************************************************
## Working on the bottom right graph 
plot(hpc_df_dts$dttm , hpc_df_dts$Global_reactive_power, main ="", ylab ="Global_reactive_power", xlab="datetime" , type = "l",cex.lab=0.6,cex.axis=0.6)

##copy the graph to a PNG file with 480 pixels
dev.copy(png,file="plot4.png",height = 480, width = 480, units = "px")
dev.off()