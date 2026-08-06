test_that("agregar_macrozona asigna macrozonas básicas (tipos 1 y 2)", {
  expect_equal(
    agregar_macrozona(c(15, 13, 12), tipo = 1, ordenar = FALSE),
    c("Norte", "Centro", "Austral")
  )
  expect_equal(
    agregar_macrozona(c(15, 13, 12), tipo = 2, ordenar = FALSE),
    c("Norte", "Centro", "Sur")
  )
})

test_that("agregar_macrozona cubre las 16 regiones en cada tipo", {
  for (tipo_n in 1:5) {
    resultado <- agregar_macrozona(1:16, tipo = tipo_n, ordenar = FALSE)
    expect_all_false(is.na(resultado))
  }
})

test_that("agregar_macrozona usa tipo 1 por defecto", {
  expect_equal(
    agregar_macrozona(c(15, 13, 12), ordenar = FALSE),
    agregar_macrozona(c(15, 13, 12), tipo = 1, ordenar = FALSE)
  )
})

test_that("agregar_macrozona ordenar = TRUE devuelve factor con niveles en orden geográfico", {
  resultado <- agregar_macrozona(1:16, tipo = 1, ordenar = TRUE)
  expect_true(is.factor(resultado))
  expect_equal(levels(resultado), c("Norte", "Centro", "Sur", "Austral"))
})

test_that("agregar_macrozona ordenar = FALSE devuelve caracter", {
  resultado <- agregar_macrozona(1:16, tipo = 1, ordenar = FALSE)
  expect_true(is.character(resultado))
})

test_that("agregar_macrozona convierte códigos en formato caracter, con alerta", {
  expect_message(
    resultado <- agregar_macrozona(c("15", "13", "12"), tipo = 1, ordenar = FALSE)
  )
  expect_equal(resultado, c("Norte", "Centro", "Austral"))
})

test_that("agregar_macrozona rechaza códigos comunales (más de 2 dígitos)", {
  expect_error(
    agregar_macrozona(1101, tipo = 1, ordenar = FALSE)
  )
})

test_that("agregar_macrozona arroja error ante códigos de región fuera de rango", {
  expect_error(
    agregar_macrozona(c(0, 17, -1), tipo = 1, ordenar = FALSE)
  )
  expect_error(
    agregar_macrozona(c(15, 13, 99), tipo = 1, ordenar = FALSE)
  )
})

test_that("agregar_macrozona arroja error si el input es una lista", {
  expect_error(
    agregar_macrozona(list(1, 2, 3), tipo = 1, ordenar = FALSE)
  )
})

test_that("agregar_macrozona valida que el largo del resultado calce con el input", {
  resultado <- agregar_macrozona(c(15, 13, 12), tipo = 1, ordenar = FALSE)
  expect_equal(length(resultado), 3)
})
