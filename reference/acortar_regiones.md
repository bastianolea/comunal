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

territorios |>
  ordenar_regiones() |>
  dplyr::mutate(nombre_region_corto = acortar_regiones(nombre_region)) |>
  dplyr::select(nombre_region, nombre_region_corto)
#> # A tibble: 346 × 2
#>    nombre_region      nombre_region_corto
#>    <fct>              <chr>              
#>  1 Arica y Parinacota Arica y Parinacota 
#>  2 Arica y Parinacota Arica y Parinacota 
#>  3 Arica y Parinacota Arica y Parinacota 
#>  4 Arica y Parinacota Arica y Parinacota 
#>  5 Tarapacá           Tarapacá           
#>  6 Tarapacá           Tarapacá           
#>  7 Tarapacá           Tarapacá           
#>  8 Tarapacá           Tarapacá           
#>  9 Tarapacá           Tarapacá           
#> 10 Tarapacá           Tarapacá           
#> # ℹ 336 more rows
```
