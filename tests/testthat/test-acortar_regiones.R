test_that("acortar_regiones acorta región O'Higgins", {
  resultado <- acortar_regiones("Libertador Gral. Bernardo O'Higgins")
  expect_equal(resultado, "O'Higgins")
})

test_that("acortar_regiones acorta región Aysén", {
  resultado <- acortar_regiones("Aysén del General Carlos Ibáñez del Campo")
  expect_equal(resultado, "Aysén")
})

test_that("acortar_regiones acorta región Metropolitana", {
  resultado <- acortar_regiones("Región Metropolitana de Santiago")
  expect_equal(resultado, "Región Metropolitana")
})

test_that("acortar_regiones acorta región Magallanes", {
  resultado <- acortar_regiones("Magallanes y de la Antártica Chilena")
  expect_equal(resultado, "Magallanes")
})

test_that("acortar_regiones elimina 'Región de' correctamente", {
  resultado <- acortar_regiones("Región de Arica y Parinacota")
  expect_equal(resultado, "Arica y Parinacota")
})

test_that("acortar_regiones vectoriza correctamente", {
  nombres <- c(
    "Libertador Gral. Bernardo O'Higgins",
    "Aysén del General Carlos Ibáñez del Campo",
    "Región Metropolitana de Santiago"
  )
  resultado <- acortar_regiones(nombres)
  expect_equal(length(resultado), 3)
  expect_equal(resultado[1], "O'Higgins")
  expect_equal(resultado[2], "Aysén")
  expect_equal(resultado[3], "Región Metropolitana")
})

test_that("acortar_regiones maneja regiones sin cambios", {
  nombre <- "Los Lagos"
  resultado <- acortar_regiones(nombre)
  expect_equal(resultado, "Los Lagos")
})

test_that("acortar_regiones lanza error si input es numérico", {
  expect_error(
    acortar_regiones(1),
    "Se necesitan nombres de regiones en tipo caracter!"
  )
})

test_that("acortar_regiones valida longitud del resultado", {
  nombres <- c("Arica y Parinacota", "Tarapacá")
  resultado <- acortar_regiones(nombres)
  expect_equal(length(resultado), length(nombres))
})
