test_that("confirmar un código de comuna", {
  expect_true(
    is_codigo_comuna(1101)
  )
})

test_that("confirmar un código de comuna cuando no es numérico y es inválido", {
  expect_false(
    is_codigo_comuna("1234")
  )
}) |>
  suppressMessages()

test_that("confirmar un código de comuna cuando no es numérico pero es válido", {
  expect_true(
    is_codigo_comuna("1101")
  )
}) |>
  suppressMessages()
