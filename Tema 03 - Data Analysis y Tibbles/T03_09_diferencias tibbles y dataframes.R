# Diferencias entre tibbles y dataframes

library(tidyverse)
library(datos)

# los tibbles se muestran por consola, sin sobrepasar el ancho y con un máximo de elementos por pantalla

tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)

# Aquí indicamos que por consola muestre 15 elementos 
datos::vuelos %>%
  print(n=15, width= Inf)

# Mostrar ayuda de tibble

package?tibble

# Mostrar vuelos del paquete datos como dataset en una pestaña de RStudio, no por consola

datos::vuelos %>%
  view()

df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

# Ocupando el nombre con simbolo dolar muestra los valores de la variable

df$x

# con doble corchete se obtiene el mismo resultado, con " " el nombre

df[["x"]]

# o por la posición (En R se empieza por 1), aquí se mostrarían los valores de y


df[[2]]

# también se puede con pipeline, el punto y simbolo de dólar

df %>% .$x

# los tibbles son más estricos y emiten advertencia si se intenta acceder
# a una columna que no existe

df[[3]] # No hay 3 columnas

