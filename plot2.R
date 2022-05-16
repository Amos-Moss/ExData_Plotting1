
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

# Plot number 2
png(file = "plot2.png", width = 480, height = 480)
plot(relevant_dates$DT, relevant_dates$Global_active_power,
     ylab = "Global Active Power (Kilowatts)", xlab = "",
     type = "l")
dev.off()