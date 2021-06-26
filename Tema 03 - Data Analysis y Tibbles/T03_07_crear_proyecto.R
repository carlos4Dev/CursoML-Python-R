library(tidyverse)

library(datos)

ggplot(diamantes, aes(quilate, precio)) +
  geom_hex()

ggsave("diamantes.pdf")

write_csv(diamantes, "diamantes.csv")