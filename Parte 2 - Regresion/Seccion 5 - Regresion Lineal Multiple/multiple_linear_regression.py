# -*- coding: utf-8 -*-
"""
Created on Sat Jun 19 14:57:52 2021

@author: Carlos
"""

# Regresión Lineal Múltiple // Video 52

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set // video 53
dataset = pd.read_csv('50_Startups.csv')
X = dataset.iloc[:, :-1].values  # X en mayúscula porque es una matriz
y = dataset.iloc[:, 4].values  # y en minúscula porque es un vector

# Codificar datos categóricos // video 53
from sklearn import preprocessing
le_X = preprocessing.LabelEncoder()
X[:,3] = le_X.fit_transform(X[:,3])

from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer

# Utilizar one hot encoder y crear variables dummy // video 53
ct = ColumnTransformer(
   [('one_hot_encoder', OneHotEncoder(categories='auto'), [3])],  
   remainder='passthrough'                       
)
X = np.array(ct.fit_transform(X), dtype=float)

# Evitar la trampa de las variables ficticias // video 53
X = X[:, 1:] # todas las filas y quitamos la columna 0

# Dividir el data set en conjunto de entrenamiento y conjunto de testing // video 53
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Escalado de variables // No es necesario en este ejercicio
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""

# Ajustar el modelo de Regresión lineal múltiple con el conjunto de entrenamiento // video 54
from sklearn.linear_model import LinearRegression
regression = LinearRegression()
regression.fit(X_train, y_train)

# Predicción de los resultados en el conjunto de testing // video 55
y_pred = regression.predict(X_test)

# Construir el modelo óptimo de RLM utilizando la eliminación hacia atrás, video 56
import statsmodels.api as sm
#Añadimos al principio una columna de 50 filas con el valor 1
X = np.append(arr = np.ones((50,1)).astype(int), values = X, axis = 1)
# video 57 
SL = 0.05  # SL nivel de significación, Paso 1 Eliminación hacia atrás

X_opt = X[:, [0, 1, 2, 3, 4, 5]].tolist() # función OLS Ordinary List Square (Mínimos cuadrados ordinarios)
regression_OLS = sm.OLS(endog = y, exog = X_opt).fit() # Paso 2
regression_OLS.summary() # Paso 3, Obtenemos el resumen de los datos por consola, allí podremos ver p-valor

# Paso 4, en este caso hemos eliminado la columuna 2 por tener el p-valor más alto
X_opt = X[:, [0, 1, 3, 4, 5]].tolist() 
regression_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regression_OLS.summary()

# video 58, es una implementación clásica de la eliminación hacia atrás

# Paso 4, en este caso hemos eliminado la columuna 1 por tener el p-valor más alto
X_opt = X[:, [0, 3, 4, 5]].tolist()
regression_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regression_OLS.summary()

# Paso 4, en este caso hemos eliminado la columuna 4 por tener el p-valor más alto
X_opt = X[:, [0, 3, 5]].tolist()
regression_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regression_OLS.summary()

# Paso 4, en este caso hemos eliminado la columuna 5 por tener el p-valor más alto
X_opt = X[:, [0, 3]].tolist()
regression_OLS = sm.OLS(endog = y, exog = X_opt).fit()
regression_OLS.summary()

# El resultado es un modelo de Regresión Lineal Simple
# No se suele llegar a esto porque se tienen en cuenta otros índices, no sólo el p-valor

# Esto se puede hacer de forma automática
# Lección 59

# Eliminación hacia atrás utilizando solamente p-valores
# import statsmodels.api as sm
def backwardElimination(x, sl):
    numVars = len(x[0])
    for i in range(0, numVars):
        regressor_OLS = sm.OLS(y, x.tolist()).fit()
        maxVar = max(regressor_OLS.pvalues).astype(float)
        if maxVar > sl:
            for j in range(0, numVars - i):
                if (regressor_OLS.pvalues[j].astype(float) == maxVar):
                    x = np.delete(x, j, 1)
    regressor_OLS.summary()
    return x

SL = 0.05
X_opt = X[:, [0, 1, 2, 3, 4, 5]]
X_Modeled = backwardElimination(X_opt, SL)

# Eliminación hacia atrás utilizando  p-valores y el valor de  R Cuadrado Ajustado:
# import statsmodels.api as sm
def backwardElimination2(x, SL):    
    numVars = len(x[0])    
    temp = np.zeros((50,6)).astype(int)    
    for i in range(0, numVars):        
        regressor_OLS = sm.OLS(y, x.tolist()).fit()        
        maxVar = max(regressor_OLS.pvalues).astype(float)        
        adjR_before = regressor_OLS.rsquared_adj.astype(float)        
        if maxVar > SL:            
            for j in range(0, numVars - i):                
                if (regressor_OLS.pvalues[j].astype(float) == maxVar):                    
                    x_temp = x
                    x = np.delete(x, j, 1)                    
                    tmp_regressor = sm.OLS(y, x.tolist()).fit()                    
                    adjR_after = tmp_regressor.rsquared_adj.astype(float)                    
                    if (adjR_before >= adjR_after):                        
                        
                        print (regressor_OLS.summary())                        
                        return x_temp                    
                    else:                        
                        continue    
    regressor_OLS.summary()    
    return x 
 
SL = 0.05
X_opt = X[:, [0, 1, 2, 3, 4, 5]]
X_Modeled = backwardElimination2(X_opt, SL)