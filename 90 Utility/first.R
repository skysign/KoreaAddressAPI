library(tokenizers)

juso = "서울 \t	관악구 \n\n	남현동"

tokens = tokenize_words(juso) 

tokens
