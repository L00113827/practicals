## Reading the dataset csv file and create a new data frame 
## Question No.1
ufo_data <- read.csv("UFO.csv", na = "")
ufo_data ### to view what's inside the dataset

## Showing the Structure of the data frame
## Question No.2
str(ufo_data)

## Converting date to a date variable
## Question No.3
converted_date <- as.Date(ufo_data$Date, "%m/%d/%y") ### currently in mm/dd/yyyy
converted_date

str(converted_date)

## Updating the data frame and checking for the structure
## Question No.4
ufo_data$Date <- converted_date
str(ufo_data)

ufo_data$Date <- as.Date(ufo_data$Date)
str(ufo_data)

print(Date)

## Using the names() functions to dsiplay the headings of the UFO data
## Question No.5
names(ufo_data)[c(6,7,9)] <- c("DurationSeconds", "DurationHrsMins", "DatePosted")

## Convert Latidude char to latitude numeric
## Question No.6
 
ufo_data$latitude <- as.numeric(ufo_data$latitude)
typeof(ufo_data$latitude)

## mice Library 
## Question No.7
library(mice)
mice(ufo_data)
which(is.na(ufo_data))


## Question No.8
install.packages("dplyr")
library(dplyr)
sorted_ufo_data <- ufo_data %>% arrange(shape, city) %>% select(datetime, city, country, shape)
sorted_ufo_data %>% head(n = 15)

## Question No.9
## Subsetting
subset(ufo_data, country == "gb")
subset(ufo_data, shape == "disk")





## Question No.10
## Writing CSV
write.csv(my_sample, file = "modified_ufo.csv")


