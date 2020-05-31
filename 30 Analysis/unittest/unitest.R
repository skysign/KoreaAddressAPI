# install.packages('RUnit')
library(RUnit)

# getwd()
# setwd(".")
# getwd()

f0 = file.path(getwd(),
          "30 Analysis",
          "testcases",
          "testcase_00.R")
f0

##  for single test files, e.g. outside a package context
testResult2 <- runTestFile(f0)



printTextProtocol(testResult2, showDetails = TRUE)