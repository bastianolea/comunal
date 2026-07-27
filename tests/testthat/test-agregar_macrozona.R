test_that("agregar macrozonas", {
  expect_equal(
    agregar_macrozona(c(15, 13, 12), tipo = 1, ordenar = FALSE),
    c("Norte", "Centro", "Austral")
  )
  expect_equal(
    agregar_macrozona(c(15, 13, 12), tipo = 2, ordenar = FALSE),
    c("Norte", "Centro", "Sur")
  )
})

test_that("probar que macrozonas aplican a todas las regiones", {
  expect_all_false(
    agregar_macrozona(1:16, tipo = 1, ordenar = FALSE) |> is.na()
  )
  expect_all_false(
    agregar_macrozona(1:16, tipo = 2, ordenar = FALSE) |> is.na()
  )
  expect_all_false(
    agregar_macrozona(1:16, tipo = 3, ordenar = FALSE) |> is.na()
  )
  expect_all_false(
    agregar_macrozona(1:16, tipo = 4, ordenar = FALSE) |> is.na()
  )
  expect_all_false(
    agregar_macrozona(1:16, tipo = 5, ordenar = FALSE) |> is.na()
  )
})

test_that("macrozonas arrojan error con códigos comunales", {
  expect_error(
    agregar_macrozona(1101, tipo = 1, ordenar = FALSE)
  )
  expect_warning(
    agregar_macrozona("hola", tipo = 1, ordenar = FALSE)
  )
}) |>
  suppressMessages()


test_that(
  "macrozonas ordenadas",
  expect_equal(
    dplyr::tibble(zonas = agregar_macrozona(1:16, tipo = 1)) |>
      dplyr::count(zonas) |>
      dplyr::pull(zonas) |>
      as.character(),
    c("Norte", "Centro", "Sur", "Austral")
  )
)
