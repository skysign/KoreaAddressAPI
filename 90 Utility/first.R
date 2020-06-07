library(tokenizers)
library(stringr)

juso = "서울 \t	관악구 \n\n	남현동"

tokens = tokenize_words(juso, simplify = TRUE) 
tokens

str = str_c(tokens, collapse = " ")
str
