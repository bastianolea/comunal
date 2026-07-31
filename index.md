# Paquete `{territorial}`

Herramientas para facilitar el trabajo con datos de comunas y regiones
de Chile en R.

El objetivo de este paquete es simplificar el análisis de datos
territoriales de Chile, facilitando tareas de limpieza y procesamiento
de datos que suelen ser necesarias al trabajar con datos de Chile a
nivel comunal y regional.

Los datos públicos sobre temáticas sociales siempre vienen en dudosa
calidad, sobre todo cuando se refieren a comunas: nombres mal escritos,
en mayúsculas, sin eñes, sin tildes, etc. Así que creé
[territorial](https://bastianolea.github.io/territorial) para facilitar
este tipo de tareas!

Por ejemplo:

- **Revisar** si los nombres de comunas y regiones vienen bien escritos
  ([`validar_comunas()`](https://bastianolea.github.io/territorial/reference/validar_comunas.md)
  y
  [`validar_regiones()`](https://bastianolea.github.io/territorial/reference/validar_regiones.md))
- **Limpiar** los nombres de las comunas automáticamente con
  [`limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md),
  incluso si vienen con faltas de ortografía o mal escritas
- Agregar todos los datos territoriales (regiones y provincias con sus
  códigos únicos) a partir de las comunas
  ([`contextualizar()`](https://bastianolea.github.io/territorial/reference/contextualizar.md))
- Convertir nombres de comunas a [códigos únicos
  territoriales](https://bastianolea.github.io/territorial/articles/codigos_unicos_territoriales.html)
  ([`as_codigo_comuna()`](https://bastianolea.github.io/territorial/reference/as_codigo_comuna.md))
  y viceversa
  ([`as_nombre_comuna()`](https://bastianolea.github.io/territorial/reference/as_nombre_comuna.md))
- **Ordenar las regiones** del país de norte a sur
  ([`ordenar_regiones()`](https://bastianolea.github.io/territorial/reference/ordenar_regiones.md))
- Redactar los nombres de las regiones
  ([`redactar_region()`](https://bastianolea.github.io/territorial/reference/redactar_region.md))
  para que, por ejemplo, “Maule” sea “Región *del* Maule”
- Clasificar las comunas de Chile en **urbanas, mixtas** y **rurales**
  con
  [`agregar_clasificacion()`](https://bastianolea.github.io/territorial/reference/agregar_clasificacion.md)
- Clasificar las regiones de Chile en **macrozonas** con
  [`agregar_macrozona()`](https://bastianolea.github.io/territorial/reference/agregar_macrozona.md)
- **Abreviar** las comunas de Chile a siglas de tres caracteres con
  [`abreviar_comunas()`](https://bastianolea.github.io/territorial/reference/abreviar_comunas.md)
- y más!

Revisa la viñeta
[`vignette("territorial")`](https://bastianolea.github.io/territorial/articles/territorial.md)
para una introducción al paquete!

------------------------------------------------------------------------

Paquete desarrollado bajo el [programa de Campeones de
ROpenSci](https://ropensci.org/es/champions/), con el apoyo de mi
mentora [Andrea Gómez Vargas](https://github.com/SoyAndrea)

## Instalación

Puedes instalar la versión de desarrollo este paquete desde GitHub:

``` r

# install.packages("pak")
pak::pak("bastianolea/territorial")
```

*Nota:* el paquete está en etapa de desarrollo. Si bien es funcional y
útil en este momento, sus funciones pueden cambiar en futuras versiones,
y su estabilidad aún no está garantizada.

## Usando `{territorial}`

Como su nombre lo dice,
[territorial](https://bastianolea.github.io/territorial) entrega varias
herramientas para trabajar con datos territoriales de Chile,
principalmente sus regiones o comunas.

``` r

library(territorial)
```

La premisa del paquete es que tenemos una tabla
([`territorial::territorios`](https://bastianolea.github.io/territorial/reference/territorios.md))
que contiene los nombres oficiales y los códigos únicos territoriales de
todas las regiones, provincias y comunas de Chile.

También se plantea el estándar de llamar las columnas territoriales como
`nombre_{x}` y `codigo_{x}` (por ejemplo, `nombre_comuna` y
`codigo_comuna`), para mantener orden y compatibilidad de datos (pero es
sólo una sugerencia).

Probemos [territorial](https://bastianolea.github.io/territorial) con
una tabla con datos de ejemplo:

``` r

# creat una tabla con datos de ejemplo
datos <- dplyr::tibble(
  nombre_comuna = c("PIRQUE", "El Monte", "Maipu", "nunoa",
                    "santiago", "prohibidencia", "CERRILLOS", 
                    "San José De Maipo", "OHiggins")
)

datos
```

``` R
# A tibble: 9 × 1
  nombre_comuna    
  <chr>            
1 PIRQUE           
2 El Monte         
3 Maipu            
4 nunoa            
5 santiago         
6 prohibidencia    
7 CERRILLOS        
8 San José De Maipo
9 OHiggins         
```

Estas comunas vienen en mayúsculas, con faltas de ortografía, y mal
escritas!

Si tienes datos comunales de Chile, puedes **revisar la calidad** de sus
comunas con
[`validar_comunas()`](https://bastianolea.github.io/territorial/reference/validar_comunas.md),
para detectar posibles problemas:

``` r

datos |> 
  validar_comunas(nombre_comuna) # cuando la columna con nombres de comunas se llama `nombre_comuna`, no es necesario especificarla
```

``` R
ℹ Validando calidad de nombres de comuna desde tabla de datos

! Resumen: 8 casos de comunas que no conciden con comunas correctamente escritas (ver `territorial::comunas()`): PIRQUE, Maipu, nunoa, santiago, prohibidencia, CERRILLOS, San José De Maipo y OHiggins

! Mayúsculas: 2 casos de comunas escritas en mayúsculas: PIRQUE y CERRILLOS

! Minúsculas: 3 casos de comunas escritas en minúsculas: nunoa, santiago y prohibidencia

! Mayúsculas: 1 caso de comunas con preposiciones ('de', 'del') escritas en mayúsculas: San José De Maipo

ℹ Tildes: 1 caso de comunas que deberían tener tildes y no los tienen: Maipu

ℹ Eñes: 1 caso de comunas escritas sin eñe: nunoa

ℹ Problemas comunes: 1 caso de comunas popularmente mal escritas: OHiggins

✖ Validación de comunas: se encontraron 17 problemas con las comunas! Usa `territorial::limpiar_comunas()` para solucionarlos.
```

También puedes limpiar automáticamente las comunas con
[`limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md),
y obtener una columna con las comunas correctas (que salen de la tabla
[`territorial::territorios`](https://bastianolea.github.io/territorial/reference/territorios.md)),
obtenidas por medio de varias técnicas de limpieza de datos:

``` r

library(dplyr)
```

``` r

datos |> 
  limpiar_comunas(nombre_comuna)
```

``` R
ℹ Limpiando 9 nombres de comunas (9 son distintas)

── Paso 1: confirmar comunas correctas 

ℹ De las 9 comunas distintas, 1 ya eran correctas: El Monte

── Paso 2: coincidencias por limpieza de texto 

ℹ A partir de la limpieza de texto, se limpiaron 8 de 9 comunas: Pirque, El Monte, Maipú, Ñuñoa, Santiago, Cerrillos, San José de Maipo y O'Higgins

── Paso 3: casos especiales 

ℹ Se encontraron 0 casos especiales: 

── Paso 4: coincidencias aproximadas de texto 

ℹ Se limpiaron 1 de 1 comunas por medio de coincidencias aproximadas de texto: Providencia

── Conclusión de limpieza de comunas 

✔ De las 9 comunas distintas, se limpiaron 9 en total (100%)

# A tibble: 9 × 1
  nombre_comuna    
  <chr>            
1 Pirque           
2 El Monte         
3 Maipú            
4 Ñuñoa            
5 Santiago         
6 Providencia      
7 Cerrillos        
8 San José de Maipo
9 O'Higgins        
```

Si necesitamos **agregar variables territoriales faltantes** a una tabla
de datos que solamente tiene las comunas o los códigos únicos
territoriales de Chile (`vignette(codigos_unicos_territoriales)`),
podemos usar
[`contextualizar()`](https://bastianolea.github.io/territorial/reference/contextualizar.md)
para agregar rápidamente todas las columnas territoriales que falten.

``` r

datos <- tribble(
  ~nombre_comuna, ~poblacion,
  "Puente Alto",    1,
  "La Florida",     1,
  "La Granja",      1,
  "San Joaquín",    1)
```

``` r

datos |>
  contextualizar(nombre_comuna)
```

``` R
ℹ columnas agregadas: codigo_region, nombre_region, codigo_provincia, nombre_provincia y codigo_comuna

# A tibble: 4 × 7
  codigo_region nombre_region    codigo_provincia nombre_provincia codigo_comuna
          <dbl> <chr>                       <dbl> <chr>                    <dbl>
1            13 Metropolitana d…              132 Cordillera               13201
2            13 Metropolitana d…              131 Santiago                 13110
3            13 Metropolitana d…              131 Santiago                 13111
4            13 Metropolitana d…              131 Santiago                 13129
# ℹ 2 more variables: nombre_comuna <chr>, poblacion <dbl>
```

Así, un dataframe que solamente tiene nombres de comuna puede pasar a
tener todas las demás variables que descrien territorialmente a esos
datos.

------------------------------------------------------------------------

Estas son algunas de las funciones principales, pero existen muchas más
que facilitan el trabajo con datos territoriales de Chile: [revisa el
índice!](https://bastianolea.github.io/territorial/reference/)

## Código de conducta

Ten en cuenta que este proyecto se publica con un [Código de Conducta
para
Colaboradores](https://bastianolea.github.io/territorial/CODE_OF_CONDUCT.html).
Al contribuir a este proyecto, aceptas cumplir con sus términos.
