plot3 <- function(){
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
  plot(useful$Date,useful$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering",
       pin = c(6.4,6.4))
  lines(useful$Date,useful$Sub_metering_1,col="black")
  lines(useful$Date,useful$Sub_metering_2,col="red")
  lines(useful$Date,useful$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty = 1)
  dev.copy(png,file = "plot3.png")
  dev.off()
  "Plot 3 created"
}