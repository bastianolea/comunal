# Eliminar caracteres al azar para ensuciar texto

Eliminar caracteres al azar para ensuciar texto

## Uso

``` r
eliminar_texto(texto, porcentaje = 0.1)
```

## Argumentos

- texto:

  Vector de texto

- porcentaje:

  Porcentaje de caracteres a eliminar

## Valor

Vector de texto con caracteres eliminados al azar

## Ejemplos

``` r
eliminar_texto(c("mapache", "lindo"), porcentaje = 0.3)
#> [1] "mpche" "lndo" 
```
