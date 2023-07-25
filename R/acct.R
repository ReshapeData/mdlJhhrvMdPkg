#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_acct()
deleteCache_acct<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Delete from rds_hrv_src_md_acct_input Where FAccountNumber in(select FAccountNumber from rds_hrv_src_md_acct)")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertCache_acct()
insertCache_acct <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Insert into rds_hrv_src_md_acct
    Select * from rds_hrv_src_md_acct_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllcache_acct()
deleteAllcache_acct <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("truncate table rds_hrv_src_md_acct_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
#' 科目查询
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ViewAcct()
ViewAcct <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("SELECT * from rds_hrv_src_md_acct")
  data=tsda::sql_select2(token = token,sql = sql)
  col_selected = c('FAccountNumber','FAccountName','FAccountNameComplete','FBalanceType','FAccountType',
                   'FCurrencyTranslation','FLexitemProperty','FStatus','FFirstAcct')
  dataview=data[ ,col_selected]
  dataview$科目编码=data$FAccountNumber
  dataview$科目名称=data$FAccountName
  dataview$科目名称全名=data$FAccountNameComplete
  dataview$余额方向=data$FBalanceType
  dataview$科目类别=data$FAccountType
  dataview$外币核算=data$FCurrencyTranslation
  dataview$核算维度= data$FLexitemProperty
  dataview$数据状态=data$FStatus
  dataview$一级科目=data$FFirstAcct
  res=dataview[,c('科目编码','科目名称','科目名称全名','余额方向','科目类别','外币核算','核算维度','数据状态','一级科目')]


  return(res)


}
