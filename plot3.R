file_path <- 'data/household_power_consumption.txt'
data <- read.table(file_path, sep = ';', header = TRUE, stringsAsFactors = FALSE, colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = '?')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02', ]
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png('plot3.png', width = 480, height = 480)
plot(data$Time, data$Sub_metering_1, type = 'l', main = '', xlab = '', ylab = 'Energy sub metering')
points(data$Time, data$Sub_metering_2, type = 'l', col = 'red')
points(data$Time, data$Sub_metering_3, type = 'l', col = 'blue')
legend(x = 'topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1, 1, 1))
dev.off()