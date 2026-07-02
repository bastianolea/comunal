test_that("convertir nombre de comuna a código de comuna", {
  expect_equal(
    as_codigo_comuna("La Florida"),
    13110
  )
})

test_that("convertir varios nombres de comuna a códigos de comuna", {
  expect_equal(
    as_codigo_comuna(
      c("Mejillones", "Hola", "Iquique", "Perrito")
    ),
    c(2102, NA, 1101, NA)
  )
}) |>
  suppressMessages()

test_that("convertir cualquier cosa a códigos de comuna", {
  expect_equal(
    as_codigo_comuna(
      c("Hola", "Perrito", "Mapache")
    ),
    as.numeric(c(NA, NA, NA))
  )
}) |>
  suppressMessages()


test_that("convertir números a códigos de comuna", {
  expect_error(
    as_codigo_comuna(
      c(1101)
    )
  )
})

test_that("convertir missings a códigos de comuna", {
  expect_equal(
    as_codigo_comuna(
      c(NA, NA, NA)
    ),
    as.numeric(c(NA, NA, NA))
  )
}) |>
  suppressMessages()
