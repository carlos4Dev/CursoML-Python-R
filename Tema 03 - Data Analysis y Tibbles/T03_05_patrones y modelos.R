# Patrones y modelos

library(tidyverse)

# Aquí se puede ver los patrones de las erupciones y el tiempo
# Se pueden ver dos patrones diferenciados en el gráfico (dos agrupaciones)

ggplot(data = faithful) +
  geom_point(mapping = aes(x = eruptions, y = waiting))

# Modelo en el que se predecirá el precio a partir de la variable quilates
# después calculará los residuales y veremos el patrón de comportamiento

library(modelr)

mod <- lm(log(precio) ~ log(quilate), data = diamantes)

diamantes2 <- diamantes %>%
  add_residuals(mod) %>%
  mutate(resid = exp(resid))

ggplot(data = diamantes2) + 
  geom_point(mapping = aes(x = quilate, y = resid))


ggplot(data = diamantes2) +
  geom_boxplot(mapping = aes(x = corte, y = resid))