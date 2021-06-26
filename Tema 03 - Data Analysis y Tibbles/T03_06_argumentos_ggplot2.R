library(tidyverse)

# Estructura utilizada hasta el momento

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_freqpoly(binwidth = 0.25)

# Otra forma de utilizar los argumentos en ggplot2
# se puede obviar data = en el primer argumento
# Se puede obviar mapping = en el segundo argumento
# Los dos primeros argumentos de aes() son x =  e y = , que también se pueden obviar

ggplot(faithful, aes(eruptions)) +
  geom_freqpoly(binwidth = 0.25)

diamonds %>%
  count(cut, clarity) %>%
  ggplot(aes(clarity, cut, fill = n)) + 
  geom_tile()

