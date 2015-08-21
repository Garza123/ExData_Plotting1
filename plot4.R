plot4 <- function(){
  data <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", 
                     colClasses = c("factor","factor","numeric",
                                    "numeric","numeric","numeric",
                                    "numeric","numeric","numeric"),
                     nrows = 2100000,comment.char = "", na.strings = "?")
  data1 <- data[data$Date == "1/2/2007",]
  data2 <- data[data$Date == "2/2/2007",]
  useful <- rbind(data1,data2)
  dates <- useful$Date
  times <- useful$Time
  x <- paste(dates,times)
  useful$Date <- strptime(x,"%d/%m/%Y %H:%M:%S")
  par(mfcol=c(2,2))
  Sys.setlocale("LC_ALL","English")
  plot(useful$Date,useful$Global_active_power,type = "l",xlab = "",
       ylab = "Global Active Power")
  plot(useful$Date,useful$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
  lines(useful$Date,useful$Sub_metering_1,col="black")
  lines(useful$Date,useful$Sub_metering_2,col="red")
  lines(useful$Date,useful$Sub_metering_3,col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)
  plot(useful$Date,useful$Voltage,type="l",xlab = "",ylab = "Voltage")
  plot(useful$Date,useful$Global_reactive_power,xlab = "datetime",type="l",
       ylab = "Global_reactive_power")
  dev.copy(png,file = "plot4.png")
  dev.off()
  "Plot 4 created"
  Sys.setlocale("LC_ALL","Spanish")
}