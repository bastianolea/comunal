test_that("eliminar caracteres", {
  expect_true(
    any(comunas() != eliminar_caracteres(comunas()))
  )
})

# territorios |>
#   dplyr::select(nombre_comuna) |>
#   dplyr::mutate(
#     nombre_comuna = eliminar_caracteres(nombre_comuna, porcentaje = 0.1)
#   )
