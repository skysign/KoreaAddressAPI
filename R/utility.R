library(tokenizers)
library(stringr)

modified_juso <- function(juso) {
  tokens = tokenize_words(juso, simplify = TRUE)
  str = str_c(tokens, collapse = " ")

  return(str)
}

printf <- function(...) {
  print(sprintf(...))
}