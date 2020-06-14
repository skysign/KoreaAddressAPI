\encoding{UTF8}
\name{KAParse}
\alias{KAParse}
\title{KAParse: Parse Korea address as per areas}
\usage{
KAParse(dfDirtyJuso)
}
\arguments{
\item{dfInput}{Input data frame}

\item{columnName}{column name of input data frame, which will be parsed}
}
\value{
data frame is reaturned and it have administrative areas as new columns
}
\description{
This function is to parse Korea address string as per administrative areas.
}
\details{
KAParse read only the column which is pointed by columnName parameter,
and add new columns for administrative areas such as SiDoMyeong, SiGunGuMyeong.
If we can't find appropriated administrative area, we mark 'x'
to its corresponding column.
}
\examples{
library(KoreaAddressAPI)

dirtyJuso = c('서울특별시 \n\t   동작구 | |   사당동',
              '서울특별시 없는구 자당동')
dfDirtyJuso = data.frame(dirtyJuso)
dfDirtyJuso

dfCleaned = KAParse(dfDirtyJuso)
dfCleaned

}
