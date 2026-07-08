test_that("convertir códigos de región a nombres de región", {
  expect_equal(
    as_nombre_region(
      c(1, 3, 9999999, 5)
    ),
    c("Tarapacá", "Atacama", NA, "Valparaíso")
    )
})


test_that("convertir NAs a nombres de región", {
  expect_equal(
    as_nombre_region(
      c(NA, 1)
    ),
    c(NA, "Tarapacá")
  )
})


test_that("convertir texto a nombres de región cuando debería ser numérico", {
  expect_error(
    as_nombre_region(
      c("hola", "basty", NA)
    )
  )
})
