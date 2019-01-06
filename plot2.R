file_path <- 'data/household_power_consumption.txt'
data <- read.table(file_path, sep = ';', header = TRUE, stringsAsFactors = FALSE, colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings = '?')
data$Date <- as.Date(data$Date, '%d/%m/%Y')
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02', ]
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png('plot2.png', width = 480, height = 480)
plot(data$Time, data$Global_active_power, type = 'l', main = '', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()