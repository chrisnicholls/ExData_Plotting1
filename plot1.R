message("Loading data")
d <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=FALSE)
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
rows <- (d$Date == as.Date("2007-02-01") | d$Date == as.Date("2007-02-02"))
x <- as.numeric(d$Global_active_power[rows])

message("Making plot")
png('plot1.png', height = 480, width = 480)
hist(x, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#don't forget to close the graphics device
dev.off()