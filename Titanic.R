library(dplyr)
library(tidyr)
titanic_original = read.csv("titanic_original.csv", header = TRUE)
titanic_original %>%
#Port of embarkation
  mutate(embarked = gsub("^$|^ $", "S", x = embarked)) %>%
# Calculate the mean of the Age column and use that value to populate the missing values
  mutate(age = ifelse(grepl("^[0-9]+$", age) == TRUE, age, mean(age,na.rm = TRUE))) %>%
# Lifeboat
  mutate(boat = gsub("^$|^ $", "None", x = boat)) %>%
  #Cabin
  mutate(has_cabin_number = ifelse(grepl("^[A-Z].*[0-9]$", cabin) == TRUE, 1, 0)) %>%
 write.csv(file = "titanic_clean.csv")