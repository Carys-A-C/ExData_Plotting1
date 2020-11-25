#############################
## Plot4 - 4 faceted Plots ##
#############################

## All plots are plotted first using the graphics interface in R, then printed to png after

## Read in data
dat1 <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

## Create merged Date and Time column
dat1$Date_Time <- paste(dat1$Date, dat1$Time)

## Convert Date to date Class
dat1$Date <- as.Date(dat1$Date, tryFormats = "%d/%m/%Y")
str(dat1)

## Subset the data for only the ones with the dates of interest "2007-02-01" & "2007-02-02"
dat2 <- dat1[dat1$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

## Convert Date_Time to POSIXlt
dat2$Date_Time <- strptime(dat2$Date_Time, format = "%Y-%m-%d %H:%M:%S")
str(dat2)

## Set Parameters
par(mfrow = c(2, 2)) ## set parameters, 4 graphs, 2 rows, 2 columns, by row

## Plot
with(dat2, {
        plot(Date_Time, ## Graph 1 (described in plot2.R)
             Global_active_power, 
             type = "l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)")
        plot(Date_Time, ## Graph 2, x
             Voltage, ## y
             type = "l", ## line plot
             xlab = "datetime") ## x axis label
        with(dat2, plot(Date_Time, Sub_metering_1, ## Graph 3 (described in plot3.R)
                        type = "l", 
                        xlab = "", 
                        ylab = "Energy sub metering"))
        with(dat2, lines(Date_Time, 
                         Sub_metering_2, 
                         col = "red"))
        with(dat2, lines(Date_Time, 
                         Sub_metering_3, 
                         col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date_Time, ## Graph 4, x
             Global_reactive_power, ## y
             type = "l", ## graph line plot
             xlab = "datetime") ## x label
})

## Print to png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(dat2, {
        plot(Date_Time, 
             Global_active_power, 
             type = "l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)")
        plot(Date_Time,
             Voltage,
             type = "l",
             xlab = "datetime")
        with(dat2, plot(Date_Time, Sub_metering_1, 
                        type = "l", 
                        xlab = "", 
                        ylab = "Energy sub metering"))
        with(dat2, lines(Date_Time, 
                         Sub_metering_2, 
                         col = "red"))
        with(dat2, lines(Date_Time, 
                         Sub_metering_3, 
                         col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date_Time,
             Global_reactive_power,
             type = "l",
             xlab = "datetime")
})
dev.off()