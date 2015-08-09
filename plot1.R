plot1 <- function(){
  data <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", 
                     colClasses = c("factor","factor","numeric",
                                    "numeric","numeric","numeric",
                                    "numeric","numeric","numeric"),
                     nrows = 2100000,comment.char = "", na.strings = "?")
  data1 <- data[data$Date == "1/2/2007",]
  data2 <- data[data$Date == "2/2/2007",]
  useful <- rbind(data1,data2)
  useful$Time <- strptime(useful$Time,format = "%H:%M:%S")
  useful$Date <- as.Date(useful$Date, format = "%d/%m/%Y")
  hist(useful$Global_active_power, main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)",col="red",
       pin = c(6.4, 6.4))
  dev.copy(png,file = "plot1.png")
  dev.off()
  "Plot 1 created"
}