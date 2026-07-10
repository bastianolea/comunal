#' Agregar población a códigos comunales
#'
#' Esta función sirve para agregar cifras de población oficiales a comunas de Chile. Se debe entregar un código comunal válido, como los que aparecen en [territorial::territorios]. Se debe especificar la base de datos de población a utilizar entre varias: Proyecciones del Censo (base 2017), Censo 2024 (población censada). Se puede consultar la población para más de una comuna a la vez, para un mismo o distintos años.
#'
#' @param codigo_comuna Códigos comunales de las comunas para entregar su población. Ver [territorial::territorios]
#' @param año Opcional: si se va a elegir proyecciones de población, año de la estimación
#' @param base Base de datos de población a utilizar. Puede ser `proyección`.
#'
#' @returns Vector con cifras de población para la/s comuna/s consultadas.
#' @export
#'
#' @examples
#' # varios años para una comuna
#' agregar_poblacion(codigo_comuna = 1101, año = 2020:2026)
#'
#' # varias comunas para un año
#' agregar_poblacion(codigo_comuna = c(1101, 1107, 1401, 1402, 1403), año = 2026)
#'
#' # crear variable población para una tabla de datos
#' territorial::territorios |>
#'   dplyr::mutate(poblacion = agregar_poblacion(codigo_comuna, 2026))
#'
agregar_poblacion <- function(
  codigo_comuna,
  año,
  base = "proyección"
) {
  # codigo_comuna <- c(1101, 1101, 1101, 000, 1101, 2102, 8202)
  # año <- c(2025, 2028, 2026, 2025, 2004, 2013, 2020)

  # revisar si viene algún código comunal inválido
  if (!all(is_codigo_comuna(codigo_comuna))) {
    cli::cli_warn(
      "Algunos códigos comunales no son válidos. Se sugiere usar la función `is_codigo_comuna()` para verificar los códigos comunales, o `validar_comunas()` sobre el nombre de las comunas."
    )
  }

  if (base == "proyección" | base == "proyeccion") {
    pob <- territorial::poblacion_proyeccion

    # revisar años fuera de rango
    if (any(año < 2002) | any(año > 2035)) {
      cli::cli_abort(
        "Los datos de proyección de población sólo están disponibles entre 2002 y 2035"
      )
    }

    # datos de consulta
    filtro_df <- dplyr::tibble(
      codigo_comuna = codigo_comuna,
      año = año
    )

    # cruce
    resultado <- filtro_df |>
      dplyr::left_join(pob, by = c("codigo_comuna", "año"), )

    cifras <- resultado$poblacion
  }

  # revisar si no hay nada
  if (length(cifras) == 0) {
    cli::cli_abort(
      "No se encontró población para las combinaciones especificadas"
    )
  }

  # revisar si hay combinaciones sin población
  if (any(is.na(cifras))) {
    cli::cli_warn(
      "No se encontró población para algunas combinaciones especificadas"
    )
  }

  return(cifras)
}
