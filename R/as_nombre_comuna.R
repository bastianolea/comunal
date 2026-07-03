#' Convertir códigos comunales a nombres de comunas
#'
#' Entregando códigos comunales (como los que aparecen en [territorial::territorios]), retorna los nombres de comuna correspondientes. Retorna NA si no corresponde con ninguna.
#'
#' @param codigos_comunas Códigos comunales en formato numérico
#'
#' @returns Vector con nombres de comuna
#' @export
as_nombre_comuna <- function(codigos_comunas) {
  if (!is.numeric(codigos_comunas)) {
    cli::cli_abort("Códigos comunales deben estar en formato numérico")
  }

  nombres_comunas <- territorial::territorios$nombre_comuna

  nombres_encontrados <- territorial::territorios$nombre_comuna[match(
    codigos_comunas,
    territorial::territorios$codigo_comuna
  )]

  return(nombres_encontrados)
}
