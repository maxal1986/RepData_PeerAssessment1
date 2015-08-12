library(dplyr)
library(ggplot2)

data_types <- c("numeric", "Date", "numeric")
data_file <- unzip("RepData_PeerAssessment1/activity.zip")
data <- read.csv(data_file, colClasses = data_types)
unlink(data_file)

data <- data[!is.na(data$steps),]

mean_dates <- summarise(group_by(data, date), mean_per_day = mean(steps))
sum_dates <- summarise(group_by(data, date), total_per_day = sum(steps))
median_dates <- summarise(group_by(data, date), median_per_day = median(steps))

qplot(x = sum_dates$date, y = sum_dates$total_per_day, geom = "bar", stat = "identity")
qplot(x = mean_dates$date, y = mean_dates$mean_per_day, geom = "bar", stat = "identity")
qplot(x = median_dates$date, y = median_dates$median_per_day, geom = "bar", stat = "identity")

mean_interval <- summarise(group_by(data, interval), mean_per_interval = mean(steps))
qplot(x = mean_interval$interval, y = mean_interval$mean_per_interval, stat = "identity")+geom_line()