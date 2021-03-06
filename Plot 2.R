
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)


household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")


## Subsetting the data

data <- subset(household_power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(household_power_consumption)

## Converting dates

datetime <- paste(as.Date(data$Date), data$Time)

data$Datetime <- as.POSIXct(datetime)

## Generating Plot 2

plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")