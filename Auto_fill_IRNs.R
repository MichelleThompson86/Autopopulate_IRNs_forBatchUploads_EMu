########################
#Autofill IRNs
########################

##Use the following libraries 
library(jsonlite)
library(dplyr)
library(curl)
library(stringr)

##Set working directory (tells R where to look for your files)
setwd("C:/Users/mthompson/Dropbox/MishiT/Field Museum/Data/EMu_notes")

##Load csv with all IRNs (downloaded from EMu)
IRN <-read.csv("Herp_IRNs.csv") 

##Load csv that you want to add IRNs too
Herps_cat <- read.csv("Herps_cat_test.csv") 

#Join The IRN file with the data file you want to add the IRNs to
combined <-left_join(Herps_cat, IRN,
                    by = c("Genus"="GenusIRN", "Species"="speciesIRN"))

#check the first few rows to see if it looks right
head(combined)

#Download the combined file as a csv file
#once you open the file you can delete the extra  columns.  You could delete these in R too but I kind of like opening the file 
write.csv(combined, "RI31_C2_herps_withIRNs.csv",row.names = FALSE)

