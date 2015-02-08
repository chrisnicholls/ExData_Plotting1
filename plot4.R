message("Loading data")
d <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE)

message("Parsing and Converting Data")
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
rows <- (d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"))
x <- as.POSIXlt(paste(d$Date[rows], d$Time[rows]))

sm1 <- as.numeric(d$Sub_metering_1[rows])
sm2 <- as.numeric(d$Sub_metering_2[rows])
sm3 <- as.numeric(d$Sub_metering_3[rows])

message("Making plot")
png('plot4.png', height = 480, width = 480)

par(mfrow = c(2,2))
#Top left
y <- d$Global_active_power[rows]
plot(x, y, type="l", ylab="Global Active Power", xlab="")

#Top Right
y <- d$Voltage[rows]
plot(x, y, type="l", ylab="Voltage", xlab="datetime")

#Bottom Left
plot(x, sm1, type="l", ylab = "Energy sub metering", xlab = "")
lines(x, sm2, col="red")
lines(x, sm3, col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(d[7:9]), box.lwd=0)

#Bottom Right
y <- d$Global_reactive_power[rows]
plot(x, y, type="l", ylab=names(d[4]), xlab="datetime")

#don't forget to close the graphics device
dev.off()