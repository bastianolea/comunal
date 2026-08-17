test_that("insertar caracteres", {
  expect_true(
    any(comunas() != insertar_texto(comunas()))
  )
})

test_that("insertar caracteres alarga el texto", {
  x <- c("hola", "chile")
  esperado <- nchar(x) + floor(nchar(x) * 0.5)
  expect_equal(
    nchar(insertar_texto(x, porcentaje = 0.5)),
    esperado
  )
})

test_that("insertar caracteres preserva NA", {
  res <- insertar_texto(c(NA, "abc"), porcentaje = 1)
  expect_true(is.na(res[1]))
  expect_equal(nchar(res[2]), 6)
})
