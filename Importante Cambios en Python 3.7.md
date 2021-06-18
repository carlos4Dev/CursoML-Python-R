#IMPORTANTE: Cambios en Python 3.7
Para codificar datos categóricos y algunas transformaciones adicionales que aprenderéis en las próximas clases, en caso de que utilicéis la última versión de Python, veréis que ha cambiado un poco la librería y su sintaxis.

Aquí te dejo las nuevas versiones del código:

**Para codificar datos categóricos ahora se utiliza:**
from sklearn import preprocessing
le_X = preprocessing.LabelEncoder()
X[:,0] = le_X.fit_transform(X[:,0])


**Para utilizar one hot encoder y crear variables dummy**, ya no hace falta utilizar previamente la función label enconder, si no que para aplicar la dummyficación a la primera columna y dejar el resto de columnas como están, lo podemos hacer con:

from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
 
ct = ColumnTransformer(
   [('one_hot_encoder', OneHotEncoder(categories='auto'), [0])],  
   remainder='passthrough'                       
)
X = np.array(ct.fit_transform(X), dtype=float)


**Para hacer reemplazo de valores por la media, ahora se utiliza:**
from sklearn.impute import SimpleImputer
imputer = SimpleImputer(missing_values=np.nan, strategy='mean', fill_value=None, verbose=0, copy=True, add_indicator=False)
imputer = imputer.fit(X[:, 1:3])
X[:, 1:3] = imputer.transform(X[:, 1:3])

**Cambios de validación cruzada y training/testing**
La función sklearn.grid_search ha cambiado y ya no depende de ese paquete. Ahora debe cargarse con:

from sklearn.model_selection import GridSearchCV

**La función train_test_split ya no forma parte de sklearn.cross_validation**, ahora debe cargarse desde el paquete:

sklearn.model_selection

**Cambios en Stats Models**

**La carga de la librería import statsmodels.formula.api as sm** ahora es con:

import statsmodels.api as sm
 
**Cambios en las predicciones**

Ya no se pueden hacer predicciones directamente con valores, si no que deben ser arrays bidimensionales, de modo que lo que antes era 

y_pred = regression.predict(6.5) ahora es 

y_pred = regression.predict([[6.5]]).

**Colores**

La instrucción ListedColormap(('red', 'green'))) os dará una advertencia que no os tiene que preocupar (simplemente en lugar de usar el nombre del color, parece que ahora le gusta más que le demos un array de valores numéricos, aunque acepte también los nombres).

