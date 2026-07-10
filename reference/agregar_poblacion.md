# Agregar población a códigos comunales

Esta función sirve para agregar cifras de población oficiales a comunas
de Chile. Se debe entregar un código comunal válido, como los que
aparecen en
[territorios](https://bastianolea.github.io/territorial/reference/territorios.md).
Se debe especificar la base de datos de población a utilizar entre
varias: Proyecciones del Censo (base 2017), Censo 2024 (población
censada). Se puede consultar la población para más de una comuna a la
vez, para un mismo o distintos años.

## Uso

``` r
agregar_poblacion(codigo_comuna, año, base = "proyección")
```

## Argumentos

- codigo_comuna:

  Códigos comunales de las comunas para entregar su población. Ver
  [territorios](https://bastianolea.github.io/territorial/reference/territorios.md)

- año:

  Opcional: si se va a elegir proyecciones de población, año de la
  estimación

- base:

  Base de datos de población a utilizar. Puede ser `proyección`.

## Valor

Vector con cifras de población para la/s comuna/s consultadas.

## Ejemplos

``` r
# varios años para una comuna
agregar_poblacion(codigo_comuna = 1101, año = 2020:2026)
#> [1] 223463 227127 229072 230595 231962 233228 234407

# varias comunas para un año
agregar_poblacion(codigo_comuna = c(1101, 1107, 1401, 1402, 1403), año = 2026)
#> [1] 234407 149416  19198   1365   1534

# crear variable población para una tabla de datos
territorial::territorios |>
  dplyr::mutate(poblacion = agregar_poblacion(codigo_comuna, 2026))
#> # A tibble: 346 × 7
#>    codigo_region nombre_region codigo_provincia nombre_provincia codigo_comuna
#>            <dbl> <chr>                    <dbl> <chr>                    <dbl>
#>  1             1 Tarapacá                    11 Iquique                   1101
#>  2             1 Tarapacá                    11 Iquique                   1107
#>  3             1 Tarapacá                    14 Tamarugal                 1401
#>  4             1 Tarapacá                    14 Tamarugal                 1402
#>  5             1 Tarapacá                    14 Tamarugal                 1403
#>  6             1 Tarapacá                    14 Tamarugal                 1404
#>  7             1 Tarapacá                    14 Tamarugal                 1405
#>  8             2 Antofagasta                 21 Antofagasta               2101
#>  9             2 Antofagasta                 21 Antofagasta               2102
#> 10             2 Antofagasta                 21 Antofagasta               2103
#> # ℹ 336 more rows
#> # ℹ 2 more variables: nombre_comuna <chr>, poblacion <dbl>
```
