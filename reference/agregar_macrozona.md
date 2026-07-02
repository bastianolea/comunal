# Agregar macrozona del país a regiones

Para un vector de códigos de regiones (del 1 al 16), entrega las
macrozonas correspondientes a cada región. Como no existe una
clasificación fija de macrozonas, existen varias alternativas para
elegir.

## Uso

``` r
agregar_macrozona(codigo_region, tipo = 1)
```

## Argumentos

- codigo_region:

  Vector de códigos de región (del 1 al 16)

- tipo:

  Tipo de macrozonas a aplicar. Por defecto 1. Ver documentación.

## Valor

Vector con macrozonas regionales

## Detalles

Macrozonas tipo 1: desde Arica a Coquimbo son *Norte*, desde Valparaíso
a Maule *Centro*, desde Ñuble a Los Lagos *Sur*, y desde Aysén a
Magallanes *Austral*. Macrozonas tipo 2: distribución balanceada por
cantidad de regiones: 4 grupos de 4 regiones: *Norte*, *Centro*,
*Centro/sur* y *Sur*.

## Ejemplos

``` r
agregar_macrozona(c(15, 13, 12))
#> [1] "Norte"   "Centro"  "Austral"
```
