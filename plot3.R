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
png('plot3.png', height = 480, width = 480)
plot(x, sm1, type="l", ylab = "Energy sub metering", xlab = "")
lines(x, sm2, col="red")
lines(x, sm3, col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(d[7:9]))

#don't forget to close the graphics device
dev.off()