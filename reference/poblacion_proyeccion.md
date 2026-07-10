# Proyecciones de población a nivel comunal de Chile (2002-2035), base Censo 2017

Las proyecciones de población proporcionan una referencia del futuro
tamaño y estructura por edades de una población, basados en un conjunto
de supuestos sobre el comportamiento de los componentes demográficos
fecundidad, mortalidad y migración. Son un insumo fundamental para la
planificación y la toma de decisiones tanto para el sector público como
el privado, dado que permiten anticipar demandas futuras e identificar
desafíos que surgen como consecuencia de los cambios demográficos.

## Uso

``` r
poblacion_proyeccion
```

## Formato

Un data frame con 11.764 filas y 8 columnas:

- codigo_region:

  Código único territorial de las regiones de Chile (número entre 1 y
  16)

- nombre_region:

  Nombre de las regiones de Chile

- codigo_provincia:

  Código único territorial de las provincias de Chile

- nombre_provincia:

  Nombre de las provincias de Chile

- codigo_comuna:

  Código único territorial de las comunas de Chile

- nombre_comuna:

  Nombre de las comunas de Chile

- año:

  El año al que corresponde la población proyectada

- poblacion:

  Cantidad de habitantes proyectados para la comuna y el año
  correspondientes

## Fuente

<https://www.ine.gob.cl/estadisticas-por-tema/demografia-y-poblacion/estimaciones-y-proyecciones-de-poblacion>

## Detalles

Los datos fueron obtenidos [desde el sitio web del
INE](https://www.ine.gob.cl/estadisticas-por-tema/demografia-y-poblacion/estimaciones-y-proyecciones-de-poblacion)
y corresponden a la proyección base 2017, que considera el período
2002-2035, realizada por el INE a partir de los resultados del Censo
2017. Los datos originales corresponden a la planilla "Estimaciones y
proyecciones 2002-2035, comunas" y se procesaron con código disponible
[en este
repositorio.](https://github.com/bastianolea/censo_proyecciones_poblacion)

Al basarse en el Censo 2017, los valores al año 2017 corresponden a los
del Censo de dicho año, pero los valores del 2024 no concuerdan con los
del reciente Censo 2024. Las proyecciones de población de nivel comunal
en base al Censo 2024 todavía no están disponibles.
