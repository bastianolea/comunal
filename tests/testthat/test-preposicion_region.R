test_that("artículos de región funciona", {
  expect_equal(
    preposicion_region(
      c("Ñuble", "Biobío", "Metropolitana", "Santiago")
    ),
    c("de", "del", "", "de")
  )
})


test_that("artículos de región funciona con nombres no estándar", {
  expect_equal(
    preposicion_region(
      c("O'Higgins", "Araucanía", "Lagos")
    ),
    c("de", "de la", "de los")
  )
})
