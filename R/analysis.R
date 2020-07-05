library(stringr)

#' @importFrom stringr str_match
ParentChild_parent <- function(str, parent, child) {
  pattern = paste0(parent, "(?=[\\s\\|\\t]?", child, ")")
  match = str_match(str, pattern)
    
  if (is.na(match) > 0)
    return("")
    
  return(match)
}

#' @importFrom stringr str_match
ParentChild_Child <- function(str, parent, child) {
  pattern = paste0("(?<=", parent, "[\\s\\|\\t]?)", child)
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
  match = SiGu_Si(str, parent, child)

  if (parent == match) {
    match = SiGu_Gu(str, parent, child)

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
  match = GuDong_Gu(str, parent, child)

  if (parent == match) {
    match = GuDong_Dong(str, parent, child)

    if (child == match) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}

DongBon_Dong <- function(str, parent, child) {
  return(ParentChild_parent(str, parent, child))
}

DongBon_Bon <- function(str, parent, child) {
  return(ParentChild_Child(str, parent, child))
}

DongBon <- function(str,parent,child){
  match = DongBon_Dong(str, parent, child)
  if (parent == match) {
    match = DongBon_Bon(str, parent, child)
    if (child == match) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}

#' @importFrom stringr str_match
BonBu_Bon <- function(str,parent,child){
  pattern = paste0(parent, "(?=[\\s\\|\\t\\-]?", child, ")")
  match = str_match(str, pattern)
  
  if (is.na(match) > 0)
    return("")
  
  return(match)
}

#' @importFrom stringr str_match
BonBu_Bu <- function(str,parent,child) {
  pattern = paste0("(?<=", parent, "[\\s\\|\\t\\-]?)", child)
  match = str_match(str, pattern)

  if (is.na(match) > 0)
    return("")
  
  return(match)
}

BonBu <- function(str,parent,child){
  match = BonBu_Bon(str, parent, child)
  if (parent == match) {
    match = BonBu_Bu(str, parent, child)
    if (child == match) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}
