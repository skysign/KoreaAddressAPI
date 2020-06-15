.onAttach <- function(libname, pkgname) {
  ver = 'works based on 2020/04 released addresses of https://www.juso.go.kr'
  msg = paste(pkgname, ver)
  packageStartupMessage(msg)
}

.onLoad <- function(libname, pkgname) {
  
}
