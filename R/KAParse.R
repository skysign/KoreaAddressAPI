recJuso <- function(dirtyJuso, idx, df, columns, dfsRec, fnsRec) {
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
  fnsRec = list(SiGu, GuDong, DongBon, BonBu)

  df = data.frame(c(dirtyJuso))
  colnames(df) <- c('dirtyJuso')
  
  columns = c('SiDoMyeong', 'SiGunGuMyeong', 'BeopJeongEupMyeonDongMyeong','JiBeonBonBeon','JiBeonBuBeon')
  for(column in columns) {
    df[column] = 'x';
  }
  
  idx = 1;
  return(recJuso(dirtyJuso, idx, df, columns, KoreaAddressAPI::dfsRec, fnsRec))
}

#' @export
KAParse <- function(dfDirtyJuso, columnName) {
  df = data.frame(dfDirtyJuso)
  
  columns = c('SiDoMyeong', 'SiGunGuMyeong', 'BeopJeongEupMyeonDongMyeong','JiBeonBonBeon','JiBeonBuBeon')
  for(column in columns) {
    df[column] = '';
  }
  
  for(idxRow in 1:nrow(dfDirtyJuso)) {
    dirtyJuso = dfDirtyJuso[idxRow, columnName]
    dirtyJuso = as.character(dirtyJuso)
    
    # printf('KoreaAddressAPI index(%d) %s', idxRow, dirtyJuso)
    dirtyJuso = modified_juso(dirtyJuso)
    
    dfCleaned = cleanJuso(dirtyJuso)

    for(column in columns) {
      df[idxRow, column] = dfCleaned[1, column];
    }
  }
  
  return(df)
}