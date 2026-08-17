test_that("reemplazar caracteres", {
  expect_true(
    any(comunas() != reemplazar_texto(comunas()))
  )
})

# territorios |>
#   dplyr::select(nombre_comuna) |>
#   dplyr::mutate(
#     nombre_comuna = reemplazar_texto(nombre_comuna, porcentaje = 0.1)
#   )
