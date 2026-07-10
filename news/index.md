# Registro de cambios

## territorial 0.8.7 (2026/07/10)

- Tabla de datos con población comunal proyectada (2002-2035), base
  Censo 2017:
  [`territorial::poblacion_proyeccion`](https://bastianolea.github.io/territorial/reference/poblacion_proyeccion.md)
- Función para agregar población comunal a comunas:
  [`territorial::agregar_poblacion()`](https://bastianolea.github.io/territorial/reference/agregar_poblacion.md)

## territorial 0.8.6 (2026/07/08)

- Nueva función
  [`as_nombre_region()`](https://bastianolea.github.io/territorial/reference/as_nombre_region.md)
  para convertir códigos de región (del 1 al 16) a nombres de región, y
  [`as_codigo_region()`](https://bastianolea.github.io/territorial/reference/as_codigo_region.md)
  para convertir nombres de región a códigos de región.
- Mejora en
  [`limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md)
  para casos de comunas con nombres que contienen sólo números

## territorial 0.8.5 (2026/07/06)

- Funciones
  [`agregar_macrozona()`](https://bastianolea.github.io/territorial/reference/agregar_macrozona.md)
  y
  [`agregar_clasificacion()`](https://bastianolea.github.io/territorial/reference/agregar_clasificacion.md)
  ahora entregan sus resultados en factores ordenados (para poder
  ordenar de norte a sur, o para tener las clasificaciones en orden).

## territorial 0.8.4 (2026/07/03)

- Nueva función
  [`agregar_macrozona()`](https://bastianolea.github.io/territorial/reference/agregar_macrozona.md)
  para clasificar regiones de Chile, incluyendo 4 tipos de macrozonas
- Nueva función
  [`acortar_regiones()`](https://bastianolea.github.io/territorial/reference/acortar_regiones.md)
  para acortar el nombre de las regiones de Chile

## territorial 0.8.3 (2026/07/02)

- Mejores avisos y errores en
  [`territorial::is_nombre_comuna()`](https://bastianolea.github.io/territorial/reference/is_nombre_comuna.md),
  [`territorial::as_nombre_comuna()`](https://bastianolea.github.io/territorial/reference/as_nombre_comuna.md),
  [`territorial::is_codigo_comuna()`](https://bastianolea.github.io/territorial/reference/is_codigo_comuna.md)
  y
  [`territorial::as_codigo_comuna()`](https://bastianolea.github.io/territorial/reference/as_codigo_comuna.md)

## territorial 0.8.2 (2026/07/01)

- Se agregan pasos para limpiar casos especiales en
  [`territorial::limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md)
- Nuevos artículos con casos de uso
- Viñetas con explicaciones de conceptos

## territorial 0.8.0

- Nueva función
  [`territorial::ubicar_localidades()`](https://bastianolea.github.io/territorial/reference/ubicar_localidades.md)
- Mejoras en funciones
  [`territorial::validar_comunas()`](https://bastianolea.github.io/territorial/reference/validar_comunas.md)
  y
  [`territorial::validar_regiones()`](https://bastianolea.github.io/territorial/reference/validar_regiones.md)

## territorial 0.7.7

- Mejoras en documentación de funciones
- Nuevas viñetas
- Corrección de lista de comunas

## territorial 0.7.7

- Mejoras en pruebas unitarias
- Mejoras en documentación de funciones

## territorial 0.7.0

- Nueva función
  [`territorial::limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md)
- Mejoras en pruebas unitarias

## territorial 0.4.0

- Nueva función
  [`territorial::validar_comunas()`](https://bastianolea.github.io/territorial/reference/validar_comunas.md)
- Nueva función
  [`territorial::abreviar_comunas()`](https://bastianolea.github.io/territorial/reference/abreviar_comunas.md)
- Nueva función
  [`territorial::ubicar_comunas()`](https://bastianolea.github.io/territorial/reference/ubicar_comunas.md)

## territorial 0.2.0

- Nuevas funciones `territorial::articulo_region()` y
  [`territorial::redactar_region()`](https://bastianolea.github.io/territorial/reference/redactar_region.md)
