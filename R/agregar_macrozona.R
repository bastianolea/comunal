#' Agregar macrozona del país a regiones
#'
#' Las macrozonas son agrupaciones de regiones de Chile que permiten entender el territorio en base a grupos geográficos. Para un vector de códigos de regiones (del 1 al 16), entrega las macrozonas correspondientes a cada región.
#'
#' Como no existe una clasificación fija de macrozonas, existen varias alternativas para elegir:
#' * Macrozonas tipo 1: desde Arica a Coquimbo son _Norte_, desde Valparaíso a Maule _Centro_, desde Ñuble a Los Lagos _Sur_, y desde Aysén a Magallanes _Austral_.
#' * Macrozonas tipo 2: distribución balanceada por cantidad de regiones: 4 grupos de 4 regiones: _Norte_, _Centro_, _Centro/sur_ y _Sur_.
#' * Macrozonas tipo 3: según las macrozonas del Ministerio de Ciencia, Tecnología, Conocimiento e Innovación, que definr 5 macrozonas (_Norte, Centro, Centro sur, Sur,_ y _Austral_), y excluye a la Región Metropolitana. Para más información, #' \href{https://www.bcn.cl/leychile/navegar?idNorma=1142798}{revisar el decreto} que establece a las Seremis del ministerio de Ciencia.
#' * Macrozonas tipo 4: basadas en el \href{https://es.wikipedia.org/wiki/Regiones_naturales_de_Chile}{programa curricular de educación básica} del Ministerio de Educación de Chile, existirían _Norte grande, Norte chico, Zona central, Zona sur_ y _Zona austral_.
#' * Macrozonas tipo 5: dividen al país en _norte, centro_ y _sur_ según las agrupaciones del estudio Identificación de Localidades en Condición de Aislamiento 2012, de Subdere.
#'
#' @param codigo_region Vector de códigos de región (del 1 al 16)
#' @param tipo Tipo de macrozonas a aplicar. Por defecto se usa el tipo 1. Ver la documentación más arriba.
#' @param ordenar Entregar resultados como un factor ordenado (de norte a sur), o como textos sin orden. Por defecto entrega factor.
#'
#' @returns Factor con macrozonas regionales, de acuerdo al tipo de clasificación de regiones elegido.
#' @export
#'
#' @examples
#' agregar_macrozona(c(15, 13, 12), tipo = 1)
#'
#' territorial::territorios |>
#'   dplyr::distinct(codigo_region, nombre_region) |>
#'   ordenar_regiones() |>
#'   dplyr::mutate(
#'     macrozona_1 = agregar_macrozona(codigo_region, tipo = 1),
#'     macrozona_2 = agregar_macrozona(codigo_region, tipo = 2),
#'     macrozona_3 = agregar_macrozona(codigo_region, tipo = 3),
#'     macrozona_4 = agregar_macrozona(codigo_region, tipo = 4)
#'  )
agregar_macrozona <- function(
  codigo_region,
  tipo = 1,
  ordenar = TRUE
) {
  # revisar tipo
  if (is.character(codigo_region)) {
    cli::cli_alert_warning(
      "Se entregaron códigos regionales en formato caracter. Se recomienda convertir a numérico."
    )
    codigo_region <- as.numeric(codigo_region)
  }

  # revisar si es código comunal
  if (any(is_codigo_comuna(codigo_region))) {
    cli::cli_abort(
      "Se entregaron códigos comunales en vez de códigos regionales"
    )
  }

  # datos <- territorial::territorios |>
  #   dplyr::select(dplyr::ends_with("region")) |>
  #   dplyr::distinct() |>
  #   territorial::ordenar_regiones()
  #
  # datos$codigo_region |> dput()

  # codigo_region <- c(15, 1, 2, 3, 4, 5, 13, 6, 7, 16, 8, 9, 14, 10, 11, 12)

  if (tipo == 1) {
    macrozonas <- dplyr::case_when(
      codigo_region %in% c(15, 1, 2, 3, 4) ~ "Norte",
      codigo_region %in% c(5, 13, 6, 7) ~ "Centro",
      codigo_region %in% c(16, 8, 9, 14, 10) ~ "Sur",
      codigo_region %in% c(11, 12) ~ "Austral"
    )

    if (ordenar) {
      macrozonas <- macrozonas |>
        factor(levels = c("Norte", "Centro", "Sur", "Austral"))
    }
  } else if (tipo == 2) {
    macrozonas <- dplyr::case_when(
      codigo_region %in% c(15, 1, 2, 3) ~ "Norte",
      codigo_region %in% c(4, 5, 13, 6) ~ "Centro",
      codigo_region %in% c(7, 16, 8, 9) ~ "Centro/sur",
      codigo_region %in% c(14, 10, 11, 12) ~ "Sur"
    )

    if (ordenar) {
      macrozonas <- macrozonas |>
        factor(levels = c("Norte", "Centro", "Centro/sur", "Sur"))
    }
  } else if (tipo == 3) {
    macrozonas <- dplyr::case_when(
      codigo_region %in% c(15, 1, 2, 3) ~ "Norte",
      codigo_region %in% c(4, 5) ~ "Centro",
      codigo_region %in% c(13) ~ "Metropolitana",
      codigo_region %in% c(6, 7, 16, 8) ~ "Centro sur",
      codigo_region %in% c(9, 14, 10) ~ "Sur",
      codigo_region %in% c(11, 12) ~ "Austral"
    )

    if (ordenar) {
      macrozonas <- macrozonas |>
        factor(
          levels = c(
            "Norte",
            "Centro",
            "Metropolitana",
            "Centro sur",
            "Sur",
            "Austral"
          )
        )
    }
  } else if (tipo == 4) {
    macrozonas <- dplyr::case_when(
      codigo_region %in% c(15, 1, 2) ~ "Norte Grande",
      codigo_region %in% c(3, 4, 5) ~ "Norte Chico",
      codigo_region %in% c(13, 6, 7, 16, 8) ~ "Zona central",
      codigo_region %in% c(9, 14, 10) ~ "Zona Sur",
      codigo_region %in% c(11, 12) ~ "Zona Austral"
    )

    if (ordenar) {
      macrozonas <- macrozonas |>
        factor(
          levels = c(
            "Norte Grande",
            "Norte Chico",
            "Zona central",
            "Zona Sur",
            "Zona Austral"
          )
        )
    }
  } else if (tipo == 5) {
    macrozonas <- dplyr::case_when(
      codigo_region %in% c(15, 1, 2, 3, 4) ~ "Norte",
      codigo_region %in% c(5, 13, 6, 7, 16, 8, 9, 14) ~ "Centro",
      codigo_region %in% c(10, 11, 12) ~ "Sur"
    )

    if (ordenar) {
      macrozonas <- macrozonas |>
        factor(
          levels = c(
            "Norte",
            "Centro",
            "Sur"
          )
        )
    }
  }

  if (length(macrozonas) != length(codigo_region)) {
    cli::cli_abort(
      "Largo de las clasificaciones no es el mismo que regiones entregadas"
    )
  }

  return(macrozonas)
}
