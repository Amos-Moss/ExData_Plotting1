
### Exploratory Analysis Assignment 1

library(lubridate)

df <- read.table("household_power_consumption.txt", header=T, sep=";",
                 na.strings = "?")

# convert date/time columns to date and time class
df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)

# Isolate the date range of interest
relevant_dates <- df[df$Date >= "2007-02-01" & df$Date < "2007-02-03",]

# Combine Data and Time columns for plotting purposes
relevant_dates$DT <- with(relevant_dates, Date + Time)

# Plot number 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(relevant_dates$DT, relevant_dates$Global_active_power,
     ylab = "Global Active Power (Kilowatts)", xlab = "",
     type = "l")
plot(relevant_dates$DT, relevant_dates$Voltage, xlab = "datetime",
     ylab = "Voltage", type = "l")
plot(relevant_dates$DT, relevant_dates$Sub_metering_1,
     ylab = "Energy sub metering", xlab = "",
     type = "l")
lines(relevant_dates$DT, relevant_dates$Sub_metering_2, col = "red")
lines(relevant_dates$DT, relevant_dates$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1 ,col = c("black", "red", "blue"))
plot(relevant_dates$DT, relevant_dates$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")
dev.off()