setwd("C:\\Users\\simon\\Desktop\\HKUST\\Fall 2020\\SOSC 5500 Computational Social Science\\Group Project")

#Run packages
library(haven)
library(tidyverse)
library(dplyr)
library(stringr)
library(quanteda)

# Read dataset
df <- read.csv("C:\\Users\\simon\\Desktop\\HKUST\\Fall 2020\\SOSC 5500 Computational Social Science\\Group Project\\data scientist job postings.csv")

# Remove irrelevant columns
df <- df[ , -1, -2]
df <- df[ , -1, -3]
df <- df[ , -2, -4]
df <- df[ , -3:-9]
df <- df[ , -4:-12]

#Rename columns
colnames(dfc)
names(dfc)[names(dfc) == "job_title"] <- "JT"
names(dfc)[names(dfc) == "company_name"] <- "CN"
names(dfc)[names(dfc) == "job_description"] <- "JD"

#Save as new dataset
write.csv(df, "C:\\Users\\simon\\Desktop\\HKUST\\Fall 2020\\SOSC 5500 Computational Social Science\\Group Project\\DS post.csv", row.names = FALSE)

#Load new dataset
dfc <- read.csv("C:\\Users\\simon\\Desktop\\HKUST\\Fall 2020\\SOSC 5500 Computational Social Science\\Group Project\\DS post.csv")

#Categorize similar words into one word
dfc$JT <- gsub('Sr.', 'Senior', dfc$JT, ignore.case = TRUE)
dfc$JT <- gsub('Sr', 'Senior', dfc$JT, ignore.case = TRUE)
dfc$JT <- gsub('SeniorData', 'Senior', dfc$JT, ignore.case = TRUE)
dfc$JT <- gsub('lead', 'Lead', dfc$JT, ignore.case = TRUE)
dfc$JT <- gsub('manager', 'Manager', dfc$JT, ignore.case = TRUE)
dfc$JT <- gsub('mgr', 'Manager', dfc$JT, ignore.case = TRUE)
dfc$JT <- gsub('V.P', 'VP', dfc$JT, ignore.case = TRUE)
dfc$JT <- gsub('principal', 'Principal', dfc$JT, ignore.case = TRUE)

str_detect(dfc$JT, "SeniorData", negate = FALSE)
summary(str_detect(dfc$JT, "associate", negate = FALSE))

# Categorize entry level DS posts as 0 and higher level DS posts as 1
dfc$JT <- ifelse(grepl("Senior|Lead|Manager|VP|Principal|Chief|Associate", dfc$JT), "1", "0")

#Save
write.csv(dfc, "C:\\Users\\simon\\Desktop\\HKUST\\Fall 2020\\SOSC 5500 Computational Social Science\\Group Project\\DS post.csv", row.names = FALSE)



