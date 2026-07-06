# Agregar macrozona del país a regiones

Las macrozonas son agrupaciones de regiones de Chile que permiten
entender el territorio en base a grupos geográficos. Para un vector de
códigos de regiones (del 1 al 16), entrega las macrozonas
correspondientes a cada región.

## Uso

``` r
agregar_macrozona(codigo_region, tipo = 1, ordenar = TRUE)
```

## Argumentos

- codigo_region:

  Vector de códigos de región (del 1 al 16)

- tipo:

  Tipo de macrozonas a aplicar. Por defecto se usa el tipo 1. Ver la
  documentación más arriba.

- ordenar:

  Entregar resultados como un factor ordenado (de norte a sur), o como
  textos sin orden. Por defecto entrega factor.

## Valor

Factor con macrozonas regionales, de acuerdo al tipo de clasificación de
regiones elegido.

## Detalles

Como no existe una clasificación fija de macrozonas, existen varias
alternativas para elegir:

- Macrozonas tipo 1: desde Arica a Coquimbo son *Norte*, desde
  Valparaíso a Maule *Centro*, desde Ñuble a Los Lagos *Sur*, y desde
  Aysén a Magallanes *Austral*.

- Macrozonas tipo 2: distribución balanceada por cantidad de regiones: 4
  grupos de 4 regiones: *Norte*, *Centro*, *Centro/sur* y *Sur*.

- Macrozonas tipo 3: según las macrozonas del Ministerio de Ciencia,
  Tecnología, Conocimiento e Innovación, que definr 5 macrozonas
  (*Norte, Centro, Centro sur, Sur,* y *Austral*), y excluye a la Región
  Metropolitana. Para más información, \#' [revisar el
  decreto](https://www.bcn.cl/leychile/navegar?idNorma=1142798) que
  establece a las Seremis del ministerio de Ciencia.

- Macrozonas tipo 4: basadas en el [programa curricular de educación
  básica](https://es.wikipedia.org/wiki/Regiones_naturales_de_Chile) del
  Ministerio de Educación de Chile, existirían *Norte grande, Norte
  chico, Zona central, Zona sur* y *Zona austral*.

## Ejemplos

``` r
agregar_macrozona(c(15, 13, 12), tipo = 1)
#> [1] Norte   Centro  Austral
#> Levels: Norte Centro Sur Austral

territorial::territorios |>
  ordenar_regiones() |>
  dplyr::mutate(
    macrozona_1 = agregar_macrozona(codigo_region, tipo = 1),
    macrozona_2 = agregar_macrozona(codigo_region, tipo = 2),
    macrozona_3 = agregar_macrozona(codigo_region, tipo = 3),
    macrozona_4 = agregar_macrozona(codigo_region, tipo = 4)
 )
#> # A tibble: 346 × 10
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
#> # ℹ 5 more variables: nombre_comuna <chr>, macrozona_1 <fct>,
#> #   macrozona_2 <fct>, macrozona_3 <fct>, macrozona_4 <fct>
```
