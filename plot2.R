message("Loading data")
d <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE)

message("Parsing and Converting Data")
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
rows <- (d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"))
x <- as.POSIXlt(paste(d$Date[rows], d$Time[rows]))
y <- d$Global_active_power[rows]

message("Making plot")
png('plot2.png', height = 480, width = 480)
plot(x, y, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#don't forget to close the graphics device
dev.off()