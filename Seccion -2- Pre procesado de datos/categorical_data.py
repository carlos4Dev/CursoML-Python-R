# -*- coding: utf-8 -*-
"""
Created on Fri Jun 18 09:59:04 2021

@author: Carlos
"""

# Plantilla de Procesado - Datos Categóricos

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values  # X en mayúscula porque es una matriz
y = dataset.iloc[:, 3].values  # y en minúscula porque es un vector

# Codificar datos categóricos // video 27, código actualizado
from sklearn import preprocessing
le_X = preprocessing.LabelEncoder()
X[:,0] = le_X.fit_transform(X[:,0])

from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer

# Utilizar one hot encoder y crear variables dummy // video 27, código actualizado
ct = ColumnTransformer(
   [('one_hot_encoder', OneHotEncoder(categories='auto'), [0])],  
   remainder='passthrough'                       
)
X = np.array(ct.fit_transform(X), dtype=float)

# Transfromamos los valores Yes y No de Purchased, nuestro vector y
le_y = preprocessing.LabelEncoder()
y = le_y.fit_transform(y)

