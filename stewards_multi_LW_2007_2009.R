
setwd("F:/Desktop/STEWARDS/OK-Little Washita/2007_2009")
temp = list.files(pattern="*.txt")

dat <- do.call("rbind", setNames(lapply(temp, read.table, sep="", skip=4, header=TRUE), temp))

write.csv(dat, file = "LW_2007_2009_rn.csv", row.names = TRUE)

df1 <- read.table("LW_2007_2009_rn.csv", header=TRUE, sep=",")

df1$YYYY <- substr(df1$X,1,4)
df1$MM <- substr(df1$X,5,6)
df2 <- df1[,c(2,3,69,68,4:67)]

write.csv(df2, file = "LW_2007_2009.csv", row.names = FALSE)
