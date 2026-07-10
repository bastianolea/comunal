# Proyección base 2017
# https://www.ine.gob.cl/estadisticas-por-tema/demografia-y-poblacion/estimaciones-y-proyecciones-de-poblacion
# https://github.com/bastianolea/censo_proyecciones_poblacion

library(dplyr)
library(tidyr)
library(stringr)

proyecciones_0 <- readxl::read_excel(
  "data-raw/estimaciones-y-proyecciones-2002-2035-comunas.xlsx"
)

# limpiar y convertir a formato largo (una observación por fila)
proyecciones_long <- proyecciones_0 |>
  janitor::clean_names() |>
  pivot_longer(
    cols = starts_with("poblacion_"),
    names_to = "año",
    values_to = "poblacion"
  ) |>
  select(
    codigo_comuna = comuna,
    sexo = sexo_1_hombre_2_mujer,
    edad,
    año,
    poblacion
  )

# poblacion por año y comuna
proyecciones_año <- proyecciones_long |>
  group_by(codigo_comuna, año) |>
  summarize(poblacion = sum(poblacion)) |>
  mutate(año = str_extract(año, "\\d{4}") |> as.numeric()) |>
  ungroup()

## revisar
# proyecciones_año |>
#   filter(is_codigo_comuna(codigo_comuna))

# agregar columnas territoriales
poblacion_proyeccion <- proyecciones_año |>
  territorial::contextualizar(codigo_comuna)

usethis::use_data(poblacion_proyeccion, overwrite = TRUE)
