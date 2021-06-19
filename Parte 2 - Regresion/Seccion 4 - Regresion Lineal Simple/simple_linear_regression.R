# Regresión Lineal Simple

# Plantilla para el Pre Procesado de Datos
# Importar el dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

# Dividir los datos en conjunto de entrenamiento y conjunto de test // video 40
# install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3) # Queremos 20 de 30, en el training_set
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

# Escalado de valores // En este caso no es necesario
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

# Ajustar el modelo de regresión lineal simple con el conjunto de entrenamiento, video 41
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predecir resultados con el conjunto de test, video 42
# Es necesario que el nombre de las columnas se escriban igual que las tenemos en regressor
y_pred = predict(regressor, newdata = testing_set)

# Visualización de los resultados en el conjunto de entrenamiento, video 43
# install.packages("ggplot2")
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = "red") +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo vs Años de Experiencia (Conjunto de Entrenamiento)") +
  xlab("Años de Experiencia") +
  ylab("Sueldo (en $)")

# Visualización de los resultados en el conjunto de testing, video 43
ggplot() +
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             colour = "red") +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo vs Años de Experiencia (Conjunto de Testing)") +
  xlab("Años de Experiencia") +
  ylab("Sueldo (en $)")

