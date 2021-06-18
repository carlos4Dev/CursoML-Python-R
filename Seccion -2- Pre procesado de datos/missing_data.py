# -*- coding: utf-8 -*-
"""
Created on Fri Jun 18 09:59:43 2021

@author: Carlos
"""

# Plantilla de Procesado - Datos faltantes

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values  # X en mayúscula porque es una matriz
y = dataset.iloc[:, 3].values  # y en minúscula porque es un vector

# Tratamiento de los NAs // video 25, tiene diferencias por versión de Python
from sklearn.impute import SimpleImputer

imputer=SimpleImputer(missing_values=np.nan, strategy='mean', fill_value=None, verbose=0, copy=True, add_indicator=False);

imputer.fit(X[:, 1:3]);

X[:, 1:3]=imputer.transform(X[:, 1:3]);