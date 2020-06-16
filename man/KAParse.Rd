\encoding{UTF8}
\name{KAParse}
\alias{KAParse}
\title{KAParse: Parse Korea address as per areas}
\usage{
KAParse(dfDirtyJuso, columnName)
}
\arguments{
\item{dfDirtyJuso}{Input data frame}

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
# Please visit below to see the correct example.
# https://github.com/skysign/KoreaAddressAPI/blob/master/examples/KRA_example.rmd
#
# To pass build without error, we should not describe anything in Korean, here.

library(KoreaAddressAPI)

dirtyJuso = c('',
              '')
dfDirtyJuso = data.frame(dirtyJuso)
dfDirtyJuso

dfCleaned = KAParse(dfDirtyJuso, 'dirtyJuso')
dfCleaned
}
