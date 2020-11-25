
#######################
## Plot1 - Histogram ##
#######################

## All plots are plotted first using the graphics interface in R, then printed to png after

## Read in data
dat1 <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

## Convert Date to date Class
dat1$Date <- as.Date(dat1$Date, tryFormats = "%d/%m/%Y")
str(dat1)

## Subset the data for only the ones with the dates of interest "2007-02-01" & "2007-02-02"
dat2 <- dat1[dat1$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
str(dat2)

## Plot to window to visualize
hist(dat2$Global_active_power, col = "red", ## Data to plot and color
     xlab = "Global Active Power (kilowatts)", ## x axis label
     ylab = "Frequency", ## y axis label
     main = "Global Active Power") ## title

## Print to png
png("plot1.png", width = 480, height = 480)
hist(dat2$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()
