# Prueba de suciedad extrema

Una de las utilidades principales del paquete
[territorial](https://bastianolea.github.io/territorial) es poder
[limpiar automáticamente las
comunas](https://bastianolea.github.io/territorial/reference/limpiar_comunas.html)
de una base de datos que venga con datos sucios: comunas mal escritas,
en mayúsculas, sin tildes, sin eñes, etc.

En este ejemplo, probaremos la función
[`territorial::limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md)
con un caso extremo de datos intencionalmente sucios.

``` r

library(territorial)
library(dplyr)

set.seed(1234)
```

Crearemos una tabla con nombres de comunas ensuciados, a partir de la
tabla `territorios` que viene con el paquete, y usando algunas funciones
utilitarias [inspiradas en el paquete
`{messy}`](https://nrennie.rbind.io/messy/) para ensuciar los datos.

``` r

sucios <- territorios |> 
  select(nombre_comuna) |> 
  mutate(nombres_sucios = nombre_comuna |> 
      reemplazar_texto(porcentaje = 0.2) |>
      eliminar_texto(porcentaje = 0.1) |>
      insertar_texto(porcentaje = 0.2)
  ) |> 
  filter_out(nombre_comuna == nombres_sucios) # excluir los que no se ensuciaron por azar
```

Como sus nombres lo indican, estas funciones reemplazan, eliminan e
insertan texto aleatoriamente, para simular errores de escritura, datos
corruptos, u otros problemas de calidad de datos.

Así queda una muestra de los datos sucios:

``` r

sucios |> 
  slice_sample(n = 10)
```

    # A tibble: 10 × 2
       nombre_comuna       nombres_sucios
       <chr>               <chr>
     1 Arica               AUicaD
     2 Cunco               CCEnco
     3 Calera de Tango     CaArFa Lde iZngo
     4 San José de Maipo   Szn GfKox de Maiplo
     5 Tirúa               wTirúp
     6 Pedro Aguirre Cerda PeiBoV AguHrrzeHCerda
     7 Constitución        CJnszthiucióP
     8 Villarrica          CVillaTica
     9 Futaleufú           Gutjaleufú
    10 San Ignacio         Sa Qzgnancio         

Ahora que tenemos la columna `nombres_sucios`, usamos
[`limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md)
para limpiar los datos, creando la columna `nombres_limpios`:

``` r

limpios <- sucios |> 
  mutate(nombres_limpios = limpiar_comunas(nombres_sucios))
```

Ahora veamos el resultado de esta prueba de limpieza extrema:

``` r

limpios |> 
  select(nombres_sucios, nombres_limpios) |> 
  print(n = 30)
```

    # A tibble: 339 × 2
       nombres_sucios        nombres_limpios
       <chr>                 <chr>
     1 IqupquEe              Iquique
     2 lAlto RopLKcio        <NA>
     3 fPozopAlmLtne         <NA>
     4 CamHñax               Camiña
     5 ColchavKe             Colchane
     6 pHfara                Huara
     7 Antdwfagdist          <NA>
     8 MejOtloces            Mejillones
     9 Sideera Gobqa         Sierra Gorda
    10 TaYltaU               Taltal
    11 CatamZa               Calama
    12 Oyllcgüe              Ollagüe
    13 anJQPKedbFVde AtacaPa <NA>
    14 TocoIoilla            Tocopilla
    15 YaPrbíLElena          <NA>
    16 CopciaWó              Copiapó
    17 CalldFra              Caldera
    18 ziervra Yhqailla      <NA>
    19 CFiañaral             Chañaral
    20 qDicAgoRpde Almago    <NA>
    21 VallejarY             Vallenar
    22 AltKo yScCarBmen      <NA>
    23 FkrXirina             Freirina
    24 HIuaszo               Huasco
    25 La Serfcna            La Serena
    26 Coqtimibo             Coquimbo
    27 Angdacollg            Andacollo
    28 LaKiAIuera            <NA>
    29 Peaihuano             Paihuano
    30 VicaIña               Vicuña
    # ℹ 309 more rows

Podemos confirmar que la limpieza realizada con
[`limpiar_comunas()`](https://bastianolea.github.io/territorial/reference/limpiar_comunas.md)
es capaz de abarcar casos muy extremos: por ejemplo, identifica que
`SvnMPmedro d Atacaa` es *San Pedro de Atacama*, o que `SanaWMaríaW` es
*Santa María*, por lo que la función podría resultar apropiada para
detección de datos escritos a mano o de documentos antiguos procesados
con OCR.

A este nivel de dificultad, la limpieza no siempre es 100% correcta.

``` r

problemas <- limpios |> 
  filter(nombre_comuna != nombres_limpios)
```

Luego de esta limpieza, quedaron 5 casos donde los nombres limpios se
dedujeron incorrectamente a partir de los nombres sucios:

``` r

problemas
```

    # A tibble: 5 × 3
      nombre_comuna nombres_sucios nombres_limpios
      <chr>         <chr>          <chr>
    1 Malloa        OMallEa        Ovalle
    2 Talca         Talwat         Taltal
    3 Chanco        ChGInco        Coinco
    4 Cunco         CCEnco         Coinco
    5 Colina        Eoylina        Molina         
