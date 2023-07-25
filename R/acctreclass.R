#' 核算维度_重分类更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteChe_acctreclass()
deleteCache_acctreclass<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Delete from rds_hrv_src_md_acctreclass_input Where FNumber in(select FNumber from rds_hrv_src_md_acctreclass)")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 核算维度_重分类更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertChe_acctreclass()
insertCache_acctreclass <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Insert into rds_hrv_src_md_acctreclass
    Select * from rds_hrv_src_md_acctreclass_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 核算维度_重分类更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllche_acctreclass()
deleteAllcache_acctreclass <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("truncate table rds_hrv_src_md_acctreclass_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
#' 核算维度_重分类查询
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ViewAcctreclass()
ViewAcctreclass <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("SELECT * from rds_hrv_src_md_acctreclass")
  data=tsda::sql_select2(token = token,sql = sql)
  col_selected = c('FNumber','FAccountItemActual','FAccountItem')
  dataview=data[ ,col_selected]
  dataview$编码=data$FNumber

  dataview$实际费用类别=data$FAccountItemActual

  dataview$会计科目=data$FAccountItem

  res=dataview[,c('编码','实际费用类别','会计科目')]

  return(res)


}

