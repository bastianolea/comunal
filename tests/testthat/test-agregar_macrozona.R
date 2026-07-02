test_that("agregar macrozonas tipo 1", {
  expect_equal(
    agregar_macrozona(c(15, 13, 12), tipo = 1),
    c("Norte", "Centro", "Austral")
  )
})

test_that("agregar macrozonas tipo 2", {
  expect_equal(
    agregar_macrozona(c(15, 13, 12), tipo = 2),
    c("Norte", "Centro", "Sur")
  )
})


test_that("probar que macrozonas aplicana a todas las regiones", {
  expect_all_false(
    agregar_macrozona(1:16, tipo = 1) |> is.na()
  )
  expect_all_false(
    agregar_macrozona(1:16, tipo = 2) |> is.na()
  )
  expect_all_false(
    agregar_macrozona(1:16, tipo = 3) |> is.na()
  )
  expect_all_false(
    agregar_macrozona(1:16, tipo = 4) |> is.na()
  )
})

test_that("macrozonas arrojan error con códigos comunales", {
  expect_error(
    agregar_macrozona(1101, tipo = 1)
  )
})

test_that("macrozonas arrojan error con códigos comunales", {
  expect_warning(
    agregar_macrozona("hola", tipo = 1)
  )
}) |>
  suppressMessages()
