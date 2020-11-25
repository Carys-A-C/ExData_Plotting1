
#######################
## Plot2 - Line Plot ##
#######################

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

## Plot Time vs Global Active Power as a line plot
with(dat2, plot(Date_Time, ## x of graph
                Global_active_power, ## y of graph
                type = "l", ## change type to line graph
                xlab = "", ## x label (nothing)
                ylab = "Global Active Power (kilowatts)")) ## y label

## Print to png
png("plot2.png", width = 480, height = 480)
with(dat2, plot(Date_Time, 
                Global_active_power, 
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.off()

