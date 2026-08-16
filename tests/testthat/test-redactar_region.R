test_that("redacción de regiones funciona", {
  expect_equal(
    redactar_region(c("Maule", "Ñuble")),
    c("Región del Maule", "Región de Ñuble")
  )
})

test_that("redacción de regiones numéricas", {
  expect_error(
    redactar_region(c(15, 1))
  )
})
