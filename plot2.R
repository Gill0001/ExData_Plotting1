# 1. Set default directory for reading data
setwd("C:/Users/Office/Documents/Coursera/Exploratory Data Analysis/ExData_Plotting1")

# 2. Check if the data has been downloaded into default directory and if not download it
if (!file.exists("household_power_consumption.txt")) {
     install.packages("downloader")
     library(downloader)
     fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     download(fileUrl, dest="dataset.zip", mode="wb")
     unzip ("dataset.zip")
     dateDownloaded <- date()
}

# 3. Read the data into a dataframe
#    create a subset of the data for dates 2007-02-01 to 2007-02-02
#    and set the Date and Time variables to Date and Time respectively
powerConsData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

workingDataset <- powerConsData[powerConsData$Date %in% c("1/2/2007", "2/2/2007"),]
workingDataset$Date <- factor(workingDataset$Date)

workingDataset$Time <- strptime(paste(workingDataset$Date,workingDataset$Time), format = "%d/%m/%Y %H:%M:%S")
workingDataset$Date <- as.Date(workingDataset$Date, format = "%d/%m/%Y")

# 4. Plot data and save to PNG file
png(file="plot2.png",width=480,height=480)
plot(workingDataset$Time, workingDataset$Global_active_power,typ='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

