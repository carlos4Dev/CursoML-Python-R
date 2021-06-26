# Dos variables continuas

library(tidyverse)
library(datos)

ggplot(data = diamantes) + 
  geom_point(mapping = aes(x = quilate, y = precio))


ggplot(data = diamantes) +
  geom_bin2d(mapping = aes(x = quilate, y = precio))

pequenio <- diamantes %>%
  filter(quilate < 3)

install.packages("hexbin")
ggplot(data = diamantes) +
  geom_hex(mapping= aes(x = quilate, y = precio))

# Representación de una variable categórica con una variable continúa

ggplot(data = diamantes, mapping = aes(x = quilate, y = precio)) +
  geom_boxplot(mapping = aes(group = cut_width(quilate, 0.1)))

ggplot(data = diamantes, mapping = aes(x = quilate, y = precio)) +
  geom_boxplot(mapping = aes(group = cut_number(quilate, 20)))
