# look ahead
# 서울시\s(?=동작)
# 서울시 동작구 사당동
# 서울시 동망구 사당동
# 서울 동작 사당동
# 
# look behind
# (?<=서울시)\s동작
# 서울시 동작구 사당동
# 서울시 동망구 사당동
# 서울 동작 사당동

# 길이가 긴 것 부터, 짧은 순으로
# 11 서울특별시
# 11 서울시
# 11 서울

library(stringr)

str1 = "서울시 동작구 서울시 동작구 사당동 O"
str2 = "서울특별시 동작구 사당동 O"
str3 = "서울 동작구 사당동 O"
str4 = "서울시 동망구 사당동 X"
str5 = "서울 동작 사당동 O"

SiGu_Si <- function(str, parent, child) {
  pattern = paste0(parent, "(?=\\s", child, ")")
  print(pattern)
  # match = grep(pattern, str, perl = TRUE)
  match = str_match(str, pattern)
  
  if (is.na(match) > 0)
    return("")
  
  return(match)
}

SiGu_Gu <- function(str, parent, child) {
  pattern = paste0("(?<=", parent, "\\s)", child)
  print(pattern)
  # match = grep(pattern, str, perl = TRUE)
  match = str_match(str, pattern)
  
  if (is.na(match) > 0)
    return("")
  
  return(match)
}

SiGu <- function(str, parent, child) {
  print(str)
  match = SiGu_Si(str, parent, child)
  print(match)
  if (parent == match) {
    match = SiGu_Gu(str, parent, child)
    print(match)
    if (child == match) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}


match = SiGu(str1, "서울시", "동작구")
match

match = SiGu(str2, "서울시", "동작구")
match

match = SiGu(str3, "서울시", "동작구")
match

match = SiGu(str4, "서울시", "동작구")
match

match = SiGu(str5, "서울시", "동작구")
match



# match = grep(pattern, str1, perl = TRUE)
# 
# match
# 
# match = grep(pattern, str2, perl = TRUE)
# 
# match
# 
# match = grep(pattern, str3, perl = TRUE)
# 
# match

