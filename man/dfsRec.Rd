\name{dfsRec}
\alias{dfsRec}
\docType{data}
\title{
Korea administrative areas data frame according its hierarchy
}
\description{
Korea address is begun with wide administrative area, and we continue to write
more narrow administrative area into address, and finally it points particular
location.

As the origanization of Korea administrative areas, dfsRec contain each areas
according its hierarchy such as 'SiDoMyeong', 'SiGunGuMyeong' and 
'BeopJeongEupMyeonDongMyeong' so on.

In order to parse areas from wide to narrow, recursively, relative areas
are described as parent/child relationship like tree.
}
\usage{
data(dfsRec)
}
\format{
  The format is:
List of 3
 $ :'data.frame':	2 obs. of  3 variables:
  ..$ parent          : chr [1:2] "0" "0"
  ..$ child           : chr [1:2] "11" "41"
  ..$ HaengJeongGuYeok: chr [1:2] "????Ư????" "???⵵"
 $ :'data.frame':	26 obs. of  3 variables:
  ..$ parent          : chr [1:26] "11" "11" "11" "11" ...
  ..$ child           : chr [1:26] "110" "140" "170" "440" ...
  ..$ HaengJeongGuYeok: chr [1:26] "��?α?" "?߱?" "???걸" "??????" ...
 $ :'data.frame':	468 obs. of  3 variables:
  ..$ parent          : chr [1:468] "110" "110" "110" "110" ...
  ..$ child           : chr [1:468] "101" "184" "102" "111" ...
  ..$ HaengJeongGuYeok: chr [1:468] "û?" "?ξϵ?" "?ű???" "???ε?" ...
}
\details{
dfsRec[[1]] : SiDoMyeong
dfsRec[[2]] : SiGunGuMyeong
dfsRec[[3]] : BeopJeongEupMyeonDongMyeong

Continued to more narrow administrative area
}
\source{
https://www.juso.go.kr
}
\examples{
data(dfsRec)
}
\keyword{datasets}
