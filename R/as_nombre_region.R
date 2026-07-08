#' Convertir códigos regionales a nombres de regiones
#'
#' Entregando códigos regionales (como los que aparecen en [territorial::territorios]), retorna los nombres de región correspondientes. Retorna NA si no corresponde con ninguna.
#'
#' @param codigos_regiones Códigos regionales en formato numérico
#'
#' @returns Vector con nombres de región
#' @export
as_nombre_region <- function(codigos_regiones) {
  if (!is.numeric(codigos_regiones)) {
    cli::cli_abort("Códigos regionales deben estar en formato numérico")
  }

  nombres_encontrados <- territorial::territorios$nombre_region[match(
    codigos_regiones,
    territorial::territorios$codigo_region
  )]

  return(nombres_encontrados)
}
