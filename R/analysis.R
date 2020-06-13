library(stringr)

ParentChild_parent <- function(str, parent, child) {
  pattern = paste0(parent, "(?=[\\s\\|\\t]?", child, ")")
  #print(pattern)
  match = str_match(str, pattern)
    
  if (is.na(match) > 0)
    return("")
    
  return(match)
}

ParentChild_Child <- function(str, parent, child) {
  pattern = paste0("(?<=", parent, "[\\s\\|\\t]?)", child)
  #print(pattern)
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
  #print(str)
  match = SiGu_Si(str, parent, child)
  #print(match)
  if (parent == match) {
    match = SiGu_Gu(str, parent, child)
    #print(match)
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
  #print(str)
  #print(parent)
  #print(child)
  match = GuDong_Gu(str, parent, child)
  #print(match)
  if (parent == match) {
    match = GuDong_Dong(str, parent, child)
    #print(match)
    if (child == match) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}