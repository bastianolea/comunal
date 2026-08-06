test_that("cantidad de comunas correcta", {
  expect_length(
    territorial::comunas(),
    346
  )
})

test_that("comunas que con problemas comunes", {
  expect_false(
    "Los Angeles" %in% comunas()
  )
  expect_true(
    "Los Ángeles" %in% comunas()
  )
})

test_that("comunas que no deberían estar", {
  expect_false(
    any(stringr::str_detect(comunas(), "Navarino"))
  )
})
