eliminar_caracteres <- function(texto, porcentaje = 0.1) {
  purrr::map_chr(texto, \(x) {
    if (is.na(x)) {
      return(NA_character_)
    }
    chars <- stringr::str_split(x, "")[[1]]
    n <- length(chars)
    n_eliminar <- floor(n * porcentaje)
    if (n_eliminar == 0) {
      return(x)
    }
    idx <- sample.int(n, size = n_eliminar)
    paste(chars[-idx], collapse = "")
  })
}
