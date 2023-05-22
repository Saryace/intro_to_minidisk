
# Librerias ---------------------------------------------------------------

library(tidyverse)
library(fs)

# Cargar datos ------------------------------------------------------------

info_suelos <- read_csv("data_suelos/info_suelos.csv")

suelo_a <- read_csv("data/suelo_a.csv")

# Iteramos  ---------------------------------------------------------------

csv_datos <- dir_ls("data", regexp = "\\.csv$")
csv_datos


datos_infiltracion <- 
csv_datos %>% 
  map_dfr(read_csv, .id = "source") %>% 
  mutate(source = str_sub(source, start = 12, end = -5)) %>% 
  rename(suelo = source)

