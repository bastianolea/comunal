test_that("agregar población proyección a una", {
  expect_equal(
    agregar_poblacion(1101, 2024),
    territorial::poblacion_proyeccion |>
      dplyr::filter(
        codigo_comuna %in% c(1101),
        año %in% c(2024)
      ) |>
      dplyr::pull(poblacion)
  )
})

test_that("agregar población proyección a varias", {
  expect_equal(
    agregar_poblacion(c(1101, 1101, 1101), c(2025, 2026, 2027)),
    territorial::poblacion_proyeccion |>
      dplyr::filter(
        codigo_comuna %in% c(1101),
        año %in% c(2025, 2026, 2027)
      ) |>
      dplyr::pull(poblacion)
  )
})


test_that("agregar población proyección a varias con incorrectos", {
  expect_no_error(
    agregar_poblacion(
      c(1101, 1101, 1101, 000, 1101, 2102, 8202),
      c(2025, 2028, 2026, 2025, 2004, 2013, 2020)
    ) |>
      suppressWarnings()
  )
})

test_that("agregar población proyección a varias con missing", {
  expect_no_error(
    agregar_poblacion(
      c(1101, 1101, 1101, NA, 1101, 2102, 8202),
      c(2025, 2028, 2026, 2025, 2004, 2013, 2020)
    ) |>
      suppressWarnings()
  )
})


test_that("agregar población proyección a una misma, en varios años", {
  expect_equal(
    agregar_poblacion(
      c(1101),
      c(2020:2026)
    ),
    territorial::poblacion_proyeccion |>
      dplyr::filter(codigo_comuna == 1101, año %in% c(2020:2026)) |>
      dplyr::pull(poblacion)
  )
})

test_that("agregar población proyección a varias comunas, en un año", {
  expect_equal(
    agregar_poblacion(
      c(1101, 1107, 1401, 1402, 1403),
      c(2026)
    ),
    territorial::poblacion_proyeccion |>
      dplyr::filter(
        codigo_comuna %in% c(1101, 1107, 1401, 1402, 1403),
        año == 2026
      ) |>
      dplyr::pull(poblacion)
  )
})

test_that("agregar población proyección a tabla de todas las comunas, salida sin missing", {
  expect_equal(
    territorial::territorios |>
      dplyr::mutate(poblacion = agregar_poblacion(codigo_comuna, 2026)) |>
      dplyr::filter(is.na(poblacion)) |>
      nrow(),
    0
  )
})
