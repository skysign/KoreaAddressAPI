# Initialize
source(file.path(getwd(),"01 common", "init.R"))

# libraries
library(RUnit)
library(here)

pathInMiddle = "30 Analysis"
filename = "analysis.R"

f0 = file.path(getwd(),
               pathInMiddle,
               filename)

source(f0, encoding = "UTF-8")

# 시/구 testcases
test.TestCase_SiGu_Si <- function() {
  str1 = "서울시 동작구 사당동 O"
  r1 = SiGu_Si(str1, "서울시", "동작구")
  expected = "서울시"
  errorMsg = paste0("expected ", expected, " but ", r1[1])
	checkEquals(r1[1], expected, errorMsg)
	
	str2 = "서울특별시 동작구 사당동 O"
	r2 = SiGu_Si(str2, "서울특별시", "동작구")
	r2
	expected = "서울특별시"
	errorMsg = paste0("expected ", expected, " but ", r2[1])
	checkEquals(r1[1], expected, errorMsg)
}