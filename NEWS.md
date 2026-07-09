# territorial 0.8.6 (2026/07/08)
- Nueva función `as_nombre_region()` para convertir códigos de región (del 1 al 16) a nombres de región, y `as_codigo_region()` para convertir nombres de región a códigos de región.

# territorial 0.8.5 (2026/07/06)
- Funciones `agregar_macrozona()` y `agregar_clasificacion()` ahora entregan sus resultados en factores ordenados (para poder ordenar de norte a sur, o para tener las clasificaciones en orden).

# territorial 0.8.4 (2026/07/03)
- Nueva función `agregar_macrozona()` para clasificar regiones de Chile, incluyendo 4 tipos de macrozonas
- Nueva función `acortar_regiones()` para acortar el nombre de las regiones de Chile

# territorial 0.8.3 (2026/07/02)
- Mejores avisos y errores en `territorial::is_nombre_comuna()`, `territorial::as_nombre_comuna()`, `territorial::is_codigo_comuna()` y  `territorial::as_codigo_comuna()`

# territorial 0.8.2 (2026/07/01)
- Se agregan pasos para limpiar casos especiales en `territorial::limpiar_comunas()`
- Nuevos artículos con casos de uso
- Viñetas con explicaciones de conceptos

# territorial 0.8.0
- Nueva función `territorial::ubicar_localidades()`
- Mejoras en funciones `territorial::validar_comunas()` y `territorial::validar_regiones()`

# territorial 0.7.7
- Mejoras en documentación de funciones
- Nuevas viñetas
- Corrección de lista de comunas

# territorial 0.7.7
- Mejoras en pruebas unitarias
- Mejoras en documentación de funciones

# territorial 0.7.0
- Nueva función `territorial::limpiar_comunas()`
- Mejoras en pruebas unitarias

# territorial 0.4.0
- Nueva función `territorial::validar_comunas()`
- Nueva función `territorial::abreviar_comunas()`
- Nueva función `territorial::ubicar_comunas()`

# territorial 0.2.0
- Nuevas funciones `territorial::articulo_region()` y `territorial::redactar_region()` 
