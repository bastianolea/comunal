# Acortar nombres de las regiones de Chile

Hay regiones de Chile con nombres extensos, y que en ciertos contextos
requieren de una versión más breve. Esta función procesa el texto de los
nombres de regiones para, por ejemplo, pasar desde "Aysén del General
Carlos Ibáñez del Campo" a "Aysén".

## Uso

``` r
acortar_regiones(nombre_region)
```

## Argumentos

- nombre_region:

  Nombres de regiones, como los que aparecen en
  [`regiones()`](https://bastianolea.github.io/territorial/reference/regiones.md)

## Valor

Vector de texto con nombres de regiones breves.

## Ejemplos

``` r
acortar_regiones("Libertador Gral. Bernardo O'Higgins")
#> [1] "O'Higgins"

territorial::territorios |>
  ordenar_regiones() |>
  dplyr::mutate(nombre_region_corto = acortar_regiones(nombre_region))
#> # A tibble: 346 × 7
#>    codigo_region nombre_region   codigo_provincia nombre_provincia codigo_comuna
#>            <dbl> <fct>                      <dbl> <chr>                    <dbl>
#>  1            15 Arica y Parina…              151 Arica                    15101
#>  2            15 Arica y Parina…              151 Arica                    15102
#>  3            15 Arica y Parina…              152 Parinacota               15201
#>  4            15 Arica y Parina…              152 Parinacota               15202
#>  5             1 Tarapacá                      11 Iquique                   1101
#>  6             1 Tarapacá                      11 Iquique                   1107
#>  7             1 Tarapacá                      14 Tamarugal                 1401
#>  8             1 Tarapacá                      14 Tamarugal                 1402
#>  9             1 Tarapacá                      14 Tamarugal                 1403
#> 10             1 Tarapacá                      14 Tamarugal                 1404
#> # ℹ 336 more rows
#> # ℹ 2 more variables: nombre_comuna <chr>, nombre_region_corto <chr>
```
