library(tokenizers)
library(stringr)

#' @importFrom tokenizers tokenize_words
#' @importFrom stringr str_c 
modified_juso <- function(juso) {
  tokens = tokenize_words(juso, simplify = TRUE)
  str = str_c(tokens, collapse = " ")

  return(str)
}

printf <- function(...) {
  print(sprintf(...))
}