
# file downloaded from BB and inserted into DF
# Missing content replaced with NA
managers_data <- read.csv("managers.csv", na = "")

# View the structure
str(managers_data)



# Convert Date to a date variable
# It is currently in mm/dd/yy
converted_date <- as.Date(managers_data$Date, "%m/%d/%y")
converted_date

str(converted_date)


#replace the date field in the DF
managers_data$Date <- converted_date
str(managers_data)

#convert age variable to int
managers_data$Age <- as.integer(managers_data$Age)
str(managers_data)


#select records within 15-10-18 and 01-11-18
start_date <- as.Date("2018-10-15")
end_date <- as.Date("2018-11-01")
new_date <- managers_data[
  managers_data$Date >= start_date & 
    managers_data$Date <= end_date,]

new_date

names(managers_data)

# drop attributes (var) from data
# shows where  specific variables names are
include_list <- names(managers_data) %in% c("Q3", "Q4")
include_list

# This data frame only contains Q3 and Q4
new_managers <- managers_data[!(include_list)]
new_managers
str(new_managers)

# Using the subset function 
# to extract all records where  age > 35 or age <24
# only select Q1 - Q4

attach(managers_data)
new_data <- subset(
  managers_data, Age > 35 | Age < 24, 
  select = c(Q1, Q2, Q3, Q4))
new_data
detach(managers_data)

# Select the subset of managers_data
# Where gender = M and age > 25. Only shows record
# from Gender to Q4 inclusive
 gender_data <- subset(
  managers_data, Age > 25 | Gender == 'M', select = Gender:Q4)
gender_data

# Random Sampling
# Sample 3 records from the managers df
my_sample <- managers_data[sample(1:nrow(managers_data), 3, replace = FALSE), ]
my_sample

# can we extract 10 samples?
my_sample <- managers_data[sample(1:nrow(managers_data), 10, replace = TRUE), ]
my_sample


# Sorting data by age
attach(managers_data)
new_data <- managers_data[order(Age),]
new_data


# sort by Gender and then age within each gender
# and store in data frame called sorted_data
sorted_data <- managers_data[order(Gender, Age),]
sorted_data



# write the random sample file
write.csv(my_sample, file = "random sample.csv")










