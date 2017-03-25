.libPaths("C:/R/lib")

# Reading in the data
power <- read.csv("household_power_consumption.txt", sep=";")

# Transforming the data to a usable format

# 1) Setting the ? values to NA

power[power=="?"] <- NA

# 2) Transforming the columns to the appropriate data types

power$Date <- as.Date(power$Date, '%d/%m/%Y')

power$Time <- format(strptime(power$Time, '%H:%M:%S' ), "%H:%M:%S")

power$Global_active_power <- as.numeric(as.character(power$Global_active_power))

power$Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))

power$Voltage <- as.numeric(s.character(power$Voltage)) 

power$Global_intensity <- as.numeric(as.character(power$Global_intensity))

power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))

power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))

power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

# Subset of what we need

powersub <- power[which(power$Date=='2007-02-01' | power$Date=='2007-02-02'),]

powersub$DateTime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("Plot3.png", width=480, height=480)

plot(powersub$DateTime, powersub$Sub_metering_1, type="l",
     ylab= "Energy sub metering" ,
     xlab= ""
     )
lines(powersub$DateTime, powersub$Sub_metering_2, col="red")
lines(powersub$DateTime, powersub$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
