# -*- coding: utf-8 -*-
"""
Created on Fri Jun 18 16:41:26 2021

@author: Carlos
"""

# Regresión Lineal Simple // video 36

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values  # X en mayúscula porque es una matriz
y = dataset.iloc[:, 1].values  # y en minúscula porque es un vector


# Dividir el data set en conjunto de entrenamiento y conjunto de testing
# test_size ponemos 1/3 porque tenemos 30 datos y queremos 20 para train y 10 para test
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)


# Escalado de variables // En este caso no es necesario
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""

# Crear modelo de Regresión Lineal Simple con el conjunto de entrenamiento // video 37
from sklearn.linear_model import LinearRegression
regression = LinearRegression()
regression.fit(X_train, y_train)

# Predecir el conjunto de test // video 38
y_pred = regression.predict(X_test)

# Visualizar los resultado de entrenamiento // video 39
plt.scatter(X_train, y_train, color = "red")
plt.plot(X_train, regression.predict(X_train), color = "blue")
plt.title("Sueldo vs Años de Experiencia (Conjunto de Entrenamiento)")
plt.xlabel("Años de Experiencia")
plt.ylabel("Sueldo (en $)")
plt.show()

# Visualizar los resultado de test // video 39
plt.scatter(X_test, y_test, color = "red")
plt.plot(X_train, regression.predict(X_train), color = "blue") # La recta de regresión lineal es única, esto se deja igual
plt.title("Sueldo vs Años de Experiencia (Conjunto de Testing)")
plt.xlabel("Años de Experiencia")
plt.ylabel("Sueldo (en $)")
plt.show()
