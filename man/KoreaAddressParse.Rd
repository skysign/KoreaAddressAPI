\name{KoreaAddressParse}
\alias{KoreaAddressParse}
\title{Parse koreaAddress as per administrative area}
\usage{
df_cleaned = KoreaAddressParse(df_dirty)
}
\description{
KoreaAddressParse() parse the input korea address as per administrative aread.
Please see examples, to know how input data frame should be given
to KoreaAddressParse(), for more detail.
}
\examples{
dirtyJuso = c('서울특별시 \n\t   동작구 | |   사당동',
              '서울특별시 없는구 자당동')
dfDirtyJuso = data.frame(dirtyJuso)
dfDirtyJuso

dfCleaned = KoreaAddressParse(dfDirtyJuso)
dfCleaned
}
