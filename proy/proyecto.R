setwd(choose.dir())
library(data.table)


install.packages("corpcor"); install.packages("GPArotation");
install.packages("psych")



library(corpcor)
library(GPArotation)
library(psych)



data = fread("MiningProcess_Flotation_Plant_Database.csv")
str(data)
data <- apply(data[,2:24], 2, function(x) as.numeric(gsub(",", ".", x)))
(pc.vari <- principal(data[,2:22], nfactors = 5, rotate = "varimax",scores=TRUE))
print.psych(pc.vari, cut = 0.3, sort = TRUE)

plot(pc.vari$values, type = "b")