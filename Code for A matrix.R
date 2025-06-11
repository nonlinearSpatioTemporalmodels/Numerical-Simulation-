# Clear workspace
install.packages(c("dplyr", "MASS", "readxl", "writexl", "dbplyr", "tidyverse", 
                   "magrittr", "reshape", "lmtest", "sandwich", "doBy", 
                   "estimatr", "corrplot", "orcutt", "stargazer", 
                   "huxtable", "Matrix", "lfe", "matlib", "expm"))
rm(list=ls())
library(dplyr)
library(MASS)
library(readxl)
library(writexl)
library(dbplyr)
library(tidyverse)
library(magrittr)
library(reshape)
library(lmtest)
library(sandwich)
library(doBy)
library(estimatr)
library(corrplot)
library(orcutt)
library(stargazer)
library(huxtable)
library(Matrix)
library(lfe)
library(matlib)
library(expm)

memory.limit(size = XXXX)  # Set the maximum memory in MB (XXXX) that R can use.

memory.size(max = XXXX)    # Set the maximum memory in MB (XXXX) that R can use.

options(max.print = 1000000)



# parmters of the model

rho <- 0.0611
gamma <- sum(-0.1318, 0.06409,-0.0043,-0.02907)
lambdav <- 0.0291
lambday=0.3035
n <- nrow(W1)
Id <- diag(n)
r<- 0.3718


#create identity ( 2250 0n 2250)
Id <- diag(n)



# open w matrix 

# Read the first sheet from the Excel file as numeric
W1 <- read_excel("C:/Users/Administrator/Downloads/W_mobi_2250_2 (1) (2).xlsx", sheet = 1)
class(W1)
dim(W1)
matrix_data <- data.matrix(W1)


#Create matrix A

A <- solve(Id - rho*W1)




## Make the matrix W symmetric 

for (i in 1:nrow(F)) {
  for (j in i:ncol(F)) {
    if (F[i, j] != F[j, i]) {
      avg_value <- (F[i, j] + F[j, i]) / 2
      F[i, j] <- avg_value
      F[j, i] <- avg_value
    }
  }
}
