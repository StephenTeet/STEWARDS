#R code for reading in folders of multiple data files
#From watersheds for STEWARDS projece
#Written by:  Stephen Teet
#Set working directory
setwd("E:/STEWARDS/OK-Little Washita/2009_2012")
#Set temporary file for list of files in directory
temp = list.files(pattern="*.txt")

#create table by concatenating files listed in temporary file, 
#keeping list as variable (column)
dat <- do.call("rbind", setNames(lapply(temp, read.table, sep="", skip=4, header=TRUE), temp))

#write table of concatenated data as .csv file
write.csv(dat, file = "LW_2009_2012_rn.csv", row.names = TRUE)

#read in new .csv file
df1 <- read.table("LW_2009_2012_rn.csv", header=TRUE, sep=",")

#reformat date/time variables from file list and time column
df1$YYYY <- substr(df1$X,1,4)
df1$MM <- substr(df1$X,5,6)
#reorder table 
df2 <- df1[,c(2,3,43,42,4:41)]

#write table as new datafile
write.csv(df2, file = "LW_2009_2012.csv", row.names = FALSE)
