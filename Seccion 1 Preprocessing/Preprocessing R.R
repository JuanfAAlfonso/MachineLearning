# Title     : TODO
# Objective : TODO
# Created by: felipe
# Created on: 5/07/20

# Se lee el dataset .csv ubicado en el folder Data
DataSet <- read.csv("./Data/Data.csv")

# Tratamiento de valores NA o nulos.
DataSet$Age = ifelse(is.na(DataSet$Age),
                     ave(DataSet$Age, FUN = function (x) mean(x, na.rm = TRUE)),
                     DataSet$Age)
DataSet$Salary = ifelse(is.na(DataSet$Salary),
                     ave(DataSet$Salary, FUN = function (x) mean(x, na.rm = TRUE)),
                     DataSet$Salary)

# Tratamiento de variables categoricas
DataSet$Country = factor(DataSet$Country,
                         levels = c("France", "Spain", "Germany"),
                         labels = c(1, 2, 3))
DataSet$Purchased = factor(DataSet$Purchased,
                         levels = c("Yes", "No"),
                         labels = c(1, 0))

# Dividir los datos en entrenamiento y test
# True -> Hace parte de entrenamiento
# False -> Hace parte de testing
library(caTools)
set.seed(20)
split = sample.split(DataSet$Purchased, SplitRatio = 0.8)
TrainingSet = subset(DataSet, split==TRUE)
TestingSet = subset(DataSet, split==FALSE)

# Escalado de variables
TrainingSet[,2:3] = scale(TrainingSet[,2:3])
TestingSet[,2:3] = scale(TestingSet[,2:3])