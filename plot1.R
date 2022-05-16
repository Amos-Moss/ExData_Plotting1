
### Exploratory Analysis Assignment 1

library(lubridate)

df <- read.table("household_power_consumption.txt", header=T, sep=";",
                 na.strings = "?")

# convert date/time columns to date and time class
df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)

# Isolate the date range of interest
relevant_dates <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# Plot number 1
png(file = "plot1.png", width = 480, height = 480)
hist(relevant_dates$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()