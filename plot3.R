
################################
## Plot3 - Overlay Line plots ##
################################

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

## Plot Time vs Energy submetering (all 3, overlaid)
with(dat2, plot(Date_Time, Sub_metering_1, ## plot 1 (base plot), x and y
                type = "l", ## graph as a line
                xlab = "",  ## no x axis label
                ylab = "Energy sub metering")) ## y axis label
with(dat2, lines(Date_Time, ## add a line to graph, x
                 Sub_metering_2, ## y
                 col = "red")) ## color of line
with(dat2, lines(Date_Time, ## add a line to graph, x
                 Sub_metering_3, ## y
                 col = "blue")) ## color of line
legend("topright", ## legend location
       lty = 1, ## linetype
       col = c("black", "red", "blue"), ## colors of lines
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ## legend text

## Print to png
png("plot3.png", width = 480, height = 480)
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
dev.off()

