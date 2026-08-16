test_that("reemplazar caracteres", {
  expect_true(
    any(comunas() != reemplazar_caracteres(comunas()))
  )
})

# territorios |>
#   dplyr::select(nombre_comuna) |>
#   dplyr::mutate(
#     nombre_comuna = reemplazar_caracteres(nombre_comuna, porcentaje = 0.1)
#   )
