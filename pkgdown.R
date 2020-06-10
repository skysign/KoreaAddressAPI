#install.packages("pkgdown")
#install.packages("usethis")

library(usethis)
library(pkgdown)

usethis::use_pkgdown()
# Run to build the website
pkgdown::build_site()
