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

# str1 = "서울시 동작구 서울시 동작구 사당동 O"
str1 = "서울시 동작구 사당동 O"
str2 = "서울특별시 동작구 사당동 O"
str3 = "서울 동작구 사당동 O"
str4 = "서울시 동망구 사당동 X"
str5 = "서울 동작 사당동 O"
str6 = "서울시동작구사당동"     #공백이 없음
str7 = "서울시 동작구 사당동" #tab으로 나눔
str8 = "서울시|동작구|사당동"   #|으로 나눔

ParentChild_parent <- function(str, parent, child) {
  pattern = paste0(parent, "(?=[\\s\\|\\t]?", child, ")")
  print(pattern)
  # match = grep(pattern, str, perl = TRUE)
  match = str_match(str, pattern)
    
  if (is.na(match) > 0)
    return("")
    
  return(match)
}

ParentChild_Child <- function(str, parent, child) {
  pattern = paste0("(?<=", parent, "[\\s\\|\\t]?)", child)
  print(pattern)
  # match = grep(pattern, str, perl = TRUE)
  match = str_match(str, pattern)
  
  if (is.na(match) > 0)
    return("")
  
  return(match)
}

SiGu_Si <- function(str, parent, child) {
  return(ParentChild_parent(str, parent, child))
}

SiGu_Gu <- function(str, parent, child) {
  return(ParentChild_Child(str, parent, child))
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

GuDong_Gu <- function(str, parent, child) {
  return(ParentChild_parent(str, parent, child))
}

GuDong_Dong <- function(str, parent, child) {
  return(ParentChild_Child(str, parent, child))
}

GuDong <- function(str, parent, child) {
  print(str)
  print(parent)
  print(child)
  match = GuDong_gu(str, parent, child)
  print(match)
  if (parent == match) {
    match = GuDong_Dong(str, parent, child)
    print(match)
    if (child == match) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}


SiGu_Si(str1,"서울시","동작구")
SiGu_Gu(str1,"서울시","동작구")
SiGu(str1,"서울시","동작구")

GuDong_Gu(str1,"동작구","사당동")
GuDong_Dong(str1,"동작구","사당동")
GuDong(str1,"동작구","사당동")
# SiGuDong <- fuction(str, )
