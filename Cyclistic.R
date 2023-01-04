#Cyclistic case study
#install packages
install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)


#import the csv
April_2020 <- read.csv("202004.csv")
May_2020 <- read.csv("202005.csv")
June_2020 <- read.csv("202006.csv")
July_2020 <- read.csv("202007.csv")
Aug_2020 <- read.csv("202008.csv")
Sep_2020 <- read.csv("202009.csv")
Oct_2020 <- read.csv("202010.csv")
Nov_2020 <- read.csv("202011.csv")
Dec_2020 <- read.csv("202012.csv")
Jan_2021 <- read.csv("202101.csv")
Feb_2021 <- read.csv("202102.csv")
mar_2021 <- read.csv("202103.csv")
Apr_2021 <- read.csv("202104.csv")


#check column names of 2020 and 2021
typeof(colnames(April_2020$end_lat))  #list
typeof(colnames(Dec_2020))   #char
typeof(colnames(Apr_2021))   #char


#bind all rows with char type 
cyclistic_dummy_1 <- bind_rows(April_2020,May_2020,June_2020,July_2020,Aug_2020,Sep_2020,Oct_2020,Nov_2020)

#Can't bind Dec_2020- April 2021 because end station id and start station id is character in 2021

cyclistic_dummy_2 <- mutate(cyclistic_dummy_1, start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))


#data that has character
cyclistic_dummy_3 <- bind_rows(Dec_2020,Jan_2021,Feb_2021,mar_2021)

#combine both the dataset
cyclistic_combined <- bind_rows(cyclistic_dummy_2,cyclistic_dummy_3)
head(cyclistic_combined)

#data cleaning
# find NA's in dataset
sum(is.na(cyclistic_combined))

#drop all NA's
cyclistic_combined <- drop_na(cyclistic_combined)
sum(is.na(cyclistic_combined))    #no NA's





