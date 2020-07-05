# We can't describe any Korean chracters into testcases.
# So, the tests below are all what we can check.
test_that("KRParse test", {
  Juso = c('',
           '')
  dfJuso = data.frame(Juso)

  columns = c('SiDoMyeong', 'SiGunGuMyeong', 'BeopJeongEupMyeonDongMyeong')
  df = KAParse(dfJuso, 'Juso')
  expect_equal(df[1, columns[1]] == 'x', TRUE)
  expect_equal(df[1, columns[2]] == 'x', TRUE)
  expect_equal(df[1, columns[3]] == 'x', TRUE)
  expect_equal(df[2, columns[1]] == 'x', TRUE)
  expect_equal(df[2, columns[2]] == 'x', TRUE)
  expect_equal(df[2, columns[3]] == 'x', TRUE)
})
