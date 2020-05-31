# Initialize
source(file.path(getwd(), "01 common", "init.R"))

# install.packages('RUnit')
library(RUnit)

pathInMiddle = "30 Analysis/unittest/testcases"
filename = "testcase_00.R"

f0 = file.path(getwd(),
               pathInMiddle,
               filename)
f0

testResult2 <- runTestFile(f0)

printTextProtocol(testResult2, showDetails = TRUE)
