# Convertir nombres de comunas a códigos comunales

Entregando nombres de comuna correctos (como los que aparecen en
[`comunas()`](https://bastianolea.github.io/territorial/reference/comunas.md)
o en
[territorios](https://bastianolea.github.io/territorial/reference/territorios.md)),
retorna los códigos de comuna correspondientes en formato numérico.
Retorna NA si no corresponde con ninguna.

## Uso

``` r
as_codigo_comuna(nombres_comunas)
```

## Argumentos

- nombres_comunas:

  Nombres de comuna (como los que aparecen en
  [`comunas()`](https://bastianolea.github.io/territorial/reference/comunas.md))
  en formato caracter.

## Valor

Vector numérico con códigos de comuna.

## Detalles

Para más información sobre los códigos únicos territoriales, revisa la
viñeta
[`vignette("codigos_unicos_territoriales")`](https://bastianolea.github.io/territorial/articles/codigos_unicos_territoriales.md)

## Ejemplos

``` r
as_codigo_comuna("La Florida")
#> [1] 13110
```
