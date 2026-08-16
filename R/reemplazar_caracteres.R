reemplazar_caracteres <- function(
  texto,
  porcentaje = 0.1,
  caracteres = c(letters, LETTERS)
) {
  purrr::map_chr(texto, \(x) {
    if (is.na(x)) {
      return(NA_character_)
    }
    chars <- stringr::str_split(x, "")[[1]]
    n <- length(chars)
    n_reemplazar <- floor(n * porcentaje)
    if (n_reemplazar == 0) {
      return(x)
    }
    idx <- sample.int(n, size = n_reemplazar)
    chars[idx] <- sample(caracteres, size = n_reemplazar, replace = TRUE)
    paste(chars, collapse = "")
  })
}
