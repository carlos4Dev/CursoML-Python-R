# Variación

library(tidyverse)
library(datos)

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = corte))

diamantes %>%
  count(corte)

ggplot(data = diamantes) +
  geom_histogram(mapping = aes(x = quilate), binwidth = 0.8)

diamantes %>%
  count(cut_width(quilate,0.8))

pequenio <- diamantes %>%
  filter(quilate < 3)

ggplot(data = pequenio) +
  geom_histogram(mapping = aes(x = quilate), binwidth = 0.1)

ggplot(data = pequenio) +
  geom_freqpoly(mapping = aes(x = quilate, colour = quilate), binwidth = 0.1)

ggplot(data = pequenio, mapping = aes(x = quilate, colour = corte)) +
  geom_freqpoly(binwidth = 0.1)

# valores atípicos

ggplot(data = pequenio, mapping = aes(x = quilate)) +
  geom_histogram(binwidth = 0.01)


ggplot(data = fiel, mapping = aes(x = erupciones)) +
  geom_histogram(binwidth = 0.25)


ggplot(data = diamantes) +
  geom_histogram(mapping = aes(x=y), binwidth = 0.5) + 
  coord_cartesian(ylim = c(0,50))

inusual <- diamantes %>%
  filter(y < 3 | y > 20) %>%
  select(precio, x, y, z) %>%
  arrange(y)

inusual

# valores faltantes

diamantes2 <- diamantes %>%
  filter(between(y,3,20))

diamantes2 <- diamantes %>%
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

ggplot(data = diamantes2, mapping = aes(x = x, y = y)) + 
  geom_point(na.rm = TRUE)

# vamos a comparar el horario de salida programado para los vuelos cancelados
# y los no cancelados utilizando is.na
 
datos::vuelos %>%
  mutate(
    cancelados = is.na(horario_salida),
    hora_programada = salida_programada %/% 100,
    minuto_programado = salida_programada %% 100,
    salida_programada = hora_programada + minuto_programado / 60
  ) %>%
  ggplot(mapping = aes(salida_programada)) +
  geom_freqpoly(mapping = aes(colour = cancelados), binwidth = 1/4)