# -*- coding: utf-8 -*-
"""
Created on Thu Jun 17 15:43:36 2021

@author: Carlos
"""

# Plantilla de Procesado

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values  # X en mayúscula porque es una matriz
y = dataset.iloc[:, 3].values  # y en minúscula porque es un vector


# Dividir el data set en conjunto de entrenamiento y conjunto de testing // video 28
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Escalado de variables // video 29
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""