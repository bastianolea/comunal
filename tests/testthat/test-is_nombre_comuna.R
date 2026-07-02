test_that("confirmar si un nombre de comuna es válido", {
  expect_true(
    territorial::is_nombre_comuna("Panguipulli")
  )
})

test_that("confirmar si más de un nombre de comuna son válidos", {
  expect_equal(
    territorial::is_nombre_comuna(c("Panguipulli", "Mapache", "La Florida")),
    c(TRUE, FALSE, TRUE)
  )
})

test_that("probar error al confirmar nombre de comuna", {
  expect_error(
    territorial::is_nombre_comuna(1234)
  )
})

test_that("confirmar si un nombre de comuna mal escrito es válido", {
  expect_false(
    territorial::is_nombre_comuna("Panguipully", intentar = TRUE)
  )
}) |>
  suppressMessages()

test_that("confirmar si un nombre de comuna muy mal escrito es válido", {
  expect_false(
    territorial::is_nombre_comuna("Mapachape", intentar = TRUE)
  )
}) |>
  suppressMessages()
