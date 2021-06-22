# Cambio de sintaxis para la predicción polinómica en Python 3.7

En Python 3.7+ ha cambiado la forma en la que los datos son definidos. En lugar de ser por defecto data frames ahora son ndarrays y esto provoca que al hacer la predicción en la regresión polinómica, ya no podáis hacerlo con
```python
lin_reg.predict(6.5)
```
ya que el modelo ya no conoce acerca de números. En su lugar hay que construir un ndarray con un solo elemento, el propio número que queréis usar para predecir. Es como crear una matriz 1x1, que a su vez resulta ser un número, pero para ello necesitáis ese doble corchete para arreglar el problema que os surgirá en la próxima clase:
```python
lin_reg.predict([[6.5]])
```