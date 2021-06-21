# Regresión Lineal Múltiple

# Importar el dataset // video 60
dataset = read.csv('50_Startups.csv')
#dataset = dataset[, 2:3]

# Codificar las variables categÃ³ricas -->> video 60
dataset$State = factor(dataset$State,
                         levels = c("New York", "California", "Florida"),
                         labels = c(1, 2, 3))

# Dividir los datos en conjunto de entrenamiento y conjunto de test // video 60
# install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8) # Queremos 40 de 50, en el training_set
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

# Escalado de valores // En este caso no es necesario
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

# Ajustar el modelo de Regresión Lineal Múltiple con el Conjunto de Entrenamiento, video 61
regression = lm(formula = Profit ~ .,   # el punto quiere decir todas las variables independientes
                data = training_set)
# Predecir los resultados con el conjunto de testing, video 62
y_pred = predict(regression, newdata = testing_set)

# Construir un modelo óptimo con la Eliminación hacia atrás, video 63
SL = 0.05
regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
                data = dataset)
summary(regression)

regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, 
                data = dataset)
summary(regression)

regression = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, 
                data = dataset)
summary(regression)

regression = lm(formula = Profit ~ R.D.Spend, 
                data = dataset)
summary(regression)

# Eliminación hacia atrás automática
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
dataset = dataset[, c(1,2,3,4,5)]
backwardElimination(training_set, SL)

