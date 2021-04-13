# Loading the dataset
managers_data <- read.csv("managers.csv")
new_managers_data <- read.csv("MoreData.csv")

# show the structure
str(new_managers_data)


# Show the headers from both dataframes
names(managers_data)
names(new_managers_data)

include_list <- new_managers_data[c("Date", 
  "Country",
  "Gender",
  "Age",
  "Q1","Q2","Q3","Q4","Q5")]
include_list

rbind(managers_data, include_list)

# Create a new "AgeCat" variable in include list
# and the calculate the containing values
attach(include_list)
include_list$AgeCat[Age >= 45] <- "Elder"
include_list$AgeCat[Age >= 26 & Age <= 44] <- "Middle Aged"
include_list$AgeCat[Age <= 25] <- "Young"

include_list

names(managers_data)
modified_managers <- managers_data[2:11]
modified_managers

# Update the date fields on both data frames
# So that they are in the correct format

modified_managers <- as.Date(modified_managers$Date, format = "%m/%d/%y")
str(modified_managers)

include_list <- as.Date(include_list$Date, format = "%m/%d/%y")
str(include_list)

# Combine both dataframes

combined_managers <- rbind(modified_managers,include_list)
str(combined_managers)


# Set AgeCat with ordered factor
