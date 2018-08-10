#R code for reading in folders of multiple 5 minute data files
#From watersheds for STEWARDS projece
#Written by:  Stephen Teet

#Set working directory
setwd("E:/STEWARDS/OK-FortCobb/FC17")

#Set temporary file for list of files in directory
temp = list.files(pattern="*.txt")

#create table by concatenating files listed in temporary file, 
#keeping list as variable (column)
df1 <- do.call("rbind", setNames(lapply(temp, read.table, sep="", skip=4, header=TRUE), temp))

#write table of concatenated data as .csv file
write.csv(df1, file = "FC_2017_rn.csv", row.names = TRUE)

#read in new .csv file
df1 <- read.table("FC_2017_rn.csv", header=TRUE, sep=",")

#reformat date variables (DD, MM, YYYY) from file list 
df1$YYYY <- substr(df1$X,1,4)
df1$MM <- substr(df1$X,5,6)
df1$DD <- substr(df1$X,7,8)

#reorder table 
df2 <- df1[,c(2,3,4,23,22,21,5:20)]

#optional code for getting rid of NADA STID rows for years when sites are taken down/replaced
df2 <- df2[!(df2$STID=="NADA"),]

#write table as new datafile
write.csv(df2, file = "FC_2017.csv", row.names = FALSE)
