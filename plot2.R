plot2 <- function(){
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
  plot(useful$Date,useful$Global_active_power,type = "l",xlab = "",
       ylab = "Global Active Power (kilowatts)", pin = c(6.4,6.4))
  dev.copy(png,file = "plot2.png")
  dev.off()
  "Plot 2 created"
}