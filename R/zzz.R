.onAttach <- function(libname, pkgname) {
  ver = 'works based on 202004 of https://www.juso.go.kr'
  msg = paste(pkgname, ver)
  packageStartupMessage(msg)
}

.onLoad <- function(libname, pkgname) {
  
}
