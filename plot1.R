# Plot1#
#Reading the file#
hpc_df <- read.csv("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")

library(dplyr)

hpc_df$Date <- as.Date(hpc_df$Date, format ="%d/%m/%Y" )
hpc_df_dts <- filter(hpc_df, Date>=as.Date("2007-02-01"), Date <=as.Date("2007-02-02") )
hist(hpc_df_dts$Global_active_power, main ="Global Active Power", xlab ="Global Active Power(kilowatts)" , col= "Red")

png(filename="plot1.png",height = 480, width = 480, units = "px")
dev.off()
getwd()