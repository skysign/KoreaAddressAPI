recJuso <- function(dirtyJuso, idx, df, columns, dfs, fnsRec) {
  if(idx > length(fnsRec)) {
    # printf('length(fnsRec) %d', length(fnsRec))
    return(df)
  }
  
  dfParent = dfsRec[[idx]]
  dfChildren = dfsRec[[idx+1]]
  
  # printf('recJuso idx %d', idx)
  
  for(idxParent in 1:nrow(dfParent)) {
    parentCode = dfParent$child[idxParent]
    parentHaengJeongGuYeok = dfParent$HaengJeongGuYeok[idxParent]
    # printf('parent %s %s', parentCode, parentHaengJeongGuYeok)
    
    dfChild = dfChildren[dfChildren$parent == parentCode, ]
    
    for(idxChild in 1:nrow(dfChild)) {
      childCode = dfChild$child[idxChild]
      childHaengJeongGuYeok = dfChild$HaengJeongGuYeok[idxChild]
      # printf('child %s %s', idxChild, childHaengJeongGuYeok)
      
      if(TRUE == fnsRec[[idx]](dirtyJuso,
                              parentHaengJeongGuYeok,
                              childHaengJeongGuYeok)) {
        df[1, idx+1] = parentHaengJeongGuYeok
        df[1, idx+1+1] = childHaengJeongGuYeok
        idx = idx+1
        # printf('before recJuso idx %d %s', idx, paste(parentHaengJeongGuYeok, childHaengJeongGuYeok))
        return(recJuso(dirtyJuso, idx, df, columns, dfsRec, fnsRec))
      }
    }
  }
  
  return(df)
}

cleanJuso <- function(dirtyJuso) {
  fnsRec = list(SiGu, GuDong)

  df = data.frame(c(dirtyJuso))
  colnames(df) <- c('dirtyJuso')
  
  columns = c('SiDoMyeong', 'SiGunGuMyeong', 'BeopJeongEupMyeonDongMyeong')
  for(column in columns) {
    df[column] = 'x';
  }
  
  idx = 1;
  return(recJuso(dirtyJuso, idx, df, columns, dfsRec, fnsRec))
}

#' @title KAParse: Parse Korea address as per areas
#' @description This function is to parse Korea address string as per administrative areas.
#' @param dfInput Input data frame
#' @param columnName column name of input data frame, which will be parsed 
#' @return data frame is reaturned and it have administrative areas as new columns
#' @details KAParse read only the column which is pointed by columnName parameter, and add new columns for administrative areas such as SiDoMyeong, SiGunGuMyeong. If we can't find appropriated administrative area, we mark 'x' to its corresponding column.
#' @examples
#' @encoding UTF8
#' library(KoreaAddressAPI)
#'
#' dirtyJuso = c('서울특별시 \n\t   동작구 | |   사당동',
#' '서울특별시 없는구 자당동')
#' dfDirtyJuso = data.frame(dirtyJuso)
#' dfDirtyJuso
#'
#' dfCleaned = KAParse(dfDirtyJuso)
#' dfCleaned
#'
#' # We know that Korean chracters above are not displayed correctly.
#' # However, KAParse() works fine with Korean characters, don't worry about it.
#' # Please visit below to see the fine example of KAParse() function.
#' # https://github.com/skysign/KoreaAddressAPI/blob/master/examples/KRA_example.rmd
#' #
#' # It is due to that roxygen2 don't support UTF-8 currently.
#' # See here(https://github.com/r-lib/roxygen2/issues/787) for more detail regarding roxygen2/UTF-8.
#'
#' @rdname KAParse
#' @export
KAParse <- function(dfDirtyJuso) {
  df = data.frame(dfDirtyJuso)
  
  columns = c('SiDoMyeong', 'SiGunGuMyeong', 'BeopJeongEupMyeonDongMyeong')
  for(column in columns) {
    df[column] = '';
  }
  
  for(idxRow in 1:nrow(dfDirtyJuso)) {
    dirtyJuso = dfDirtyJuso$dirtyJuso[idxRow]
    dirtyJuso = as.character(dirtyJuso)
    dirtyJuso = modified_juso(dirtyJuso)
    
    # printf('KoreaAddressAPI index(%d) %s', idxRow, dirtyJuso)
    
    dfCleaned = cleanJuso(dirtyJuso)
    
    for(column in columns) {
      df[idxRow, column] = dfCleaned[1, column];
    }
  }
  
  return(df)
}