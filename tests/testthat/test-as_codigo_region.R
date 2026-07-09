test_that("convertir nombre de región a código de región", {
  expect_equal(
    as_codigo_region("Tarapacá"),
    1
  )
})

test_that("convertir varios nombres de región a códigos de región", {
  expect_equal(
    as_codigo_region(
      c("Atacama", "Hola", "Valparaíso", "Perrito")
    ),
    c(3, NA, 5, NA)
  )
}) |>
  suppressMessages()

test_that("convertir varios nombres de región a códigos de región", {
  expect_equal(
    as_codigo_region(
      c("atacama", "TARAPACÁ", "Maule", "ohiggins")
    ),
    c(3, 1, 7, 6)
  )
}) |>
  suppressMessages()

test_that("convertir cualquier cosa a códigos de región", {
  expect_equal(
    as_codigo_region(
      c("Hola", "Perrito", "Mapache")
    ),
    as.numeric(c(NA, NA, NA))
  )
}) |>
  suppressMessages()

test_that("convertir números a códigos de región", {
  expect_error(
    as_codigo_region(
      c(1, 3)
    )
  )
})

test_that("convertir missings a códigos de región", {
  expect_equal(
    as_codigo_region(
      c(NA, NA, NA)
    ),
    as.numeric(c(NA, NA, NA))
  )
}) |>
  suppressMessages()
