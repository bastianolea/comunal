# Reemplazar caracteres al azar para ensuciar texto

Reemplazar caracteres al azar para ensuciar texto

## Uso

``` r
reemplazar_texto(texto, porcentaje = 0.1, caracteres = c(letters, LETTERS))
```

## Argumentos

- texto:

  Vector de texto

- porcentaje:

  Porcentaje de caracteres a reemplazar

- caracteres:

  Vector de caracteres para insertar

## Valor

Vector de texto con caracteres reemplazados al azar

## Ejemplos

``` r
reemplazar_texto(c("mapache", "lindo"), porcentaje = 0.3)
#> [1] "qGpache" "Bindo"  
```
