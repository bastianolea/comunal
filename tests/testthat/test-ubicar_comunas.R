test_that("ubicar comunas, más de una", {
  expect_equal(
    ubicar_comunas(c("Cerrillos", "Navidad")),
    c("Metropolitana de Santiago", "Libertador General Bernardo O'Higgins")
  )
})

test_that("ubicar comunas, más de una, con NA", {
  expect_equal(
    ubicar_comunas(c("Cerrillos", "Navidad", NA)),
    c("Metropolitana de Santiago", "Libertador General Bernardo O'Higgins", NA)
  )
})

test_that("ubicar comunas por código de comuna, con NA", {
  expect_equal(
    ubicar_comunas(codigo_comuna = c(1101, 13103, NA)),
    c("Tarapacá", "Metropolitana de Santiago", NA)
  )
})

test_that("ubicar comunas, sin argumentos", {
  expect_error(
    ubicar_comunas()
  )
})
