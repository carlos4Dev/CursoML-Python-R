# Plantilla de Regresión

# Plantilla para el Pre Procesado de Datos
# Importar el dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3]

# Dividir los datos en conjunto de entrenamiento y conjunto de test
# No es necesario en este caso porque tenemos muy pocos datos
# install.packages("caTools")
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3) # Queremos 20 de 30, en el training_set
# training_set = subset(dataset, split == TRUE)
# testing_set = subset(dataset, split == FALSE)

# Escalado de valores // En este caso no es necesario
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

# Ajustar Modelo de Regresión con el Conjunto de Datos
# Crear nuestra variable de regresión aquí


# Predicción de nuevos resultados con Regresión 
y_pred = predict(regression, newdata = data.frame(Level = 6.5))

# Visualización del modelo de regresión
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = "red") + 
  geom_line(aes(x = x_grid, y = predict(regression, newdata = data.frame(Level = x_grid))),
            color = "blue") +
  ggtitle("Predicción (Modelo de Regresión)") +
  xlab("Nivel del empleado") + 
  ylab("Sueldo (en $)")
