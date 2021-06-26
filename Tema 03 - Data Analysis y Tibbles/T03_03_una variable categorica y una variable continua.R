library(tidyverse)
library(datos)

# como varía el precio dependiendo de la calidad de un diamante

ggplot(data = diamantes, mapping = aes(x = precio)) + 
  geom_freqpoly(mapping = aes(colour = corte), binwidth = 500)

ggplot(data = diamantes) + 
  geom_bar(mapping = aes(x = corte))

ggplot(data = diamantes, mapping = aes(x = precio, y = ..density..)) +
  geom_freqpoly(mapping = aes(colour = corte), binwidth = 500)

ggplot(data = diamantes, mapping = aes(x = corte, y = precio)) + 
  geom_boxplot()


# Cómo podemos visualizar la correlación entre dos variables categóricas.
# Miramos cuantas variables categóricas caen en el mismo parte  del "mapa". Ejemplo

ggplot(data = diamonds) + 
  geom_count(mapping = aes(x = cut, y = color))

# Pero también se puede hacer un cálculo exacto con dplyr, ¿cómo?

diamonds %>%
  count(color, cut) # aquí podemos ver el tamaño de las bolas, más claras que de forma visual

# Podemos también hacerlo con unas estéticas sobre el count que acabamos de hacer:

diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = cut, y = color)) + 
  geom_tile(mapping = aes(fill = n))
