test_that("eliminar caracteres", {
  expect_true(
    any(comunas() != eliminar_texto(comunas()))
  )
})

# territorios |>
#   dplyr::select(nombre_comuna) |>
#   dplyr::mutate(
#     nombre_comuna = eliminar_texto(nombre_comuna, porcentaje = 0.1)
#   )
