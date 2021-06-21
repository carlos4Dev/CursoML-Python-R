# La función OLS en las nuevas versiones de Python

Si estás utilizando la última versión de Python, te darás cuenta que mi código para OLS no funciona del todo. Esto es porque ahora los objetos que creamos son arrays n-dimensionales, pero la función espera una lista de listas. La solución es bastante sencilla (si te la sabes!)

Antes, utilizábamos como variables independientes

```python
X_opt = X[:, [0,1,2,3,4,5]]
```
siendo esto un ndarray de Python, sin embargo ahora necesitaremos declararlo como:

```python
X_opt = X[:, [0,1,2,3,4,5]].tolist()
```

para que la función OLS siga funcionando. De hecho, en el interior de la función backwardElimination donde creamos un objeto regressor_OLS, con la sintaxis

```python
regressor_OLS = sm.OLS(y, x).fit()
```

ahora la variable independiente deberá ser modificada por

```python
regressor_OLS = sm.OLS(y, x.tolist()).fit()
```