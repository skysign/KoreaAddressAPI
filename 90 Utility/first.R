
library(tokenizers)
library(stringr)


modified_juso <- function(str, juso) {
  # juso = "서울 \t	관악구 \n\n	남현동"
  
  tokens = tokenize_words(juso, simplify = TRUE) 
  
  str = str_c(tokens, collapse = " ")

  return(str)
}

juso = "서울 \t	관악구 \n\n	남현동"

clean_juso <- modified_juso(str, juso)
clean_juso