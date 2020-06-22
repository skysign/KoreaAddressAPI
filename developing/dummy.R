#' @title dummy function
#' @description Just to check build status in CI
#' @details This dummy funtion is only to verify build status in CI(Travis CI and appveyor).
#' @return dummy string is returned
#' @export
dummy <- function() {
  rtn = 'dummy 061700'
  print(rtn)
  return(rtn)
}