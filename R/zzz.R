.onAttach <- function(libname, pkgname) {
  ver = 'Korea Address was released in 202004'
  msg = paste(pkgname, ver)
  packageStartupMessage(msg)
}

.onLoad <- function(libname, pkgname) {
  msg = 'Loading begins'
  packageStartupMessage(msg)
  
  zipFile = system.file("data", "JiBeon_Korea.zip", package = pkgname)
  csvFile = unz(zipFile, "JiBeon_Korea.csv")

  df = read.csv(csvFile)

  df$BeopJeongDongKoDeu = as.character(df$BeopJeongDongKoDeu)
  df$SiDoMyeong = as.character(df$SiDoMyeong)
  df$SiGunGuMyeong = as.character(df$SiGunGuMyeong)
  df$BeopJeongEupMyeonDongMyeong = as.character(df$BeopJeongEupMyeonDongMyeong)

  df$JiBeonBonBeon.BeonJi = as.character(df$JiBeonBonBeon.BeonJi)
  df$JiBeonBuBeon.Ho = as.character(df$JiBeonBuBeon.Ho)

  columns = c('BeopJeongDongKoDeu', 'SiDoMyeong', 'SiGunGuMyeong',
              'BeopJeongEupMyeonDongMyeong')
  df2 <- df[columns]

  df2['code_root'] = '0'
  df2['code_Si'] = substr(df2$BeopJeongDongKoDeu, 1, 2)
  df2['code_Gu'] = substr(df2$BeopJeongDongKoDeu, 3, 5)
  df2['code_Dong'] = substr(df2$BeopJeongDongKoDeu, 6, 8)

  siColumns = c('code_root', 'code_Si', 'SiDoMyeong')
  guColumns = c('code_Si', 'code_Gu', 'SiGunGuMyeong')
  dongColumns = c('code_Gu', 'code_Dong', 'BeopJeongEupMyeonDongMyeong')

  dfSi = df2[siColumns]
  dfGu = df2[guColumns]
  dfDong = df2[dongColumns]

  dfSi = unique(dfSi)
  dfGu = unique(dfGu)
  dfDong = unique(dfDong)

  newColumns = c('parent', 'child', 'HaengJeongGuYeok')

  colnames(dfSi) = newColumns
  colnames(dfGu) = newColumns
  colnames(dfDong) = newColumns

  printf <- function(...) {
    # print(sprintf(...))
  }

  dfsRec = list(dfSi, dfGu, dfDong)
  fnsRec = list(SiGu, GuDong)
  
  msg = 'Loading ends'
  packageStartupMessage(msg)
}
