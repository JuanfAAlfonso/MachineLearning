# Title     : TODO
# Objective : TODO
# Created by: felipe
# Created on: 5/07/20

# Se lee el dataset .csv ubicado en el folder Data
DataSet <- read.csv("./Data/Data.csv")
DataSet

# Tratamiento de valores NA o nulos.
DataSet$Age = ifelse(is.na(DataSet$Age),
                     ave(DataSet$Age, FUN = function (x) mean(x, na.rm = TRUE)),
                     DataSet$Age)
DataSet$Salary = ifelse(is.na(DataSet$Salary),
                     ave(DataSet$Salary, FUN = function (x) mean(x, na.rm = TRUE)),
                     DataSet$Salary)

DataSet