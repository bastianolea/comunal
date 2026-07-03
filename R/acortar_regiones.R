#' Acortar nombres de las regiones de Chile
#'
#' Hay regiones de Chile con nombres extensos, y que en ciertos contextos requieren de una versión más breve. Esta función procesa el texto de los nombres de regiones para, por ejemplo, pasar desde "Aysén del General Carlos Ibáñez del Campo" a "Aysén".
#'
#' @param nombre_region Nombres de regiones, como los que aparecen en [territorial::regiones()]
#'
#' @returns Vector de texto con nombres de regiones breves.
#' @export
#'
#' @examples
#' acortar_regiones("Libertador Gral. Bernardo O'Higgins")
#'
#' territorial::territorios |>
#'   ordenar_regiones() |>
#'   dplyr::mutate(nombre_region_corto = acortar_regiones(nombre_region))
acortar_regiones <- function(nombre_region) {
  # territorial::territorios |>
  #   distinct(nombre_region)
  #
  # nombre_region <- territorial::regiones()

  # revisar tipo
  if (is.numeric(nombre_region)) {
    cli::cli_abort(
      "Se necesitan nombres de regiones en tipo caracter!"
    )
  }

  resultado <- nombre_region |>
    stringr::str_remove_all("Región (de|del|De|Del)") |>
    stringr::str_remove_all("\\.|\\,") |>
    stringr::str_remove_all("(?<=Metropolitana) (de|De) Santiago") |>
    stringr::str_remove_all("(L|l)ibertador (General|Gral) Bernardo") |>
    stringr::str_remove_all(
      "(del|Del|) (General|Gral) Carlos Ib(a|á)(ñ|n)ez (Del|del) Campo"
    ) |>
    stringr::str_remove_all("(y|Y) (de|De) (la|La) Ant(a|á)rtica Chilena") |>
    stringr::str_squish()

  # revisar resultado
  if (length(resultado) != length(nombre_region)) {
    cli::cli_abort(
      "Largo de las clasificaciones no es el mismo que regiones entregadas"
    )
  }

  return(resultado)
}
