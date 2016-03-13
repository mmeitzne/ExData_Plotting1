##Plot2
##household_power_consumption.txt needs to be copied into 
##the working directory.  File was provided by Courera
##sourced from UC Irvine Machine Learning Repository

datafile <- ("household_power_consumption.txt")

pwr <- read.table(datafile, header=T, sep=";")
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
dframe <- pwr[(pwr$Date=="2007-02-01") | (pwr$Date=="2007-02-02"),]
dframe$Global_active_power <- as.numeric(as.character(dframe$Global_active_power))
dframe$Global_reactive_power <- as.numeric(as.character(dframe$Global_reactive_power))
dframe$Voltage <- as.numeric(as.character(dframe$Voltage))
dframe <- transform(dframe, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
dframe$Sub_metering_1 <- as.numeric(as.character(dframe$Sub_metering_1))
dframe$Sub_metering_2 <- as.numeric(as.character(dframe$Sub_metering_2))
dframe$Sub_metering_3 <- as.numeric(as.character(dframe$Sub_metering_3))

plot2 <- function() {
        plot(dframe$timestamp,dframe$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
}
plot2()

