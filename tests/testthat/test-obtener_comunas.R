test_that(
  "obtener comunas con resultado correcto",
  expect_equal(
    obtener_comunas(nombre_region = "Tarapacá"),
    c(
      "Iquique",
      "Alto Hospicio",
      "Pozo Almonte",
      "Camiña",
      "Colchane",
      "Huara",
      "Pica"
    )
  )
) |>
  suppressMessages()

test_that(
  "obtener comunas con resultado correcto, sin nombrar argumento",
  expect_equal(
    obtener_comunas("Tarapacá"),
    c(
      "Iquique",
      "Alto Hospicio",
      "Pozo Almonte",
      "Camiña",
      "Colchane",
      "Huara",
      "Pica"
    )
  )
) |>
  suppressMessages()

test_that(
  "obtener comunas con resultado correcto por código",
  expect_equal(
    obtener_comunas(codigo_region = 15),
    c("Arica", "Camarones", "Putre", "General Lagos")
  )
) |>
  suppressMessages()

test_that(
  "obtener comunas con resultado correcto con más de un código",
  expect_equal(
    obtener_comunas(codigo_region = c(15, 1)),
    c(
      "Iquique",
      "Alto Hospicio",
      "Pozo Almonte",
      "Camiña",
      "Colchane",
      "Huara",
      "Pica",
      "Arica",
      "Camarones",
      "Putre",
      "General Lagos"
    )
  )
) |>
  suppressMessages()

test_that(
  "obtener comunas tira error si se piden ambos",
  expect_error(
    obtener_comunas(nombre_region = "Arica y Parinacota", codigo_region = 15)
  )
)

test_that(
  "obtener comunas tira error para región incorrecta",
  expect_error(
    obtener_comunas(nombre_region = "Arica")
  )
)

test_that(
  "obtener comunas tira error si está vacía",
  expect_error(
    obtener_comunas()
  )
)
