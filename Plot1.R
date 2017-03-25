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

png("Plot1.png", width=480, height=480)

hist(powersub$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
     )

axis(2, at=seq(0,1200,200), labels=seq(0,1200,200))

dev.off()

